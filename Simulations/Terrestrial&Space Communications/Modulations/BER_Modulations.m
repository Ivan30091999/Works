clc; clear all;
N=1000000;
d=rand(1,N)>0.5;
x=2*d-1;
EbN0dB=-10:2:20;
sinBER_rayleigh=zeros(1,length(EbN0dB));
for i=1:length(EbN0dB)
    noise=1/sqrt(2)*(randn(1,N)+1i*randn(1,N));
    h=1/sqrt(2)*(randn(1,N)+1i*randn(1,N));
    n=noise*10^(-EbN0dB(i)/20);
    y_awgn=x+n;
    y_rayleigh=h.*x+n;
    y_rayleigh_cap=y_rayleigh./h;
    r_rayleigh=real(y_rayleigh_cap)>0;
    r_awgn=real(y_awgn)>0;
    simBER_rayleigh(i)=sum(xor(d,r_rayleigh));
    simBER_awgn(i)=sum(xor(d,r_awgn));
end

simBER_rayleigh=simBER_rayleigh/N;
simBER_awgn=simBER_awgn/N;
EbN0=10.^(EbN0dB/10);
theoretical_rayleigh=0.5*(1-sqrt(EbN0./(1+EbN0)));
theoretical_awgn=0.5*erfc(sqrt(EbN0));
semilogy(EbN0dB,simBER_rayleigh,'g*-','LineWidth',2);hold on;
semilogy(EbN0dB,simBER_awgn,'r*-','LineWidth',2);hold on;
semilogy(EbN0dB,theoretical_rayleigh,'ko','LineWidth',2);hold on;
semilogy(EbN0dB,theoretical_awgn,'bo','LineWidth',2);grid on;
axis([-10 20 10^-5 1.2]);
legend('Rayleigh Channel Simulation', 'AWGN Channel Simulation', 'Rayleigh Channel Theoretical', 'AWGN Channel Theoretical');
title('BER for BPSK');
xlabel('Eb/N0[dB]');
ylabel('BER');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure();
clear all;
snrdB_min=0;snrdB_max=10;
snrdB=snrdB_min:1:snrdB_max;
Nsymbols=[512 1024];
snr=10.^(snrdB/10);
h=waitbar(0,'SNR_Iteration');
len_snr=length(snrdB);
for j=1:len_snr
    waitbar(j/len_snr);
    sigma=sqrt(1/(2*snr(j)));
    error_count_512=0;
    error_count_1024=0;
    for k=1:Nsymbols(1)
        d=round(rand(1));
        if d==0
            x_d=1;
            x_q=0;
        else
            x_d=0;
            x_q=1;
        end
        n_d=sigma*randn(1);
        n_q=sigma*randn(1);
        y_d=x_d+n_d;
        y_q=x_q+n_q;
        if y_d > y_q
            d_est=0;
        else
            d_est=1;
        end
        if d_est ~= d
            error_count_512=error_count_512+1;
        end
    end
    for k=1:Nsymbols(2)
        d=round(rand(1));
        if d==0
            x_d=1;
            x_q=0;
        else
            x_d=0;
            x_q=1;
        end
        n_d=sigma*randn(1);
        n_q=sigma*randn(1);
        y_d=x_d+n_d;
        y_q=x_q+n_q;
        if y_d > y_q
            d_est=0;
        else
            d_est=1;
        end
        if d_est ~= d
            error_count_1024=error_count_1024+1;
        end
    end
    errors_512(j)=error_count_512;
    errors_1024(j)=error_count_1024;
end
close(h)
ber_sim_512=errors_512/Nsymbols(1);
ber_sim_1024=errors_1024/Nsymbols(2);
ber_theor=qfunc(sqrt(snr));
subplot(121);
semilogy(snrdB,ber_theor,snrdB,ber_sim_512,'o');
axis([snrdB_min snrdB_max 0.0001 1]);
xlabel('SNR[dB]');
ylabel('BER');
legend('Theoretical M=512', 'Simulation M=512');
subplot(122);
semilogy(snrdB,ber_theor,snrdB,ber_sim_1024,'o');
axis([snrdB_min snrdB_max 0.0001 1]);
xlabel('SNR[dB]');
ylabel('BER');
legend('Theoretical M=1024', 'Simulation M=1024');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure();
clear; clc;
N=1000000;
EbN0dB=-10:2:10;
data=randn(1,N)>=0;
oddData=data(1:2:end);
evenData=data(2:2:end);
qpskModulated=sqrt(1/2)*(1i*(2*oddData-1)+(2*evenData-1));
M=4;
Rm=log2(M);
Rc=1;
BER=zeros(1,length(EbN0dB));
index=1;
for i=EbN0dB
    EbN0=10.^(i/10);
    noiseSigma=sqrt(1./(2*Rm*Rc*EbN0));
    noise=noiseSigma*(randn(1,length(qpskModulated))+1i*randn(1,length(qpskModulated)));
    received=qpskModulated+noise;
    detected_real=real(received)>=0;
    detected_img=imag(received)>=0;
    estimatedBits=reshape([detected_img;detected_real],1,[]);
    BER(index)=sum(xor(data,estimatedBits))/length(data);
    index=index+1;
