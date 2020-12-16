function [digit,cat]=decode_digit(I,u)
digit=100;
cat=100;
B=1;
N=0;
sA=zeros(10,7*u);
sA(1,:)=repelem([B B B N N B N],u);
sA(2,:)=repelem([B B N N B B N],u);
sA(3,:)=repelem([B B N B B N N],u);
sA(4,:)=repelem([B N N N N B N],u);
sA(5,:)=repelem([B N B B B N N],u);
sA(6,:)=repelem([B N N B B B N],u);
sA(7,:)=repelem([B N B N N N N],u);
sA(8,:)=repelem([B N N N B N N],u);
sA(9,:)=repelem([B N N B N N N],u);
sA(10,:)=repelem([B B B N B N N],u);

sC=~sA;

sB=zeros(10,7*u);
sB(1,:)=repelem([B N B B N N N ],u);
sB(2,:)=repelem([B N N B B N N],u);
sB(3,:)=repelem([B B N N B N N],u);
sB(4,:)=repelem([B N B B B B N],u);
sB(5,:)=repelem([B B N N N B N ],u);
sB(6,:)=repelem([B N N N B B N ],u);
sB(7,:)=repelem([B B B B N B N],u);
sB(8,:)=repelem([B B N B B B N],u);
sB(9,:)=repelem([B B B N B B N],u);
sB(10,:)=repelem([B B N B N N N],u);

Estimations=zeros(3,10);
for i=1:10
    Estimations(1,i)=norm(I-sA(i,:));
    Estimations(2,i)=norm(I-sB(i,:));
    Estimations(3,i)=norm(I-sC(i,:));
end
[~,min1]=min(Estimations(1,:));
[~,min2]=min(Estimations(2,:));
[~,min3]=min(Estimations(3,:));

[~,min_cat]=min([Estimations(1,min1) Estimations(2,min2) Estimations(3,min3)]);

switch min_cat
    case 1
        digit=min1-1;
        cat=1;
    case 2
        digit=min2-1;
        cat=2;
    case 3
        digit=min3-1;    
        cat=3;
end


end