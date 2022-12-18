clear all; close all;

EbN0 = [-4,0,4];
EbN0_lineal =10.^(EbN0/10);
t = 1;
r = 1;
K = 25;
M = 100:100:1000;
%% K = 25 EbN0 = -4
for j=1:1:length(M)   
    H = Canal(K,M(j)); %channel
    W_CB = H';
    A_CB = H*W_CB;
    Stot_CB = diag(abs(A_CB));

    c_CB_a(j) = sum(log2(1+EbN0_lineal(1)*Stot_CB.^2));
    c_CB_b(j) = sum(((200-2*M(j)+K)/200)*log2(1+EbN0_lineal(1)*Stot_CB.^2));
    c_CB_c(j) = sum(((200-K)/200)*log2(1+EbN0_lineal(1)*Stot_CB.^2));
end

subplot(331)
plot(M,c_CB_a);
title('CB No CSIT: K=25 SNR=-4')
subplot(332)
plot(M,c_CB_b);
title('CB FDD: K=25 SNR=-4')
subplot(333)
plot(M,c_CB_c);
title('CB TDD: K=25 SNR=-4')

%% K = 25 EbN0 = 0
for j=1:1:length(M)   
    H = Canal(K,M(j)); %channel
    W_CB = H';
    A_CB = H*W_CB;
    Stot_CB = diag(abs(A_CB));

    c_CB_a(j) = sum(log2(1+EbN0_lineal(2)*Stot_CB.^2));
    c_CB_b(j) = sum(((200-2*M(j)+K)/200)*log2(1+EbN0_lineal(2)*Stot_CB.^2));
    c_CB_c(j) = sum(((200-K)/200)*log2(1+EbN0_lineal(2)*Stot_CB.^2));
end

subplot(334)
plot(M,c_CB_a);
title('CB No CSIT: K=25 SNR=0')
subplot(335)
plot(M,c_CB_b);
title('CB FDD: K=25 SNR=0')
subplot(336)
plot(M,c_CB_c);
title('CB TDD: K=25 SNR=0')

%% K = 25 EbN0 = 4
for j=1:1:length(M)   
    H = Canal(K,M(j)); %channel
    W_CB = H';
    A_CB = H*W_CB;
    Stot_CB = diag(abs(A_CB));

    c_CB_a(j) = sum(log2(1+EbN0_lineal(3)*Stot_CB.^2));
    c_CB_b(j) = sum(((200-2*M(j)+K)/200)*log2(1+EbN0_lineal(3)*Stot_CB.^2));
    c_CB_c(j) = sum(((200-K)/200)*log2(1+EbN0_lineal(3)*Stot_CB.^2));
end

subplot(337)
plot(M,c_CB_a);
title('CB No CSIT: K=25 SNR=4')
subplot(338)
plot(M,c_CB_b);
title('CB FDD: K=25 SNR=4')
subplot(339)
plot(M,c_CB_c);
title('CB TDD: K=25 SNR=4')

%% K = 10 EbN0 = -4
figure()
K = 10;

for j=1:1:length(M)   
    H = Canal(K,M(j)); %channel
    W_CB = H';
    A_CB = H*W_CB;
    Stot_CB = diag(abs(A_CB));

    c_CB_a(j) = sum(log2(1+EbN0_lineal(1)*Stot_CB.^2));
    c_CB_b(j) = sum(((200-2*M(j)+K)/200)*log2(1+EbN0_lineal(1)*Stot_CB.^2));
    c_CB_c(j) = sum(((200-K)/200)*log2(1+EbN0_lineal(1)*Stot_CB.^2));
end

subplot(331)
plot(M,c_CB_a);
title('CB No CSIT: K=10 SNR=-4')
subplot(332)
plot(M,c_CB_b);
title('CB FDD: K=10 SNR=-4')
subplot(333)
plot(M,c_CB_c);
title('CB TDD: K=10 SNR=-4')

