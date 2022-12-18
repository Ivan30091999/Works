clear all; close all
%% K = 2 M = 2 EbN0 = 0 dB CB
K = 2;
M = 2;
ebN0 = [0,4,10];
ebN0_lineal =10.^(ebN0/10);

x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
s = [pskModulator(x(1,:).').'; pskModulator(x(2,:).').'];

for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_CB = H'; %conjugate beamforming
    n = ruido(K,ebN0_lineal(1));
    A_CB = H*W_CB;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_CB*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(431)
plot(y,'.');
title('CB: K=2, M=2, SNR=0');
%% K = 2 M = 2 EbN0 = 4 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
s = [pskModulator(x(1,:).').'; pskModulator(x(2,:).').'];
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_CB = H'; %conjugate beamforming
    n = ruido(K,ebN0_lineal(2));
    A_CB = H*W_CB;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_CB*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(432)
plot(y,'.');
title('CB: K=2, M=2, SNR=4');
%% K = 2 M = 2 EbN0 = 10 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
s = [pskModulator(x(1,:).').'; pskModulator(x(2,:).').'];
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_CB = H'; %conjugate beamforming
    n = ruido(K,ebN0_lineal(3));
    A_CB = H*W_CB;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_CB*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(433)
plot(y,'.');
title('CB: K=2, M=2, SNR=10');
%% M = 4
M = 4;
%% K = 2 M = 4 EbN0 = 0dB
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_CB = H'; %conjugate beamforming
    n = ruido(K,ebN0_lineal(1));
    A_CB = H*W_CB;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_CB*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(434)
plot(y,'.');
title('CB: K=2, M=4, SNR=0');
%% K = 2 M = 4 EbN0 = 4 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
s = [pskModulator(x(1,:).').'; pskModulator(x(2,:).').'];
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_CB = H'; %conjugate beamforming
    n = ruido(K,ebN0_lineal(2));
    A_CB = H*W_CB;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_CB*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(435)
plot(y,'.');
title('CB: K=2, M=4, SNR=4');
%% K = 2 M = 4 EbN0 = 10 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
s = [pskModulator(x(1,:).').'; pskModulator(x(2,:).').'];
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_CB = H'; %conjugate beamforming
    n = ruido(K,ebN0_lineal(3));
    A_CB = H*W_CB;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_CB*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(436)
plot(y,'.');
title('CB: K=2, M=4, SNR=10');

%% M = 8
M = 8;
%% K = 2 M = 8 EbN0 = 0dB
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_CB = H'; %conjugate beamforming
    n = ruido(K,ebN0_lineal(1));
    A_CB = H*W_CB;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_CB*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(437)
plot(y,'.');
title('CB: K=2, M=8, SNR=0');
%% K = 2 M = 8 EbN0 = 4 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
s = [pskModulator(x(1,:).').'; pskModulator(x(2,:).').'];
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_CB = H'; %conjugate beamforming
    n = ruido(K,ebN0_lineal(2));
    A_CB = H*W_CB;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_CB*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(438)
plot(y,'.');
title('CB: K=2, M=8, SNR=4');
%% K = 2 M = 8 EbN0 = 10 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
s = [pskModulator(x(1,:).').'; pskModulator(x(2,:).').'];
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_CB = H'; %conjugate beamforming
    n = ruido(K,ebN0_lineal(3));
    A_CB = H*W_CB;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_CB*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(439)
plot(y,'.');
title('CB: K=2, M=8, SNR=10');

%% M = 20
M = 20;
%% K = 2 M = 20 EbN0 = 0dB
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_CB = H'; %conjugate beamforming
    n = ruido(K,ebN0_lineal(1));
    A_CB = H*W_CB;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_CB*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(4,3,10)
plot(y,'.');
title('CB: K=2, M=20, SNR=0');
%% K = 2 M = 20 EbN0 = 4 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
s = [pskModulator(x(1,:).').'; pskModulator(x(2,:).').'];
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_CB = H'; %conjugate beamforming
    n = ruido(K,ebN0_lineal(2));
    A_CB = H*W_CB;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_CB*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(4,3,11)
plot(y,'.');
title('CB: K=2, M=20, SNR=4');
%% K = 2 M = 20 EbN0 = 10 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
s = [pskModulator(x(1,:).').'; pskModulator(x(2,:).').'];
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_CB = H'; %conjugate beamforming
    n = ruido(K,ebN0_lineal(3));
    A_CB = H*W_CB;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_CB*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(4,3,12)
plot(y,'.');
title('CB: K=2, M=20, SNR=10');

%% Zero Forcing
figure();
r = 1;
t = 1; 

%% K = 2 M = 2 EbN0 = 0 dB CB
K = 2;
M = 2;
ebN0 = [0,4,10];
ebN0_lineal =10.^(ebN0/10);

x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
s = [pskModulator(x(1,:).').'; pskModulator(x(2,:).').'];

for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_ZFCBST = ZFCBST(H,M,t,K,r);
    n = ruido(K,ebN0_lineal(1));
    A_ZF = H*W_ZFCBST;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_ZF*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(431)
plot(y,'.');
title('ZF: K=2, M=2, SNR=0');
%% K = 2 M = 2 EbN0 = 4 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
s = [pskModulator(x(1,:).').'; pskModulator(x(2,:).').'];
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_ZFCBST = ZFCBST(H,M,t,K,r);
    n = ruido(K,ebN0_lineal(2));
    A_ZF = H*W_ZFCBST;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_ZF*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(432)
plot(y,'.');
title('ZF: K=2, M=2, SNR=4');
%% K = 2 M = 2 EbN0 = 10 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
s = [pskModulator(x(1,:).').'; pskModulator(x(2,:).').'];
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_ZFCBST = ZFCBST(H,M,t,K,r);
    n = ruido(K,ebN0_lineal(3));
    A_ZF = H*W_ZFCBST;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_ZF*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(433)
plot(y,'.');
title('ZF: K=2, M=2, SNR=10');
%% M = 4
M = 4;
%% K = 2 M = 4 EbN0 = 0dB
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_ZFCBST = ZFCBST(H,M,t,K,r);
    n = ruido(K,ebN0_lineal(1));
    A_ZF = H*W_ZFCBST;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_ZF*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(434)
plot(y,'.');
title('ZF: K=2, M=4, SNR=0');
%% K = 2 M = 4 EbN0 = 4 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
s = [pskModulator(x(1,:).').'; pskModulator(x(2,:).').'];
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_ZFCBST = ZFCBST(H,M,t,K,r);
    n = ruido(K,ebN0_lineal(2));
    A_ZF = H*W_ZFCBST;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_ZF*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(435)
plot(y,'.');
title('ZF: K=2, M=4, SNR=4');
%% K = 2 M = 4 EbN0 = 10 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
s = [pskModulator(x(1,:).').'; pskModulator(x(2,:).').'];
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_ZFCBST = ZFCBST(H,M,t,K,r);
    n = ruido(K,ebN0_lineal(3));
    A_ZF = H*W_ZFCBST;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_ZF*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(436)
plot(y,'.');
title('ZF: K=2, M=4, SNR=10');

%% M = 8
M = 8;
%% K = 2 M = 8 EbN0 = 0dB
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_ZFCBST = ZFCBST(H,M,t,K,r);
    n = ruido(K,ebN0_lineal(1));
    A_ZF = H*W_ZFCBST;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_ZF*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(437)
plot(y,'.');
title('ZF: K=2, M=8, SNR=0');
%% K = 2 M = 8 EbN0 = 4 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
s = [pskModulator(x(1,:).').'; pskModulator(x(2,:).').'];
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_ZFCBST = ZFCBST(H,M,t,K,r);
    n = ruido(K,ebN0_lineal(2));
    A_ZF = H*W_ZFCBST;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_ZF*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(438)
plot(y,'.');
title('ZF: K=2, M=8, SNR=4');
%% K = 2 M = 8 EbN0 = 10 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
s = [pskModulator(x(1,:).').'; pskModulator(x(2,:).').'];
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_ZFCBST = ZFCBST(H,M,t,K,r);
    n = ruido(K,ebN0_lineal(3));
    A_ZF = H*W_ZFCBST;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_ZF*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(439)
plot(y,'.');
title('ZF: K=2, M=8, SNR=10');

%% M = 20
M = 20;
%% K = 2 M = 20 EbN0 = 0dB
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_ZFCBST = ZFCBST(H,M,t,K,r);
    n = ruido(K,ebN0_lineal(1));
    A_ZF = H*W_ZFCBST;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_ZF*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(4,3,10)
plot(y,'.');
title('ZF: K=2, M=20, SNR=0');
%% K = 2 M = 20 EbN0 = 4 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
s = [pskModulator(x(1,:).').'; pskModulator(x(2,:).').'];
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_ZFCBST = ZFCBST(H,M,t,K,r);
    n = ruido(K,ebN0_lineal(2));
    A_ZF = H*W_ZFCBST;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_ZF*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(4,3,11)
plot(y,'.');
title('ZF: K=2, M=20, SNR=4');
%% K = 2 M = 20 EbN0 = 10 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
s = [pskModulator(x(1,:).').'; pskModulator(x(2,:).').'];
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_ZFCBST = ZFCBST(H,M,t,K,r); 
    n = ruido(K,ebN0_lineal(3));
    A_ZF = H*W_ZFCBST;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_ZF*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(4,3,12)
plot(y,'.');
title('ZF: K=2, M=20, SNR=10');


figure()
%% K = 10 M = 10 EbN0 = 0 dB CB
K = 10;
M = 10;
ebN0 = [0,4,10];
ebN0_lineal =10.^(ebN0/10);

x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
for i=1:1:K
s(i,:) = [pskModulator(x(i,:).').'];
end
y=zeros(10,1000);
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_CB = H'; %conjugate beamforming
    n = ruido(K,ebN0_lineal(1));
    A_CB = H*W_CB;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_CB*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(431)
plot(y,'.');
title('CB: K=10, M=10, SNR=0');
%% K = 10 M = 10 EbN0 = 4 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
for i=1:1:K
s(i,:) = [pskModulator(x(i,:).').'];
end
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_CB = H'; %conjugate beamforming
    n = ruido(K,ebN0_lineal(2));
    A_CB = H*W_CB;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_CB*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(432)
plot(y,'.');
title('CB: K=10, M=10, SNR=4');
%% K = 10 M = 10 EbN0 = 10 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
for i=1:1:K
s(i,:) = [pskModulator(x(i,:).').'];
end
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_CB = H'; %conjugate beamforming
    n = ruido(K,ebN0_lineal(3));
    A_CB = H*W_CB;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_CB*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(433)
plot(y,'.');
title('CB: K=10, M=10, SNR=10');
%% M = 20
M = 20;
%% K = 10 M = 20 EbN0 = 0dB
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_CB = H'; %conjugate beamforming
    n = ruido(K,ebN0_lineal(1));
    A_CB = H*W_CB;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_CB*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(434)
plot(y,'.');
title('CB: K=10, M=20, SNR=0');
%% K = 10 M = 20 EbN0 = 4 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
for i=1:1:K
s(i,:) = [pskModulator(x(i,:).').'];
end
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_CB = H'; %conjugate beamforming
    n = ruido(K,ebN0_lineal(2));
    A_CB = H*W_CB;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_CB*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(435)
plot(y,'.');
title('CB: K=10, M=20, SNR=4');
%% K = 10 M = 20 EbN0 = 10 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
for i=1:1:K
s(i,:) = [pskModulator(x(i,:).').'];
end
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_CB = H'; %conjugate beamforming
    n = ruido(K,ebN0_lineal(3));
    A_CB = H*W_CB;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_CB*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(436)
plot(y,'.');
title('CB: K=10, M=20, SNR=10');

%% M = 50
M = 50;
%% K = 10 M = 50 EbN0 = 0dB
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_CB = H'; %conjugate beamforming
    n = ruido(K,ebN0_lineal(1));
    A_CB = H*W_CB;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_CB*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(437)
plot(y,'.');
title('CB: K=10, M=50, SNR=0');
%% K = 10 M = 50 EbN0 = 4 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
for i=1:1:K
s(i,:) = [pskModulator(x(i,:).').'];
end
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_CB = H'; %conjugate beamforming
    n = ruido(K,ebN0_lineal(2));
    A_CB = H*W_CB;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_CB*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(438)
plot(y,'.');
title('CB: K=10, M=50, SNR=4');
%% K = 10 M = 50 EbN0 = 10 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
for i=1:1:K
s(i,:) = [pskModulator(x(i,:).').'];
end
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_CB = H'; %conjugate beamforming
    n = ruido(K,ebN0_lineal(3));
    A_CB = H*W_CB;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_CB*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(439)
plot(y,'.');
title('CB: K=10, M=50, SNR=10');

%% M = 100
M = 100;
%% K = 10 M = 100 EbN0 = 0dB
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_CB = H'; %conjugate beamforming
    n = ruido(K,ebN0_lineal(1));
    A_CB = H*W_CB;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_CB*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(4,3,10)
plot(y,'.');
title('CB: K=10, M=100, SNR=0');
%% K = 10 M = 100 EbN0 = 4 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
for i=1:1:K
s(i,:) = [pskModulator(x(i,:).').'];
end
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_CB = H'; %conjugate beamforming
    n = ruido(K,ebN0_lineal(2));
    A_CB = H*W_CB;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_CB*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(4,3,11)
plot(y,'.');
title('CB: K=10, M=100, SNR=4');
%% K = 10 M = 100 EbN0 = 10 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
for i=1:1:K
s(i,:) = [pskModulator(x(i,:).').'];
end
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_CB = H'; %conjugate beamforming
    n = ruido(K,ebN0_lineal(3));
    A_CB = H*W_CB;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_CB*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(4,3,12)
plot(y,'.');
title('CB: K=10, M=100, SNR=10');

%% Zero Forcing
figure();
r = 1;
t = 1; 

%% K = 10 M = 10 EbN0 = 0 dB
K = 10;
M = 10;
ebN0 = [0,4,10];
ebN0_lineal =10.^(ebN0/10);

x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
for i=1:1:K
s(i,:) = [pskModulator(x(i,:).').'];
end

for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_ZFCBST = ZFCBST(H,M,t,K,r);
    n = ruido(K,ebN0_lineal(1));
    A_ZF = H*W_ZFCBST;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_ZF*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(431)
plot(y,'.');
title('ZF: K=10, M=10, SNR=0');
%% K = 10 M = 10 EbN0 = 4 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
for i=1:1:K
s(i,:) = [pskModulator(x(i,:).').'];
end
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_ZFCBST = ZFCBST(H,M,t,K,r);
    n = ruido(K,ebN0_lineal(2));
    A_ZF = H*W_ZFCBST;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_ZF*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(432)
plot(y,'.');
title('ZF: K=10, M=10, SNR=4');
%% K = 10 M = 10 EbN0 = 10 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
for i=1:1:K
s(i,:) = [pskModulator(x(i,:).').'];
end
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_ZFCBST = ZFCBST(H,M,t,K,r);
    n = ruido(K,ebN0_lineal(3));
    A_ZF = H*W_ZFCBST;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_ZF*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(433)
plot(y,'.');
title('ZF: K=10, M=10, SNR=10');
%% M = 20
M = 20;
%% K = 10 M = 20 EbN0 = 0dB
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_ZFCBST = ZFCBST(H,M,t,K,r);
    n = ruido(K,ebN0_lineal(1));
    A_ZF = H*W_ZFCBST;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_ZF*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(434)
plot(y,'.');
title('ZF: K=10, M=20, SNR=0');
%% K = 10 M = 20 EbN0 = 4 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
for i=1:1:K
s(i,:) = [pskModulator(x(i,:).').'];
end
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_ZFCBST = ZFCBST(H,M,t,K,r);
    n = ruido(K,ebN0_lineal(2));
    A_ZF = H*W_ZFCBST;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_ZF*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(435)
plot(y,'.');
title('ZF: K=10, M=20, SNR=4');
%% K = 10 M = 20 EbN0 = 10 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
for i=1:1:K
s(i,:) = [pskModulator(x(i,:).').'];
end
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_ZFCBST = ZFCBST(H,M,t,K,r);
    n = ruido(K,ebN0_lineal(3));
    A_ZF = H*W_ZFCBST;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_ZF*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(436)
plot(y,'.');
title('ZF: K=10, M=20, SNR=10');

%% M = 50
M = 50;
%% K = 10 M = 50 EbN0 = 0dB
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_ZFCBST = ZFCBST(H,M,t,K,r);
    n = ruido(K,ebN0_lineal(1));
    A_ZF = H*W_ZFCBST;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_ZF*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(437)
plot(y,'.');
title('ZF: K=10, M=50, SNR=0');
%% K = 10 M = 50 EbN0 = 4 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
for i=1:1:K
s(i,:) = [pskModulator(x(i,:).').'];
end
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_ZFCBST = ZFCBST(H,M,t,K,r);
    n = ruido(K,ebN0_lineal(2));
    A_ZF = H*W_ZFCBST;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_ZF*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(438)
plot(y,'.');
title('ZF: K=10, M=50, SNR=4');
%% K = 10 M = 50 EbN0 = 10 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
for i=1:1:K
s(i,:) = [pskModulator(x(i,:).').'];
end
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_ZFCBST = ZFCBST(H,M,t,K,r);
    n = ruido(K,ebN0_lineal(3));
    A_ZF = H*W_ZFCBST;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_ZF*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(439)
plot(y,'.');
title('ZF: K=10, M=50, SNR=10');

%% M = 100
M = 100;
%% K = 10 M = 100 EbN0 = 0dB
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_ZFCBST = ZFCBST(H,M,t,K,r);
    n = ruido(K,ebN0_lineal(1));
    A_ZF = H*W_ZFCBST;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_ZF*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(4,3,10)
plot(y,'.');
title('ZF: K=10, M=100, SNR=0');
%% K = 10 M = 100 EbN0 = 4 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
for i=1:1:K
s(i,:) = [pskModulator(x(i,:).').'];
end
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_ZFCBST = ZFCBST(H,M,t,K,r);
    n = ruido(K,ebN0_lineal(2));
    A_ZF = H*W_ZFCBST;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_ZF*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(4,3,11)
plot(y,'.');
title('ZF: K=10, M=100, SNR=4');
%% K = 10 M = 100 EbN0 = 10 dB
x = randi([0 1],[K 2000]);
pskModulator = comm.PSKModulator(4, pi/4,'BitInput',true);
for i=1:1:K
s(i,:) = [pskModulator(x(i,:).').'];
end
for i=1:1:length(s(1,:))
    H = Canal(K,M); %channel
    W_ZFCBST = ZFCBST(H,M,t,K,r); 
    n = ruido(K,ebN0_lineal(3));
    A_ZF = H*W_ZFCBST;
    %A_CB = A_CB/max(max(A_CB));
    y(:,i) = A_ZF*s(:,i)+n;
    %y(:,i) = y(:,i)/max(max(y(:,i)));
end
subplot(4,3,12)
plot(y,'.');
title('ZF: K=10, M=100, SNR=10');
