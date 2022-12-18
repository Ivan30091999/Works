clear all; clc;
figure();
N=100;
noiseVariance=0.5;
data=randn(1,N)>=0;
Rb=1e3;
amplitude=1;
Tb=1/Rb;
Fs=16*Rb;
oversampling=32;
Ts=1/Fs;
Tb=1/Rb;
output=[];
for count=1:length(data)
    for tempTime=0:Ts:Tb-Ts
        output=[output amplitude*(-1)^(1+data(count))];
    end
end
time=0:Ts:Tb*length(data)-Ts;
nrzData=output;
subplot(411);
stem(data);
xlabel('Samples');
ylabel('Amplitude');
title('Input Binary Symbols');
axis([0,N,-0.5,1.5]);
subplot(412);
plotHandle=plot(time,nrzData);
xlabel('Time');
ylabel('Amplitude');
title('Symbols after NRZ coding');
set(plotHandle,'LineWidth',2.5);
maxTime=max(time);
maxAmp=max(nrzData);
minAmp=min(nrzData);
axis([0,maxTime,minAmp-1,maxAmp+1]);
grid on;
Fc=2*Rb;
osc=sin(2*pi*Fc*time);
bpskModulated=nrzData.*osc;
subplot(413);
plot(time,bpskModulated);
xlabel('Time');
ylabel('Amplitude');
title('BPSK Modulated Data');
maxTime=max(time);
maxAmp=max(nrzData);
minAmp=min(nrzData);
axis([0,maxTime,minAmp-1,maxAmp+1]);
noise=sqrt(noiseVariance)*randn(1,length(bpskModulated));
received=bpskModulated+noise;
subplot(414);
plot(time,received);
xlabel('Time');
ylabel('Amplitude');
title('BPSK Moduated Data + Noise');
v=received.*osc;
integrationBase=0:1/Fs:Tb-1/Fs;
for i=0:(length(v)/(Tb*Fs))-1
    y(i+1)=trapz(integrationBase,v(int32(i*Tb*Fs+1):int32((i+1)*Tb*Fs)));
