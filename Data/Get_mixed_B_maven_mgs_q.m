clear all;close all;clc

load mso_q.mat
load pc_q.mat

load ab_mso_q.mat
load ab_pc_q.mat

load MGS_merged_mag1min.mat

Rm=3393.5;

mgsall=[T x y z Bx By Bz Gx Gy Gz GBx GBy GBz];
clear T x y z Bx By Bz Gx Gy Gz GBx GBy GBz
[Ga2,Ge2,Gr2] = cart2sph(mgsall(:,8),mgsall(:,9),mgsall(:,10));
 
T1=datenum(1999,3,1,0,0,0);
%tmpo=find(T>T1);
%tab=find(T<T1);

abB= ab_pc_q(:,2:4);
abpc= ab_pc_q(:,5:7);
[aba,abe,abr] = cart2sph(abpc(:,1),abpc(:,2),abpc(:,3));


B= pc_q(:,2:4);
pc= pc_q(:,5:7);
[Ma,Me,Mr] = cart2sph(pc(:,1),pc(:,2),pc(:,3));

MAVh1=Mr-Rm;
MGSh2=Gr2-Rm;
abh1=abr-Rm;
 

 mav1=find(MAVh1<500& mso_q(:,5)<-590);%
 mgs2=find(MGSh2<500& mgsall(:,2)<-590 );
 ab1=find(abh1<500& ab_mso_q(:,5)<-590 );

mean(MGSh2(mgs2))
mean(MAVh1(mav1))
 
 
mgs_mpo=find(MGSh2<500& mgsall(:,2)<-590 & mgsall(:,1)>T1);
%mgs_ab=find(MGSh2<500& mgsall(:,2)<-590 & T<T1);

mgs_mpo=mgs_mpo(1:1:end);
%mgs_ab=mgs_ab(1:1:end);

%Bmgs2=[mgsmpo(mgs2,11) mgsmpo(mgs2,12) mgsmpo(mgs2,13);];
%PCmgs2=[mgsmpo(mgs2,8) mgsmpo(mgs2,9) mgsmpo(mgs2,10);];

Bmgsmpo=[mgsall(mgs_mpo,11) mgsall(mgs_mpo,12) mgsall(mgs_mpo,13);];
PCmgsmpo=[mgsall(mgs_mpo,8) mgsall(mgs_mpo,9) mgsall(mgs_mpo,10);];

%Bmgsab=[mgsall(mgs_ab,11) mgsall(mgs_ab,12) mgsall(mgs_ab,13);];
%PCmgsab=[mgsall(mgs_ab,8) mgsall(mgs_ab,9) mgsall(mgs_ab,10);];


Bq=[B(mav1,:); Bmgsmpo;abB(ab1,:);];
PCq=[ pc(mav1,:);PCmgsmpo;abpc(ab1,:);];

%Bq=[B(mav1,:);];
%PCq=[ pc(mav1,:);];

%}

 %Bq=[B(mav1,:); ];
%PCq=[ pc(mav1,:);];

%qq=round(linspace(1,length(Bq),1000000));

%Bq=Bq(qq,:);
%PCq=PCq(qq,:);


%Bq=Bq(1:1:2000000,:);
%PCq=PCq(1:1:2000000,:);


%Bq=Bq(1:10000,:);
%PCq=PCq(1:10000,:);



 save qd Bq PCq

%%


Rm=3393.5;




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
    

pcolor(hb2)


   shading flat;
     colorbar