end
subplot(121);
plotHandle=semilogy(EbN0dB,BER,'r--');
set(plotHandle,'LineWidth',1.5);
title('BER for QPSK');
xlabel('SNR[dB]');
ylabel('BER');
grid on; hold on;
theoreticalBER=0.5*erfc(sqrt(10.^(EbN0dB/10)));
plotHandle=semilogy(EbN0dB,theoreticalBER,'b*');
set(plotHandle,'LineWidth',1.5);
legend('QPSK Simulation', 'QPSK Theoretical');
grid on;

M=8;
Rm=log2(M);
Rc=1;
BER=zeros(1,length(EbN0dB));
index=1;
for i=EbN0dB
    EbN0=10.^(i/10);
    noiseSigma=sqrt(1./(2*Rm*Rc*EbN0));
    noise=noiseSigma*(randn(1,length(qpskModulated))+1i*randn(1,length(qpskModulated)));
    received=qpskModulated+noise;
    detected_real=real(received)>=0;
    detected_img=imag(received)>=0;
    estimatedBits=reshape([detected_img;detected_real],1,[]);
    BER(index)=sum(xor(data,estimatedBits))/length(data);
    index=index+1;
end
subplot(122);
plotHandle=semilogy(EbN0dB,BER,'r--');
set(plotHandle,'LineWidth',1.5);
title('BER for 8PSK');
xlabel('SNR[dB]');
ylabel('BER');
grid on; hold on;
theoreticalBER=0.5*erfc(sqrt(10.^(EbN0dB/10)));
plotHandle=semilogy(EbN0dB,theoreticalBER,'b*');
set(plotHandle,'LineWidth',1.5);
legend('8PSK Simulation', '8PSK Theoretical');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
N=1000000;
EbN0dB = -10:2:20;
M=16;
Vect= (0:M-1);
refArray = qammod(Vect,M,'UnitAveragePower',true);
symErrSimulated = zeros(1,length(EbN0dB));
k=log2 (M) ;
EsN0dB = EbN0dB + 10*log10(k);
data=ceil(M.*rand(N, 1))-1;
s=refArray(data+1);
refI = real(refArray);
refQ = imag(refArray);
index=1;
% figure(1);
%
% subplot (1,2,1);
%
% plot(real(s),imag(s),'r*');
% title('Constalation diagram');
% xlabel('I component');
% ylabel('Q component');
%
% subplot (1,2,2);
for x=EsN0dB,
noiseVariance = 1/(10.^(x/10));
noiseSigma = sqrt (noiseVariance/2);
noise = noiseSigma* (randn(size(s))+1i*randn(size(s)));
received = s + noise;
r_i = real (received);
r_q = imag(received);
r_i_repmat = repmat(r_i,M,1);
r_q_repmat = repmat(r_q,M,1);
% plot(r_i,r_q,'*');
% title(['Received symols for Eb/N0 in dB']);
% xlabel('I component');
% ylabel('Q component');
distance = zeros(M,N);
minDistIndex=zeros (N, 1);
for j=1:N
distance(:,j) = (r_i_repmat(:,j)-refI').^2+(r_q_repmat(:,j)-refQ').^2;
[pom,minDistIndex(j)]=min(distance(:,j));
end
y = minDistIndex - 1;
dataCap = y;
symErrSimulated(1,index) = sum(dataCap ~=data) /N;
index=index+1;
end
figure;
EbN0lin = 10.^(EbN0dB/10);
symErrTheory = 2*(1-1/sqrt (M) )*erfc (sqrt (3/2*k*EbN0lin/ (M-1)));
semilogy (EbN0dB, symErrTheory, 'r-');hold on;
semilogy (EbN0dB, symErrSimulated, 'b*');
legend ('16QAM-Theoretical', '16QAM-Simulation');
xlabel ('Eb/N0 (dB)');
ylabel ('Symbol error rate (Ps)');
grid on

