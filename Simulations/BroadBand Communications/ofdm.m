clear all; close all; clc;
%% OFDM simulation

% Initializing parameters
Nsc = input('OFDM symbol size (Number of subcarriers) N = '); % OFDM symbol size (Number of subcarriers).
M = input('Modulation order M = '); % Modulation order
Nsmb = input('Number of OFDM symbols to be simulated = '); % Number of OFDM symbols to be simulated
Ne = 3000; % Number of bits in error
str=-20; 
stp=input('SNR starts at -20 dB, with step size [dB] = '); 
Esnr=input('Last value of SNR [dB] = ');
CP_LEN = 10;
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp('OFDM Simulation using Monte Carlo for the BER evaluation');
%disp(['Modulation family = ',num2str(M),'-',ht.type]);
disp(['Number of Subcarriers N = ',num2str(Nsc)]);
disp(['SNR = ',num2str(str),':',num2str(stp),':',num2str(Esnr)]);
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
c=0;
for snr=str:stp:Esnr
    c =c+1;
%% Monte Carlo Simulation loop
disp(['STEP ',num2str(c),' of ',num2str(length(str:stp:Esnr)),' :Processing SNR = ',num2str(snr)]);
nEr = 0; % Number of collected errors
nSmb = 0; % Number of simulated OFDM symbols
while ((nEr < Ne) && (nSmb < Nsmb))

    % Transmitter
    Dg=randi([0 M-1],1,Nsc); % Data Generation
    Ncp=length(Dg(1,:))*0.0625;
    Dmod= qammod(Dg,M);%modulate(ht,Dg); % Baseband modulation (mapping)
    dAM_mod=ifft(Dmod,Nsc);
    % Cyclic Prefixing
    cp = [dAM_mod(end-CP_LEN+1:end) dAM_mod];
    % Adding Noise using AWGN
    dAM_mod_noisy=awgn(cp,snr,'measured');
    % Remove cyclic prefix part
    dAM_mod_noisy(1:CP_LEN) = [];
    cpr = dAM_mod_noisy(1:length(dAM_mod_noisy(1,:)));
    % Amplitude demodulation (DFT using fast version FFT)
    amdemod=fft(cpr,Nsc);
    y=qamdemod(amdemod,M); %demodulate(hr,amdemod);
    [n, r]=biterr(Dg,y);
    nEr=nEr+r;
    nSmb=nSmb+1;
end
berRslt(c)=nEr/(log2(M)*nSmb);
end
snr=str:stp:Esnr;
semilogy(snr,berRslt,'-ok','linewidth',2,'markerfacecolor','k','markersize',8,'markeredgecolor','k');grid;
title('OFDM Bit Error Rate vs SNR');
ylabel('Bit Error Rate');
xlabel('SNR [dB]');
%legend(['BER, N = ', num2str(Nsc),' ',num2str(M),'-',ht.type]);