clear all;close all;clc

load qdy

%Bq=Bq(2765:1:end,:);
%PCq=PCq(2765:1:end,:);
[Ga,Ge,Gr] = cart2sph(PCq(:,1),PCq(:,2),PCq(:,3));
Rm=3393.5;
ye=pi/2-Ge;
ge=length(Bq);
bsph=datac2s(Bq(:,1),Bq(:,2),Bq(:,3),ye',Ga');

B=zeros(1,3*ge);


x1=1:3:ge*3-2;
x2=2:3:ge*3-1;
x3=3:3:ge*3;

xx=[x1,x2,x3];

B(x1)=bsph(1,:);
B(x2)=bsph(2,:);
B(x3)=bsph(3,:);


save('By.mat','B');







