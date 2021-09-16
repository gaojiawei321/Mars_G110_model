clear;close all;clc

load wc_suan_duo_q




%%


%wBt150=(dg150(:,1).^2+dg150(:,2).^2+dg150(:,3).^2).^0.5;
%wBt90=(dg90(:,1).^2+dg90(:,2).^2+dg90(:,3).^2).^0.5;
%wBt70=(dg70(:,1).^2+dg70(:,2).^2+dg70(:,3).^2).^0.5;

%r150=[(dg150(:,1)'*dg150(:,1) ./ length(dg150) ).^0.5 (dg150(:,2)'*dg150(:,2) ./ length(dg150) ).^0.5 (dg150(:,3)'*dg150(:,3) ./ length(dg150) ).^0.5] ;
%norm(r150)
%mean(wBt150);
%mean(wBt90);
%mean(wBt70);

%nr150=[ ((dg150(:,1)'*dg150(:,1) ./ length(dg150) )+ (dg150(:,2)'*dg150(:,2) ./ length(dg150) )+   dg150(:,3)'*dg150(:,3) ./ length(dg150) ).^0.5  ] ;
nr130=[ ((dg130(:,1)'*dg130(:,1) ./ length(dg130) )+ (dg130(:,2)'*dg130(:,2) ./ length(dg130) )+   dg130(:,3)'*dg130(:,3) ./ length(dg130) ).^0.5  ] ;
nr120=[ ((dg120(:,1)'*dg120(:,1) ./ length(dg120) )+ (dg120(:,2)'*dg120(:,2) ./ length(dg120) )+   dg120(:,3)'*dg120(:,3) ./ length(dg120) ).^0.5  ] ;
nr110=[ ((dg110(:,1)'*dg110(:,1) ./ length(dg110) )+ (dg110(:,2)'*dg110(:,2) ./ length(dg110) )+   dg110(:,3)'*dg110(:,3) ./ length(dg110) ).^0.5  ] ;
nr100=[ ((dg100(:,1)'*dg100(:,1) ./ length(dg100) )+ (dg100(:,2)'*dg100(:,2) ./ length(dg100) )+   dg100(:,3)'*dg100(:,3) ./ length(dg100) ).^0.5  ] ;
nr90=[ ((dg90(:,1)'*dg90(:,1) ./ length(dg90) )+ (dg90(:,2)'*dg90(:,2) ./ length(dg90) )+   dg90(:,3)'*dg90(:,3) ./ length(dg90) ).^0.5  ] ;
nr80=[ ((dg80(:,1)'*dg80(:,1) ./ length(dg80) )+ (dg80(:,2)'*dg80(:,2) ./ length(dg80) )+   dg90(:,3)'*dg80(:,3) ./ length(dg80) ).^0.5  ] ;
nr70=[ ((dg70(:,1)'*dg70(:,1) ./ length(dg70) )+ (dg70(:,2)'*dg70(:,2) ./ length(dg70) )+   dg70(:,3)'*dg70(:,3) ./ length(dg70) ).^0.5  ] ;


nx=[  nr130 nr120 nr110 nr100 nr90 nr80 nr70]

%%

AL=[400 200 120];
for i=1:3
    

rm=3393.5;
aj=0.5;
ej=0.5;
Az=aj:aj:360;
El=-89.9+ej:ej:89.9;

az=Az/180*pi;
el=El/180*pi;

Coe=pi/2-el;

[AZ,EL]=meshgrid(az,el);

[AZ2,EL2]=meshgrid(az,Coe);

al=AL(i);
h=rm+al*ones(length(el),length(az));

[lx,ly,lz] = sph2cart(AZ,EL,h);

Lx=reshape(lx,1,[]);
Ly=reshape(ly,1,[]);
Lz=reshape(lz,1,[]);


SE=reshape(EL2,1,[]);


a=[Lx;Ly;Lz];


brtp70=gao_r_70(a);
brtp80=gao_r_80(a);
brtp90=gao_r(a);
brtp100=gao_r_100(a);
brtp110=gao_r_110(a);
brtp120=gao_r_120(a);
brtp130=gao_r_130(a);

%brtp150=gao_r_150(a);


Bt70=(brtp70(1,:).^2+brtp70(2,:).^2+brtp70(3,:).^2).^0.5;
Bt80=(brtp80(1,:).^2+brtp80(2,:).^2+brtp80(3,:).^2).^0.5;
Bt90=(brtp90(1,:).^2+brtp90(2,:).^2+brtp90(3,:).^2).^0.5;
Bt100=(brtp100(1,:).^2+brtp100(2,:).^2+brtp100(3,:).^2).^0.5;
Bt110=(brtp110(1,:).^2+brtp110(2,:).^2+brtp110(3,:).^2).^0.5;
Bt120=(brtp120(1,:).^2+brtp120(2,:).^2+brtp120(3,:).^2).^0.5;
Bt130=(brtp130(1,:).^2+brtp130(2,:).^2+brtp130(3,:).^2).^0.5;
%Bt150=(brtp150(1,:).^2+brtp150(1,:).^2+brtp150(1,:).^2).^0.5;


Vnr=[ %sum(Bt150)/length(Bt150)
    sum(Bt130.^2)/length(Bt130)
    sum(Bt120.^2)/length(Bt120)
    sum(Bt110.^2)/length(Bt110)
    sum(Bt100.^2)/length(Bt100)
    sum(Bt90.^2)/length(Bt90)
    sum(Bt80.^2)/length(Bt80)
    sum(Bt70.^2)/length(Bt70)

]

Vns=[ %sum(Bt150)/length(Bt150)
    sum(Bt130.^2.*sin(SE)*(pi/length(El))*(2*pi/length(Az)))
    sum(Bt120.^2.*sin(SE)*(pi/length(El))*(2*pi/length(Az)))
    sum(Bt110.^2.*sin(SE)*(pi/length(El))*(2*pi/length(Az)))
    sum(Bt100.^2.*sin(SE)*(pi/length(El))*(2*pi/length(Az)))
    sum(Bt90.^2.*sin(SE)*(pi/length(El))*(2*pi/length(Az)))
    sum(Bt80.^2.*sin(SE)*(pi/length(El))*(2*pi/length(Az)))
    sum(Bt70.^2.*sin(SE)*(pi/length(El))*(2*pi/length(Az)))

]


Vnr1=[ %sum(Bt150)/length(Bt150)
    sum(Bt130)/length(Bt130)
    sum(Bt120)/length(Bt120)
    sum(Bt110)/length(Bt110)
    sum(Bt100)/length(Bt100)
    sum(Bt90)/length(Bt90)
    sum(Bt80)/length(Bt80)
    sum(Bt70)/length(Bt70)

]


%Vn(:,i)=Vnr;

Vn(:,i)=Vns;


Vn1(:,i)=Vnr1;





end






%%
%Vn(3,3)=81.

%%


pos=[0 0 15 15];

set(gcf,'PaperPositionMode','manual','PaperUnits','centimeters',...
        'PaperPosition',pos,'units','centimeters','position',pos);
    
    
plot(nx,Vn(:,1),'r','LineWidth',2,'Markersize',15); hold on;
plot(nx,Vn(:,2),'g','LineWidth',2,'Markersize',15); hold on;
plot(nx,Vn(:,3),'b','LineWidth',2,'Markersize',15); hold on;
 
    


plot(nx,Vn(:,1),'k.','Markersize',15); hold on;
plot(nx,Vn(:,2),'k.','Markersize',15); hold on;
plot(nx,Vn(:,3),'k.','Markersize',15); hold on;


%xlim([8 17])

%ylim([10 150])

xlim([10.5 15])

ylim([4000 600000])


%title(['400km Latitude (-90° - 90°)'])
xlabel('MAVEN rms misfit (nT)','FontSize',15)
ylabel('Model roughness','FontSize',15)

%t1=
%text(nx(2:7)-0.4,Vn(2:7,3)+1,{'G120','G110','G100','G90','G80','G70'},'Color','blue','FontSize',10)

text(nx(4:7)-0.13,Vn(4:7,3)-30000,{'G100','G90','G80','G70'},'Color','black','FontSize',10)

text(nx(2)-0.2,Vn(2,3)+30000,{'G120'},'Color','black','FontSize',10)

text(nx(3)-0.2,Vn(3,3)-30000,{'G110'},'Color','red','FontSize',10)


%text(nx(4:end)-0.3,Vn(4:end,3)+5,{'G100','G90','G80','G70'},'Color','black','FontSize',10)
%text(nx(1)-0.6,Vn(1,3)+1,{'G130'},'Color','black','FontSize',10)
%text(nx(2)-0.6,Vn(2,3)-2,{'G120'},'Color','black','FontSize',10)
%text(nx(3)-0.2,Vn(3,3)-6,{'G110'},'Color','red','FontSize',10)

%set(gca,'ytick',[1000 10000 20000])

%set(gca,'yticklabels',[10 30 50 70 100 140])


set(gca,'yscale','log')
set(gca,'xscale','log')


grid on;


plot(nx(3),Vn(3,1),'r.','Markersize',15); hold on;
plot(nx(3),Vn(3,2),'r.','Markersize',15); hold on;
plot(nx(3),Vn(3,3),'r.','Markersize',15); hold on;


legend('400 km','200 km','120 km'); 

print('-dtiff ','-r600',[ '/Users/gaojiawei/Desktop/f_re/r1/roughness_all_3_s.tiff'])



%%
%{
figure

pos=[0 0 15 15];

set(gcf,'PaperPositionMode','manual','PaperUnits','centimeters',...
        'PaperPosition',pos,'units','centimeters','position',pos);
    
    
plot(nx,Vn1(:,1),'r','LineWidth',2,'Markersize',10); hold on;
plot(nx,Vn1(:,2),'g','LineWidth',2,'Markersize',10); hold on;
plot(nx,Vn1(:,3),'b','LineWidth',2,'Markersize',10); hold on;
 
    


plot(nx,Vn1(:,1),'k.','Markersize',20); hold on;
plot(nx,Vn1(:,2),'k.','Markersize',20); hold on;
plot(nx,Vn1(:,3),'k.','Markersize',20); hold on;


%xlim([8 17])

%ylim([10 150])

%xlim([10.5 15])

%ylim([300 40000])


%title(['400km Latitude (-90° - 90°)'])
xlabel('MAVEN rms misfit (nT)','FontSize',15)
ylabel('Model roughness','FontSize',15)

%t1=
%text(nx-0.4,Vn(:,3)+1,{'G130','G120','G110','G100','G90','G80','G70'},'Color','blue','FontSize',10)

%text(nx(4:end)-0.3,Vn(4:end,3)+5,{'G100','G90','G80','G70'},'Color','black','FontSize',10)
%text(nx(1)-0.6,Vn(1,3)+1,{'G130'},'Color','black','FontSize',10)
%text(nx(2)-0.6,Vn(2,3)-2,{'G120'},'Color','black','FontSize',10)
%text(nx(3)-0.2,Vn(3,3)-6,{'G110'},'Color','red','FontSize',10)

%set(gca,'ytick',[10 30 50 70 100 140])

%set(gca,'yticklabels',[10 30 50 70 100 140])


set(gca,'yscale','log')
set(gca,'xscale','log')


grid on;


plot(nx(3),Vn1(3,1),'r.','Markersize',20); hold on;
plot(nx(3),Vn1(3,2),'r.','Markersize',20); hold on;
plot(nx(3),Vn1(3,3),'r.','Markersize',20); hold on;


legend('400 km','200 km','120 km'); 


%}




