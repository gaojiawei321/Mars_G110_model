clear all;close all;clc

load qd_jie


%ch=3888000;
ch= 340000;

xuan=randperm(length(Bq),ch);
  
%xuan=1:1:length(Bq);


ge=length(Bq);
Cdn=zeros(1,ge);
    
Cdn=Cdn(xuan);
%mm=mean(Cdn);

%Cdn=Cdn/mm;
Bq=Bq(xuan,:);
PCq=PCq(xuan,:);



%ge=length(Cdn);
ge=ch;
Cd=sparse(ge*3,ge*3); 

x1=1:3:ge*3-2;
x2=2:3:ge*3-1;
x3=3:3:ge*3;

j1=ones(1,ge);

CC=[j1 j1 j1];

S = sparse([x1 x2 x3],[x1 x2 x3],CC);



Cdn=S;

save Cdn Cdn 


%save Cdn2 Cdn
save qd_jie3 Bq PCq



%%%%%%%%%%%%%%%%%

%%


 [qa,qe,qr] = cart2sph(PCq(:,1),PCq(:,2),PCq(:,3));
jg=180;
wg=90;
jing=linspace(-pi,pi,jg);
wei=linspace(-pi/2,pi/2,wg);
for i=1:jg-1
    for j=1:wg-1
        zz=find(qa<jing(i+1)&qa>jing(i)&qe<wei(j+1)&qe>wei(j));
        bpp=Bq(zz);
        Bping(i,j)=norm(mean(bpp));
        [g1,g2]=size(zz);
        ge(i,j)=g1;
        
    end
end
   %   bt=(Bping(:,:,1).^2+Bping(:,:,2).^2+Bping(:,:,3).^2).^0.5;
    
  %  btz=bt';
   Bping=Bping';
    hb=[Bping(:,jg/2:jg-1) Bping(:,1:jg/2-1)];
    
    ge=ge';
    hb2=[ge(:,jg/2:jg-1) ge(:,1:jg/2-1)];
    

pcolor(hb)


   shading flat;
     colorbar



