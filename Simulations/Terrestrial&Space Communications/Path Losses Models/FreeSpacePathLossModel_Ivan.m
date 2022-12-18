clear all;
clc;

%section 1
f = 10*1e9;
lambda = 3*1e8/f;
d0 = 10;
n = 1;
d = 0:1:1000;
for i = 1:1:length(d)
    
    L(i) = fspl(d(i),lambda) + 10*n*log10(d(i)/d0);
end

figure();

plot(d,L);
xlabel("Distance [m]");
ylabel("Attenuation [dB]");
title("n = 1");
%section 2
clear L;
d0 = 10;
n = 1:1:4;
for i = 1:1:length(n)
    for j = 1:1:length(d)
        L(i,j) = fspl(d(j),lambda) + 10*n(i)*log10(d(j)/d0);
    end
end

figure();
plot(d,L);

xlabel("Distance [m]");
ylabel("Attenuation [dB]");
legend(["n = 1","n = 2", "n = 3", "n = 4"]);
title("n = 1:4");

%section 3
lambda = 0.3;
R = 1*1e3;
L = fspl(R,lambda)

%section 4
R = 1e3;
f = 1e9:1e9:1000*1e9;
lambda = 3*1e8./f;

for i=1:1:length(f)
    Lfs(i) = fspl(R,lambda(i));
end

plot(f,Lfs);
title("Attenuation for a 1 km free space propagation from 1 GHz to 1000 GHz");
xlabel("Frequency [Hz]");
ylabel("Attenuation [dB]");

%section 5
R = 1e3;
f = 15*10e9:1e9:1000*1e9;
T = 20;
den = 0.5;

for i = 1:1:length(f)
    Lfog(i) = fogpl(R,f(i),T,den);
end

figure();
plot(f,Lfog);
title("attenuation of signals propagating through a cloud that is 1 km long at 1000 meters altitude");
xlabel("Frequency [Hz]");
ylabel("Attenuation [dB]");

clear Lfs;
for i=1:1:length(f)
    Lfs(i) = fspl(R,lambda(i));
end

figure();
Ltotalfog = Lfs + Lfog;
plot(f,Ltotalfog);
title("Total attenuation of signals propagating through a cloud that is 1 km long at 1000 meters altitude");
xlabel("Frequency [Hz]");
ylabel("Attenuation [dB]");

%section 6
f = 20*1e9;
R = 10*1e3;
rainrate = 1;

Lrain = rainpl(R,f,rainrate)

rainrate = 10;
Lrain = rainpl(R,f,rainrate)

rainrate = 20;
f = 1e9:1e9:20*1e9;

for i = 1:1:length(f)
   Lrain(i) = rainpl(R,f(i),rainrate);
end

figure();
plot(f,Lrain);
title("attenuation due to a 20 mm/hr statistical rainfall for signals in the frequency range from 1 to 1000 GHz");
xlabel("Frequency [Hz]");
ylabel("Attenuation [dB]");

%section 7
f=1e9:1e9:1000*1e9;
T = 15;
P = 101300.0;
W = 7.5;

Lgas = gaspl(R,f,T,P,den);
Lgas0 = gaspl(R,f,T,P,0.0);

figure();
semilogy(f/1e9,Lgas)
hold on
semilogy(f/1e9,Lgas0)
grid
title("attenuation due to atmospheric gases");
xlabel('Frequency (GHz)')
ylabel('Specific Attenuation (dB)')
hold off