%% K = 10 EbN0 = 0
for j=1:1:length(M)   
    H = Canal(K,M(j)); %channel
    W_CB = H';
    A_CB = H*W_CB;
    Stot_CB = diag(abs(A_CB));

    c_CB_a(j) = sum(log2(1+EbN0_lineal(2)*Stot_CB.^2));
    c_CB_b(j) = sum(((200-2*M(j)+K)/200)*log2(1+EbN0_lineal(2)*Stot_CB.^2));
    c_CB_c(j) = sum(((200-K)/200)*log2(1+EbN0_lineal(2)*Stot_CB.^2));
end

subplot(334)
plot(M,c_CB_a);
title('CB No CSIT: K=10 SNR=0')
subplot(335)
plot(M,c_CB_b);
title('CB FDD: K=10 SNR=0')
subplot(336)
plot(M,c_CB_c);
title('CB TDD: K=10 SNR=0')

%% K = 10 EbN0 = 4
for j=1:1:length(M)   
    H = Canal(K,M(j)); %channel
    W_CB = H';
    A_CB = H*W_CB;
    Stot_CB = diag(abs(A_CB));

    c_CB_a(j) = sum(log2(1+EbN0_lineal(3)*Stot_CB.^2));
    c_CB_b(j) = sum(((200-2*M(j)+K)/200)*log2(1+EbN0_lineal(3)*Stot_CB.^2));
    c_CB_c(j) = sum(((200-K)/200)*log2(1+EbN0_lineal(3)*Stot_CB.^2));
end

subplot(337)
plot(M,c_CB_a);
title('CB No CSIT: K=10 SNR=4')
subplot(338)
plot(M,c_CB_b);
title('CB FDD: K=10 SNR=4')
subplot(339)
plot(M,c_CB_c);
title('CB TDD: K=10 SNR=4')

%% K = 100 EbN0 = -4
figure();
K = 100;
for j=1:1:length(M)   
    H = Canal(K,M(j)); %channel
    W_CB = H';
    A_CB = H*W_CB;
    Stot_CB = diag(abs(A_CB));

    c_CB_a(j) = sum(log2(1+EbN0_lineal(1)*Stot_CB.^2));
    c_CB_b(j) = sum(((200-2*M(j)+K)/200)*log2(1+EbN0_lineal(1)*Stot_CB.^2));
    c_CB_c(j) = sum(((200-K)/200)*log2(1+EbN0_lineal(1)*Stot_CB.^2));
end

subplot(331)
plot(M,c_CB_a);
title('CB No CSIT: K=100 SNR=-4')
subplot(332)
plot(M,c_CB_b);
title('CB FDD: K=100 SNR=-4')
subplot(333)
plot(M,c_CB_c);
title('CB TDD: K=100 SNR=-4')

%% K = 100 EbN0 = 0
for j=1:1:length(M)   
    H = Canal(K,M(j)); %channel
    W_CB = H';
    A_CB = H*W_CB;
    Stot_CB = diag(abs(A_CB));

    c_CB_a(j) = sum(log2(1+EbN0_lineal(2)*Stot_CB.^2));
    c_CB_b(j) = sum(((200-2*M(j)+K)/200)*log2(1+EbN0_lineal(2)*Stot_CB.^2));
    c_CB_c(j) = sum(((200-K)/200)*log2(1+EbN0_lineal(2)*Stot_CB.^2));
end

subplot(334)
plot(M,c_CB_a);
title('CB No CSIT: K=100 SNR=0')
subplot(335)
plot(M,c_CB_b);
title('CB FDD: K=100 SNR=0')
subplot(336)
plot(M,c_CB_c);
title('CB TDD: K=100 SNR=0')

%% K = 100 EbN0 = 4
for j=1:1:length(M)   
    H = Canal(K,M(j)); %channel
    W_CB = H';
    A_CB = H*W_CB;
    Stot_CB = diag(abs(A_CB));

    c_CB_a(j) = sum(log2(1+EbN0_lineal(3)*Stot_CB.^2));
    c_CB_b(j) = sum(((200-2*M(j)+K)/200)*log2(1+EbN0_lineal(3)*Stot_CB.^2));
    c_CB_c(j) = sum(((200-K)/200)*log2(1+EbN0_lineal(3)*Stot_CB.^2));
