clear;close all;clc

%% load data

load pc_q.mat
load mso_q.mat



[Ma,Me,Mr] = cart2sph(pc_q(:,5),pc_q(:,6),pc_q(:,7));

Me_zhuan=pi/2-Me;


BT=(pc_q(:,1).^2+pc_q(:,2).^2+pc_q(:,3).^2).^0.5;



%%
Rm=3393.5;
syear=2017;smonth=1;sday=20;
shour=20;sminute=40;ssecond=0;

eyear=2017;emonth=1;eday=23;
ehour=5;eminute=50;esecond=0;


 [ Year Month  Day] = date2str( syear,smonth,sday );
 
  Ts=datenum(syear,smonth,sday,shour,sminute,ssecond);
  Te=datenum(eyear,emonth,eday,ehour,eminute,esecond);
  

z1=find(pc_q(:,1)>Ts&pc_q(:,1)<Te &mso_q(:,5)<-1000 & Mr<3393.5+400 & BT>500 & Ma>1.2 &Me<0 );

B=pc_q(z1,2:4);

PC=pc_q(z1,5:7);

[Ga,Ge,Gr] = cart2sph(PC(:,1),PC(:,2),PC(:,3));

Ge_zhuan=pi/2-Ge;


B=datac2s(B(:,1),B(:,2),B(:,3),Ge_zhuan',Ga')';




T=pc_q(z1,1);


h=Mr(z1)-3393.5;

L1=Ma;
zhuan1=find(Ma<0);
L1(zhuan1)=2*pi-Ma(zhuan1);



%[Ga,Ge,Gr] = cart2sph(PCq(:,1),PCq(:,2),PCq(:,3));
%ye=pi/2-Ge;
%bsph=datac2s(Bq(:,1),Bq(:,2),Bq(:,3),ye',Ga');


%%

pos=[1 1 15 20];
set(gcf,'unit','centimeters','position',pos)

xmin=datenum(syear,smonth,23,3,48,0);
xmax=datenum(syear,smonth,23,3,52,0);



%lx=[xmin, datenum(syear,smonth,23,3,50,0), xmax];


lx=xmin:datenum(0,0,0,0,1,0):xmax;


z2=find(xmin<T&T<xmax);
Lon=L1(z1(z2));
Lat=Me(z1(z2));




BG90=gao_r(PC')';
BG110=gao_r_110(PC')';
%BC90=cain(PC')';

BG130=gao_r_130(PC')';

axes('position',[0.12,0.82,0.8,0.15])


plot(T,B(:,1),'k--','LineWidth',2); hold on;
plot(T,BG130(:,1),'g','LineWidth',1); hold on;
plot(T,BG90(:,1),'b','LineWidth',1); hold on;
plot(T,BG110(:,1),'r','LineWidth',1); hold on;

%plot(T,BG150(:,1),'g','LineWidth',0.5); hold on;


%plot(T,BC90(:,1),'g'); hold on;

title([ Year,'-',Month,'-','23' , ' MAVEN observation'] )

ylabel('B_r (nT)')
%datetick('x',15)
xlim([xmin xmax])

set(gca,'XTick',lx)
set(gca,'XTicklabel',[])


set(gca,'xminortick','on')   

grid on

legend({'obs','G130','G90','G110'},'FontSize',6,'location','northwest')
   

%%
axes('position',[0.12,0.63,0.8,0.15])


plot(T,B(:,2),'k--','LineWidth',2); hold on;
plot(T,BG130(:,2),'g','LineWidth',1); hold on;
plot(T,BG90(:,2),'b','LineWidth',1); hold on;
plot(T,BG110(:,2),'r','LineWidth',1); hold on;
%plot(T,BG150(:,2),'g','LineWidth',0.5); hold on;



%plot(T,BC90(:,1),'g'); hold on;

ylabel('B_\theta (nT)')

%datetick('x',13)
 
 
xlim([xmin xmax])
set(gca,'XTick',lx)
set(gca,'XTicklabel',[])

set(gca,'xminortick','on')  
grid on

%legend('obs','L134','M110','G90')

%%

axes('position',[0.12,0.44,0.8,0.15])


plot(T,B(:,3),'k--','LineWidth',2); hold on;
plot(T,BG130(:,3),'g','LineWidth',1); hold on;
plot(T,BG90(:,3),'b','LineWidth',1); hold on;
plot(T,BG110(:,3),'r','LineWidth',1); hold on;
%plot(T,BG150(:,3),'g','LineWidth',0.5); hold on;


%plot(T,BC90(:,1),'g'); hold on;

ylabel('B_\phi (nT)')

%datetick x
xlim([xmin xmax])
set(gca,'XTick',lx)
set(gca,'XTicklabel',[])
set(gca,'xminortick','on')  
grid on

%legend('obs','L134','M110','G90')

%%
%{
axes('position',[0.12,0.28,0.8,0.1])

plot(T,h,'k','LineWidth',1); hold on;

ylabel('H (km)')

datetick x
xlim([xmin xmax])
set(gca,'XTick',lx)
set(gca,'xminortick','on') 
grid on
%}


axes('position',[0.12,0.29,0.8,0.12])


Bt=(B(:,1).^2+B(:,2).^2+B(:,3).^2).^0.5;
BG120t=(BG110(:,1).^2+BG110(:,2).^2+BG110(:,3).^2).^0.5;
BG150t=(BG130(:,1).^2+BG130(:,2).^2+BG130(:,3).^2).^0.5;
BG90t=(BG90(:,1).^2+BG90(:,2).^2+BG90(:,3).^2).^0.5;

plot(T,abs(BG150t-Bt),'g','LineWidth',1); hold on;

plot(T,abs(BG90t-Bt),'b','LineWidth',1); hold on;
plot(T,abs(BG120t-Bt),'r','LineWidth',1); hold on;
%plot(T,zeros(length(T),1),'k','LineWidth',1); hold on;


ylabel('|\DeltaB| (nT)')


%datetick x
xlim([xmin xmax])
ylim([-5 30])

set(gca,'XTick',lx)
set(gca,'XTicklabel',{'03:48','03:49','03:50','03:51','03:52'})

set(gca,'xminortick','on') 
grid on


legend({'G130','G90','G110'},'FontSize',6,'location','northwest')



%%
axes('position',[0.12,0.06,0.8,0.14])

plot(Lon,Lat,'k','LineWidth',1); hold on;


xlim([pi/3*2 pi])
ylim([-pi/2 0])

xlabel('Longitude (°)')
ylabel('Latitude (°)')

set(gca,'XTick',[pi/3*2 pi/6*5  pi])
set(gca,'XTicklabel',[120 150 180])

set(gca,'YTick',[-pi/2 -pi/4 0])
set(gca,'YTicklabel',[-90 -45 0])


%set(gca,'XTick',[0 pi 2*pi])
%set(gca,'XTicklabel',[0 180 360])

%set(gca,'YTick',[-pi/2 0 pi/2])
%set(gca,'YTicklabel',[-90 0 90])

set(gca,'xminortick','on')  
set(gca,'yminortick','on')  

grid on

%%

set(gcf,'PaperPositionMode','manual','PaperUnits','centimeters',...
        'PaperPosition',pos,'units','centimeters','position',pos);
    
    
print('-dtiff ','-r600',[ '/Users/gaojiawei/Desktop/f_re/','track2_rtp.tiff'])



%%
