close all;clear;clc


%% Parameters

N=256;

%% deploiement rayon

I=double(rgb2gray(imread('./img/danone.jpg')));

figure;
imshow(uint8(I));

[X,Y]=ginput(2);

L=sqrt((X(1)-X(2))^2+(Y(1)-Y(2))^2);

U=round(L*2);
u=linspace(1,U,U);

Xim=floor(X(1)+(u./(U-1))*abs(X(1)-X(2)));
Yim=floor(Y(1)+(u./(U-1))*abs(Y(1)-Y(2)));

%% definir le rayon utile 

I_ech=zeros(1,U);

for i=1:U
    I_ech(i)=I(Yim(i),Xim(i));
end

%Critère D'Otsu
[Hist,centers]=hist(I_ech,N);
Seuil=Otsu_estim(Hist,N);
I_bin=Binarize_sig(I_ech,Seuil);

figure;
imshow(uint8(I_ech));

figure;
plot(I_bin);

[first, last]=extract_util(I_bin);

Xut=[Xim(first) Xim(last)];
Yut=[Yim(first) Yim(last)];

L_ut=sqrt((Xut(1)-Xut(2))^2+(Yut(1)-Yut(2))^2);
u_base=ceil(L_ut/95);
L_ut=95*u_base;

l=linspace(1,L_ut,L_ut);
Xim_ut=floor(Xut(1)+(l./(L_ut-1))*abs(Xut(1)-Xut(2)));
Yim_ut=floor(Yut(1)+(l./(L_ut-1))*abs(Yut(1)-Yut(2)));

I_ut=zeros(1,L_ut);

for i=1:L_ut
    I_ut(i)=I(Yim_ut(i),Xim_ut(i));
end

figure;
imshow(uint8(I_ut));

I_ut_bin=Binarize_sig(I_ut,Seuil);

figure;
plot(I_ut_bin);