end

subplot(337)
plot(M,c_CB_a);
title('CB No CSIT: K=100 SNR=4')
subplot(338)
plot(M,c_CB_b);
title('CB FDD: K=100 SNR=4')
subplot(339)
plot(M,c_CB_c);
title('CB TDD: K=100 SNR=4')


%% ZF
figure()
K = 25;
M = 100:1000:10000;
%% K = 25 EbN0 = -4
for j=1:1:length(M)   
    H = Canal(K,M(j)); %channel
    [W_CB,Stot_ZF] = ZFCBST(H,M(j),1,K,1);

    c_ZF_a(j) = sum(log2(1+EbN0_lineal(1)*Stot_ZF.^2));
    c_ZF_b(j) = sum(((200-2*M(j)+K)/200)*log2(1+EbN0_lineal(1)*Stot_ZF.^2));
    c_ZF_c(j) = sum(((200-K)/200)*log2(1+EbN0_lineal(1)*Stot_ZF.^2));
end

subplot(331)
plot(M,c_ZF_a);
title('ZF No CSIT: K=25 SNR=-4')
subplot(332)
plot(M,c_ZF_b);
title('ZF FDD: K=25 SNR=-4')
subplot(333)
plot(M,c_ZF_c);
title('ZF TDD: K=25 SNR=-4')

%% K = 25 EbN0 = 0
for j=1:1:length(M)   
    H = Canal(K,M(j)); %channel
    [W_CB,Stot_ZF] = ZFCBST(H,M(j),1,K,1);

    c_ZF_a(j) = sum(log2(1+EbN0_lineal(2)*Stot_ZF.^2));
    c_ZF_b(j) = sum(((200-2*M(j)+K)/200)*log2(1+EbN0_lineal(2)*Stot_ZF.^2));
    c_ZF_c(j) = sum(((200-K)/200)*log2(1+EbN0_lineal(2)*Stot_ZF.^2));
end

subplot(334)
plot(M,c_ZF_a);
title('ZF No CSIT: K=25 SNR=0')
subplot(335)
plot(M,c_ZF_b);
title('ZF FDD: K=25 SNR=0')
subplot(336)
plot(M,c_ZF_c);
title('ZF TDD: K=25 SNR=0')

%% K = 25 EbN0 = 4
for j=1:1:length(M)   
    H = Canal(K,M(j)); %channel
    [W_CB,Stot_ZF] = ZFCBST(H,M(j),1,K,1);

    c_ZF_a(j) = sum(log2(1+EbN0_lineal(3)*Stot_ZF.^2));
    c_ZF_b(j) = sum(((200-2*M(j)+K)/200)*log2(1+EbN0_lineal(3)*Stot_ZF.^2));
    c_ZF_c(j) = sum(((200-K)/200)*log2(1+EbN0_lineal(3)*Stot_ZF.^2));
end

subplot(337)
plot(M,c_ZF_a);
title('ZF No CSIT: K=25 SNR=4')
subplot(338)
plot(M,c_ZF_b);
title('ZF FDD: K=25 SNR=4')
subplot(339)
plot(M,c_ZF_c);
title('ZF TDD: K=25 SNR=4')

%% K = 10 EbN0 = -4
figure()
K = 10;

for j=1:1:length(M)   
    H = Canal(K,M(j)); %channel
    [W_CB,Stot_ZF] = ZFCBST(H,M(j),1,K,1);

    c_ZF_a(j) = sum(log2(1+EbN0_lineal(1)*Stot_ZF.^2));
    c_ZF_b(j) = sum(((200-2*M(j)+K)/200)*log2(1+EbN0_lineal(1)*Stot_ZF.^2));
    c_ZF_c(j) = sum(((200-K)/200)*log2(1+EbN0_lineal(1)*Stot_ZF.^2));
