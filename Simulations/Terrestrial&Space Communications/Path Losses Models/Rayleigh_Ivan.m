clear all;
clc;

N = 1000000;
Variance = 0.5;
Step = 0.1;
range = 0:Step:3;

X=randn(1,N)*sqrt(Variance);
Y=randn(1,N)*sqrt(Variance);

r = X + Y*i;

R = sqrt(X.^2 + Y.^2);
    
% Histogram
H=hist(R,range);
% Calucalte PDF based on Simulation
approxPDF = H/(Step*sum(H));
% Theoretical PDF based on analytical expression for Rayleigh PDF
theoretical = (range/Variance).*exp(-range.^2/(2*Variance));

plot(range, approxPDF, 'b*', range, theoretical, 'r')