clear
N=1000000;
EbN0dB = -10:2:20;
M=32;
Vect= (0:M-1);
refArray = qammod(Vect,M,'UnitAveragePower',true);
symErrSimulated = zeros(1,length(EbN0dB));
k=log2 (M) ;
EsN0dB = EbN0dB + 10*log10(k);
data=ceil(M.*rand(N, 1))-1;
s=refArray(data+1);
refI = real(refArray);
refQ = imag(refArray);
index=1;
% figure(1);
%
% subplot (1,2,1);
%
% plot(real(s),imag(s),'r*');
% title('Constalation diagram');
% xlabel('I component');
% ylabel('Q component');
%
% subplot (1,2,2);
for x=EsN0dB,
noiseVariance = 1/(10.^(x/10));
noiseSigma = sqrt (noiseVariance/2);
noise = noiseSigma* (randn(size(s))+1i*randn(size(s)));
received = s + noise;
r_i = real (received);
r_q = imag(received);
r_i_repmat = repmat(r_i,M,1);
r_q_repmat = repmat(r_q,M,1);
% plot(r_i,r_q,'*');
% title(['Received symols for Eb/N0 in dB']);
% xlabel('I component');
% ylabel('Q component');
distance = zeros(M,N);
minDistIndex=zeros (N, 1);
for j=1:N
distance(:,j) = (r_i_repmat(:,j)-refI').^2+(r_q_repmat(:,j)-refQ').^2;
[pom,minDistIndex(j)]=min(distance(:,j));
end
y = minDistIndex - 1;
dataCap = y;
symErrSimulated(1,index) = sum(dataCap ~=data) /N;
index=index+1;
end
figure
EbN0lin = 10.^(EbN0dB/10);
symErrTheory = 2*(1-1/sqrt (M) )*erfc (sqrt (3/2*k*EbN0lin/ (M-1)));
semilogy (EbN0dB, symErrTheory, 'r-');hold on;
semilogy (EbN0dB, symErrSimulated, 'b*');
legend ('32QAM-Theoretical', '32QAM-Simulation');
xlabel ('Eb/N0 (dB)');
ylabel ('Symbol error rate (Ps)');
grid on

clear
N=1000000;
EbN0dB = -10:2:20;
M=64;
Vect= (0:M-1);
refArray = qammod(Vect,M,'UnitAveragePower',true);
symErrSimulated = zeros(1,length(EbN0dB));
k=log2 (M) ;
EsN0dB = EbN0dB + 10*log10(k);
data=ceil(M.*rand(N, 1))-1;
s=refArray(data+1);
refI = real(refArray);
refQ = imag(refArray);
index=1;
% figure(1);
%
% subplot (1,2,1);
%
% plot(real(s),imag(s),'r*');
% title('Constalation diagram');
% xlabel('I component');
% ylabel('Q component');
%
% subplot (1,2,2);
for x=EsN0dB,
noiseVariance = 1/(10.^(x/10));
noiseSigma = sqrt (noiseVariance/2);
noise = noiseSigma* (randn(size(s))+1i*randn(size(s)));
received = s + noise;
r_i = real (received);
r_q = imag(received);
r_i_repmat = repmat(r_i,M,1);
r_q_repmat = repmat(r_q,M,1);
% plot(r_i,r_q,'*');
% title(['Received symols for Eb/N0 in dB']);
% xlabel('I component');
% ylabel('Q component');
distance = zeros(M,N);
minDistIndex=zeros (N, 1);
for j=1:N
distance(:,j) = (r_i_repmat(:,j)-refI').^2+(r_q_repmat(:,j)-refQ').^2;
[pom,minDistIndex(j)]=min(distance(:,j));
end
y = minDistIndex - 1;
dataCap = y;
symErrSimulated(1,index) = sum(dataCap ~=data) /N;
index=index+1;
end
figure
EbN0lin = 10.^(EbN0dB/10);
symErrTheory = 2*(1-1/sqrt (M) )*erfc (sqrt (3/2*k*EbN0lin/ (M-1)));
semilogy (EbN0dB, symErrTheory, 'r-');hold on;
semilogy (EbN0dB, symErrSimulated, 'b*');
legend ('64QAM-Theoretical', '64QAM-Simulation');
xlabel ('Eb/N0 (dB)');
ylabel ('Symbol error rate (Ps)');
grid on