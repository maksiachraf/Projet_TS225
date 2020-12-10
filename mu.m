function muk = mu(Hist,k)
x=1:1:k;
muk=sum(x.*Hist(1:k))/sum(Hist);
end