end

subplot(331)
plot(M,c_ZF_a);
title('ZF No CSIT: K=10 SNR=-4')
subplot(332)
plot(M,c_ZF_b);
title('ZF FDD: K=10 SNR=-4')
subplot(333)
plot(M,c_ZF_c);
title('ZF TDD: K=10 SNR=-4')

%% K = 10 EbN0 = 0
for j=1:1:length(M)   
    H = Canal(K,M(j)); %channel
    [W_CB,Stot_ZF] = ZFCBST(H,M(j),1,K,1);

    c_ZF_a(j) = sum(log2(1+EbN0_lineal(2)*Stot_ZF.^2));
    c_ZF_b(j) = sum(((200-2*M(j)+K)/200)*log2(1+EbN0_lineal(2)*Stot_ZF.^2));
    c_ZF_c(j) = sum(((200-K)/200)*log2(1+EbN0_lineal(2)*Stot_ZF.^2));
end

subplot(334)
plot(M,c_ZF_a);
title('ZF No CSIT: K=10 SNR=0')
subplot(335)
plot(M,c_ZF_b);
title('ZF FDD: K=10 SNR=0')
subplot(336)
plot(M,c_ZF_c);
title('ZF TDD: K=10 SNR=0')

%% K = 10 EbN0 = 4
for j=1:1:length(M)   
    H = Canal(K,M(j)); %channel
    [W_CB,Stot_ZF] = ZFCBST(H,M(j),1,K,1);

    c_ZF_a(j) = sum(log2(1+EbN0_lineal(3)*Stot_ZF.^2));
    c_ZF_b(j) = sum(((200-2*M(j)+K)/200)*log2(1+EbN0_lineal(3)*Stot_ZF.^2));
    c_ZF_c(j) = sum(((200-K)/200)*log2(1+EbN0_lineal(3)*Stot_ZF.^2));
end

subplot(337)
plot(M,c_ZF_a);
title('ZF No CSIT: K=10 SNR=4')
subplot(338)
plot(M,c_ZF_b);
title('ZF FDD: K=10 SNR=4')
subplot(339)
plot(M,c_ZF_c);
title('ZF TDD: K=10 SNR=4')

%% K = 100 EbN0 = -4
figure();
K = 100;
for j=1:1:length(M)   
    H = Canal(K,M(j)); %channel
    [W_CB,Stot_ZF] = ZFCBST(H,M(j),1,K,1);

    c_ZF_a(j) = sum(log2(1+EbN0_lineal(1)*Stot_ZF.^2));
    c_ZF_b(j) = sum(((200-2*M(j)+K)/200)*log2(1+EbN0_lineal(1)*Stot_ZF.^2));
    c_ZF_c(j) = sum(((200-K)/200)*log2(1+EbN0_lineal(1)*Stot_ZF.^2));
end

subplot(331)
plot(M,c_ZF_a);
title('ZF No CSIT: K=100 SNR=-4')
subplot(332)
plot(M,c_ZF_b);
title('ZF FDD: K=100 SNR=-4')
subplot(333)
plot(M,c_ZF_c);
title('ZF TDD: K=100 SNR=-4')

%% K = 100 EbN0 = 0
for j=1:1:length(M)   
    H = Canal(K,M(j)); %channel
    [W_CB,Stot_ZF] = ZFCBST(H,M(j),1,K,1);

    c_ZF_a(j) = sum(log2(1+EbN0_lineal(2)*Stot_ZF.^2));
    c_ZF_b(j) = sum(((200-2*M(j)+K)/200)*log2(1+EbN0_lineal(2)*Stot_ZF.^2));
    c_ZF_c(j) = sum(((200-K)/200)*log2(1+EbN0_lineal(2)*Stot_ZF.^2));
end