end
estimatedBits=(y>=0);
subplot(313);
stem(estimatedBits);
xlabel('Samples');
ylabel('Amplitude');
title('Decoded data values');
axis([0,N,-0.5,1.5]);
BER=sum(xor(data,estimatedBits))/length(data);
subplot(311);
Q=zeros(1,length(nrzData));
stem(nrzData,Q);
ylabel('y');
title('BPSK at Reception');
axis([-1.5,1.5,-1,1]);
subplot(312);
Q=zeros(1,length(y));
stem(y/max(y),Q);
xlabel('x');
ylabel('y');
title('BPSK at Reception with Noise');
axis([-1.5,1.5,-1,1]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%figure();
clear; clc;
N=1000000;
EbN0dB=-6:2:0;
N=N+rem((3-rem(N,3)),3);
x=randn(1,N)>=0.5;
inputSymBin=reshape(x,3,N/3)';
[rows,cols]=size(inputSymBin);
binaryCoded=zeros(rows,cols);
for i=1:rows
    binaryCoded(i,1)=inputSymBin(i,1);
    for j=2:cols
        binaryCoded(i,j)=xor(binaryCoded(i,j-1),inputSymBin(i,j));
    end
end
g=binaryCoded;
b=bin2dec(num2str(g,'%-1d'))';
map=[1.414 0.707;0.707 1.414;-0.707 1.414;-1.414 0.707;-1.414 -0.707;-0.707 -1.414;0.707 -1.414;1.414 -0.707];
s=map(b(:)+1,1)+1i*map(b(:)+1,2);
M=8;
Rm=log2(M);
Rc=1;
simulatedBER=zeros(1,length(EbN0dB));
theoreticalBER=zeros(1,length(EbN0dB));
count=1;

for i=0:10:20
    figure;
    EbN0=10.^(i/10);
    noiseSigma=sqrt(2).*sqrt(1./(2*Rm*Rc*EbN0));
    n=noiseSigma.*(randn(1,length(s))+1i*randn(1,length(s)))';
    y=s+n;
    plot(real(y),imag(y),'r*');hold on;
    plot(real(s),imag(s),'ko','MarkerfaceColor','g','MarkerSize',7); hold off
    title(['8PSK for EbN0dB=',num2str(i),'dB']);
    demodSymbols=zeros(1,length(y));
    for j=1:length(y)
       [minVal,minIndex]=min(sqrt((real(y(j))-map(:,1)).^2+(imag(y(j))-map(:,2)).^2));
       demodSymbols(j)=minIndex-1;
    end
    demodBits=dec2bin(demodSymbols)-'0';
    [rows, cols]=size(demodBits);
    grayCoded=zeros(rows,cols);
    for i=1:rows
        grayCoded(i,:)=[demodBits(i,1) xor(demodBits(i,2:cols),demodBits(i,1:cols-1))];
    end
end

N=N+rem((4-rem(N,4)),4);
x=randn(1,N)>=0.5;
inputSymBin=reshape(x,4,N/4)';
[rows,cols]=size(inputSymBin);
binaryCoded=zeros(rows,cols);
for i=1:rows
    binaryCoded(i,1)=inputSymBin(i,1);
    for j=2:cols
        binaryCoded(i,j)=xor(binaryCoded(i,j-1),inputSymBin(i,j));
    end
end
g=binaryCoded;
b=bin2dec(num2str(g,'%-1d'))';

M=16;
%x = (0:M-1)';
s = pskmod(b,M)';
%s=map(b(:)+1,1)+1i*map(b(:)+1,2);

Rm=log2(M);
Rc=1;
simulatedBER=zeros(1,length(EbN0dB));
theoreticalBER=zeros(1,length(EbN0dB));
count=1;

for i=0:10:20
    figure;
    EbN0=10.^(i/10);
    noiseSigma=sqrt(2).*sqrt(1./(2*Rm*Rc*EbN0));
    n=noiseSigma.*(randn(1,length(s))+1i*randn(1,length(s)))';
    y=s+n;
    plot(real(y),imag(y),'r*');hold on;
    plot(real(s),imag(s),'ko','MarkerfaceColor','g','MarkerSize',7); hold off
    title(['16PSK for EbN0dB=',num2str(i),'dB']);
    demodSymbols=zeros(1,length(y));
    for j=1:length(y)
       [minVal,minIndex]=min(sqrt((real(y(j))-map(:,1)).^2+(imag(y(j))-map(:,2)).^2));
       demodSymbols(j)=minIndex-1;
    end
    demodBits=dec2bin(demodSymbols)-'0';
    [rows, cols]=size(demodBits);
    grayCoded=zeros(rows,cols);
    for i=1:rows
        grayCoded(i,:)=[demodBits(i,1) xor(demodBits(i,2:cols),demodBits(i,1:cols-1))];
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear; clc;
N=10000;
EbN0dB=[0 13 18];
M=[16 32 64];
refArray_16=1/sqrt(10)*[3-3i,-3-1i,-3+3i,-3+1i,-1-3i,-1-1i,-1+3i,-1+1i,3-3i,3-1i,3+3i,3+1i,1-3i,1-1i,1+3i,1+1i];
x=(0:M(2)-1)';
refArray_32=qammod(x,M(2),'UnitAveragePower',true);
x=(0:M(3)-1)';
refArray_64=qammod(x,M(3),'UnitAveragePower',true);

symErrSimulated=zeros(1,length(EbN0dB));
k=log2(M);
EsN0dB=EbN0dB+10*log10(k);
data=ceil(M(1).*rand(N,1))-1;
s_16=refArray_16(data(:,1)+1);
refI_16=real(refArray_16);
refQ_16=imag(refArray_16);

data=ceil(M(2).*rand(N,1))-1;
s_32=refArray_32(data(:,1)+1);
refI_32=real(refArray_32);
refQ_32=imag(refArray_32);

data=ceil(M(3).*rand(N,1))-1;
s_64=refArray_64(data(:,1)+1);
refI_64=real(refArray_64);
refQ_64=imag(refArray_64);

index=1;

for x=EsN0dB
    figure();
    subplot(121);
    plot(real(s_16),imag(s_16),'r+');
    title('Constallation diagram 16QAM');
    xlabel('I');
    ylabel('Q');
    noiseVariance=1/(10.^(x/10));
    noiseSigma=sqrt(noiseVariance/2);
    noise=noiseSigma*(randn(size(s_16))+1i*randn(size(s_16)));
    received=s_16+noise;
    r_i=real(received);
    r_q=imag(received);
    r_i_repmat=repmat(r_i,M(1),1);
    r_q_repmat=repmat(r_q,M(1),1);
    subplot(122);
    plot(r_i,r_q,'+');
    title(['Received Symbols for Eb/N0=' num2str((EbN0dB(index))) 'dB']);
    xlabel('I');
    ylabel('Q');
    index=index+1;
end

index=1;

for x=EsN0dB
    figure();
    subplot(121);
    plot(real(s_32),imag(s_32),'r+');
    title('Constallation diagram 32QAM');
    xlabel('I');
    ylabel('Q');
    noiseVariance=1/(10.^(x/10));
    noiseSigma=sqrt(noiseVariance/2);
    noise=noiseSigma*(randn(size(s_32))+1i*randn(size(s_32)));
    received=s_32+noise;
    r_i=real(received);
    r_q=imag(received);
    r_i_repmat=repmat(r_i,M(2),1);
    r_q_repmat=repmat(r_q,M(2),1);
    subplot(122);
    plot(r_i,r_q,'+');
    title(['Received Symbols for Eb/N0=' num2str((EbN0dB(index))) 'dB']);
    xlabel('I');
    ylabel('Q');
    index=index+1;
end

index=1;

for x=EsN0dB
    figure();
    subplot(121);
    plot(real(s_64),imag(s_64),'r+');
    title('Constallation diagram 64QAM');
    xlabel('I');
    ylabel('Q');
    noiseVariance=1/(10.^(x/10));
    noiseSigma=sqrt(noiseVariance/2);
    noise=noiseSigma*(randn(size(s_64))+1i*randn(size(s_64)));
    received=s_64+noise;
    r_i=real(received);
    r_q=imag(received);
    r_i_repmat=repmat(r_i,M(3),1);
    r_q_repmat=repmat(r_q,M(3),1);
    subplot(122);
    plot(r_i,r_q,'+');
    title(['Received Symbols for Eb/N0=' num2str((EbN0dB(index))) 'dB']);
    xlabel('I');
    ylabel('Q');
    index=index+1;
end