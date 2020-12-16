function [digit,cat]=decode_digit(I,u)
digit=100;
cat=100;
sA=zeros(10,7*u);
sA(1,:)=repelem([1 1 1 0 0 1 0],u);
sA(2,:)=repelem([1 1 0 0 1 1 0],u);
sA(3,:)=repelem([1 1 0 1 1 0 0],u);
sA(4,:)=repelem([1 0 0 0 0 1 0],u);
sA(5,:)=repelem([1 0 1 1 1 0 0],u);
sA(6,:)=repelem([1 0 0 1 1 1 0],u);
sA(7,:)=repelem([1 0 1 0 0 0 0],u);
sA(8,:)=repelem([1 0 0 1 0 0 0],u);
sA(9,:)=repelem([1 0 0 1 0 0 0],u);
sA(10,:)=repelem([1 1 1 0 1 0 0],u);

sC=~sA;

sB=zeros(10,7*u);
sB(1,:)=repelem([1 0 1 1 0 0 0],u);
sB(2,:)=repelem([1 0 0 1 1 0 0],u);
sB(3,:)=repelem([1 1 0 0 1 0 0],u);
sB(4,:)=repelem([1 0 1 1 1 1 0],u);
sB(5,:)=repelem([1 1 0 0 0 1 0],u);
sB(6,:)=repelem([1 0 0 0 1 1 0],u);
sB(7,:)=repelem([1 1 1 1 0 1 0],u);
sB(8,:)=repelem([1 1 0 1 1 1 0],u);
sB(9,:)=repelem([1 1 1 0 1 1 0],u);
sB(10,:)=repelem([1 1 0 1 0 0 0],u);


for i=1:10
    if(norm(I-sA(i,:))<=floor(u/2))
      norm(I-sA(i,:))
      digit=i-1;
      cat=1;
      break;
    elseif(norm(I-sB(i,:))<=floor(u/2))
     
      digit=i-1;
      cat=2;
      break;
    elseif(norm(I-sC(i,:))<=3)   
     
      digit=i-1;
      cat=3;
      break;
   end 
end

end