subplot(334)
plot(M,c_ZF_a);
title('ZF No CSIT: K=100 SNR=0')
subplot(335)
plot(M,c_ZF_b);
title('ZF FDD: K=100 SNR=0')
subplot(336)
plot(M,c_ZF_c);
title('ZF TDD: K=100 SNR=0')

%% K = 100 EbN0 = 4
for j=1:1:length(M)   
    H = Canal(K,M(j)); %channel
    [W_CB,Stot_ZF] = ZFCBST(H,M(j),1,K,1);

    c_ZF_a(j) = sum(log2(1+EbN0_lineal(3)*Stot_ZF.^2));
    c_ZF_b(j) = sum(((200-2*M(j)+K)/200)*log2(1+EbN0_lineal(3)*Stot_ZF.^2));
    c_ZF_c(j) = sum(((200-K)/200)*log2(1+EbN0_lineal(3)*Stot_ZF.^2));
end

subplot(337)
plot(M,c_ZF_a);
title('ZF No CSIT: K=100 SNR=4')
subplot(338)
plot(M,c_ZF_b);
title('ZF FDD: K=100 SNR=4')
subplot(339)
plot(M,c_ZF_c);
title('ZF TDD: K=100 SNR=4')


% figure();
% for j=1:1:length(M)   
%     H = Canal(K,M(j)); %channel
%     [W_CB,Stot_ZF] = ZFCBST(H,M(j),1,K,1);
%     %W, Stot_ZF(i) = H(i) * ZFCBST(H(i),M(i),t,K,r);
% 
%     c_ZF_a(j) = sum(log2(1+EbN0_lineal(1)*Stot_ZF.^2));
%     c_ZF_b(j) = sum(((200-2*M(j)+K)/200)*log2(1+EbN0_lineal(1)*Stot_ZF.^2));
%     c_ZF_c(j) = sum(((200-K)/200)*log2(1+EbN0_lineal(1)*Stot_ZF.^2));
%     %c_ZF(i) = sum(log2(1+EbN0_lineal(1)*Stot_ZF(i)^2));
% end
% subplot(331)
% plot(M,c_ZF_a);
% title('ZF No CSIT: K=100 EbN0=-4')
% subplot(332)
% plot(M,c_ZF_b);
% title('ZF FDD: K=100 EbN0=-4')
% subplot(333)
% plot(M,c_ZF_c);
% title('ZF TDD: K=100 EbN0=-4')


%plot(M,c_ZF);
% for i=1:1:length(M)
%     H = Canal(K,M(i)); %channel
%     Stot_CB(i) = H(i)';
%     %W, Stot_ZF(i) = H(i) * ZFCBST(H(i),M(i),t,K,r);
% 
%     c_CB(i) = sum(log2(1+EbN0_lineal(2)*Stot_CB(i)^2));
%     %c_ZF(i) = sum(log2(1+EbN0_lineal(1)*Stot_ZF(i)^2));
% end
% subplot(232)
% plot(M,c_CB);
% subplot(235)
% %plot(M,c_ZF);
% 
% for i=1:1:length(M)
%     H = Canal(K,M(i)); %channel
%     Stot_CB(i) = H(i)';
%     %W, Stot_ZF(i) = H(i) * ZFCBST(H(i),M(i),t,K,r);
% 
%     c_CB(i) = sum(log2(1+EbN0_lineal(3)*Stot_CB(i)^2));
%     %c_ZF(i) = sum(log2(1+EbN0_lineal(1)*Stot_ZF(i)^2));
% end
% subplot(233)
% plot(M,c_CB);
% subplot(236)
%plot(M,c_ZF);

%ahcievable rate -> capacidad canal
%EbN0 en naturales
%Stot -> ganancia efectiva Stot = abs(H*W) [s1 s2 s3]
%c = sum(log2(1+EbN0*Stot^2))

%FDD -> 2M+K pilotos
%C=sum((200-2M+K)/200)*log2(1+EbN0*Stot^2))

%TDD -> K pilotos
%C=sum((200-K)/200)*log2(1+EbN0*Stot^2))
