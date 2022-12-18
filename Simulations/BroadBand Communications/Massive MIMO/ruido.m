function n=ruido(K,ebn0)
sigma=sqrt(1/ebn0);
n=sigma*(randn(K,1)+j*randn(K,1))/sqrt(2);


end