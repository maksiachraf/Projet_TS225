function pos = Otsu_estim(Hist,N)
crit=zeros(1,N);
for k=1:N
   crit(k)=w(Hist,k)*((mu(Hist,N)-mu(Hist,k))^2)+(1-w(Hist,k))*(mu(Hist,k)^2);      
end
[~,pos]=max(crit);

end

