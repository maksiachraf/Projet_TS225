close all;clear;clc

I=double(imread('./img/danone.jpg'));

figure;
imshow(uint8(I));

[X,Y]=ginput(2);

L=sqrt((X(1)-X(2))^2+(Y(1)-Y(2))^2);

U=round(L*2);
u=linspace(1,U,U);

Xim=X(1)+(u./(U-1))*abs(X(1)-X(2));
Yim=Y(1)+(u./(U-1))*abs(Y(1)-Y(2));



