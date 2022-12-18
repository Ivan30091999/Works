clear all;
clc;

%section 2
figure();

f = 10*1e9;
lambda = 3*1e8/f;
d0 = 10;
n = 4;
sdeviation = 8;
d = 0:1:1e3;

for i = 1:1:length(d)
    L(i) = fspl(d0,lambda)+ 10*n*log(d(i)/d0) + randn*sdeviation;
end

n = 1:1:4;
for i = 1:1:length(n)
    for j = 1:1:length(d)
        L(i,j) = fspl(d0,lambda)+ 10*n(i)*log(d(j)/d0) + randn*sdeviation;
    end
    plot(d,L(i,:));
    hold on
end
legend(["n = 1","n = 2", "n = 3", "n = 4"]);
