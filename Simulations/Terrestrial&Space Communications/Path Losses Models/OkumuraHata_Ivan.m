clear all;
clc;

%section 2
htx = 100;
hrx = 3;
d = 3*1e3;
f = 870*1e6;

Ah = 8.29*(log10(1.54*hrx))^2-1.1

%section 3
clear all;

htx = 100;
hrx = 3;
d = 3:0.1:15;
f = 870;

Lsmall = SmallCity(f,htx,hrx,d);
Lbig = BigCity(f,htx,hrx,d);
Lsub = SubUrban(f,htx,hrx,d);
Lrural = Rural(f,htx,hrx,d);

figure();
plot(d,Lsmall);
title("Small City");
xlabel("Distance [km]");
ylabel("Attenuation [dB]");

figure();
plot(d,Lbig);
title("Big City");
xlabel("Distance [km]");
ylabel("Attenuation [dB]");

figure();
plot(d,Lsub);
title("SubUrban City");
xlabel("Distance [km]");
ylabel("Attenuation [dB]");

figure();
plot(d,Lrural);
title("Rural Area");
xlabel("Distance [km]");
ylabel("Attenuation [dB]");


function L = SmallCity(f,htx,hrx,d)
    
    Ah = (1.1*log10(f)-0.7)-(1.56*log10(f)-0.8);
    
    L =69.55 + 26.16*log10(f)-13.82*log10(htx)-Ah+(44.9-6.55*log10(hrx))*log10(d);
    %return L;
end

function L = BigCity(f,htx,hrx,d)
    if f <= 200
        Ah = 8.29*(log10(1.54*hrx))^2-1.1;
    else
        Ah = 3.2*(log10(11.75*hrx))^2-4.97;
    end
    
    L =69.55 + 26.16*log10(f)-13.82*log10(htx)-Ah+(44.9-6.55*log10(hrx))*log10(d);
    %return L;
end

function L = SubUrban(f,htx,hrx,d)
    
    %Ah = (1.1*log10(f)-0.7)*hrx-(1.56*log10(f)-0.8);
    
    L = BigCity(f,htx,hrx,d)-2*(log10(f/28))^2-5.4;
    %return L;
end

function L = Rural(f,htx,hrx,d)
    
    %Ah = (1.1*log10(f)-0.7)*hrx-(1.56*log10(f)-0.8);
    
    L = BigCity(f,htx,hrx,d)-4.78*(log10(f))^2+18.33*log10(f)-40.98;
    %return L;
end