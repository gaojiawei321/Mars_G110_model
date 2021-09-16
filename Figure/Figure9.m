
clear;close all;clc
%rm=3393.5;
rm=3393.5;
aj=0.2;
ej=0.2;
Az=aj:aj:360;
El=-90+ej:ej:90;
az=Az/180*pi;
el=El/180*pi;

[AZ,EL]=meshgrid(az,el);

al=120;
h=rm+al*ones(length(el),length(az));

[lx,ly,lz] = sph2cart(AZ,EL,h);

Lx=reshape(lx,1,[]);
Ly=reshape(ly,1,[]);
Lz=reshape(lz,1,[]);

a=[Lx;Ly;Lz];

%brtp=gao_r(a);

brtp1=lang18_r(a);

brtp2=gao_r_110(a);


%brtp=brtp2-brtp1;

brtp=brtp2;

%%

%brtp=brtp2;



for i=1:3
  %  bx=reshape(bca(1,:),length(el),[]);
  %  by=reshape(bca(2,:),length(el),[]);
  %  bz=reshape(bca(3,:),length(el),[]);

    br=reshape(brtp(1,:),length(el),[]);
    bt=reshape(brtp(2,:),length(el),[]);
    bp=reshape(brtp(3,:),length(el),[]);
    
    
end

ball=(br.^2+bt.^2+bp.^2).^0.5;

[z1,z2]=size(ball);
ball=[ball(:,round(z2/2)+1:end) ball(:,1:round(z2/2)) ];
br=[br(:,round(z2/2)+1:end) br(:,1:round(z2/2)) ];
bt=[bt(:,round(z2/2)+1:end) bt(:,1:round(z2/2)) ];
bp=[bp(:,round(z2/2)+1:end) bp(:,1:round(z2/2)) ];


%%     
   figure
   load geoid
 %  load mola128_dx
   load mycolormap2.mat
   load gray_topo
   mm=flipud(mm);
   [z1,z2]=size(mm);
   
   mm=[mm(:,round(z2/2)+1:end) mm(:,1:round(z2/2)) ];
 %  load gray_A
   %%
pos=[1 1 18 15];
set(gcf,'unit','centimeters','position',pos)

%set(get(hcb,'Xlabel'),'String','std (nT)')

%axes('position',[0.1,0.1,0.7,0.8])  

lon1=115;
lon2=155;
lat1=-15;
lat2=20;
axesm('eckert4','maplatlim',[lat1 lat2],'maplonlim',[lon1 lon2])

%framem;
%gridm;
axis off
tightmap


x=linspace(-pi,pi,z2)*180/pi;
y=linspace(-pi/2,pi/2,z1)*180/pi;

xjie=find(x<lon2&x>lon1);
yjie=find(y<lat2&y>lat1);

[X Y]=meshgrid(x(xjie),y(yjie));
[Xy Yy]=meshgrid(x,y);


dj=mm(yjie,xjie);

g1=linspace(0.5,1,10000);
g2=[g1;g1;g1];
%colormap(g2')

sd=surflsrm(Yy,Xy,double(mm)/1200,[315,45],g2')  ;
colormap(g2')
ax1=axes ;

axesm('eckert4','maplatlim',[lat1 lat2],'maplonlim',[lon1 lon2])

framem; 
gridm; 
mlabel('south'); 
plabel;
axis off
tightmap
 
geoidrefvec=[1/aj,90,180]; 

%x1=find(ball<1000);
%ball(x1)=NaN;


%B=contourfm(br, geoidrefvec,-200:20:200, 'LineStyle', 'none'); hold on;

B=geoshow(br, geoidrefvec, 'DisplayType', 'texturemap'); hold on;


%colormap jet
alpha(B,0.5);
load mycolormap1
load mycolormap3

colormap(ax1,mycolormap3)
%set(ax1, 'CLim', [0 10000]);
%caxis([0 50]);

%title(['Gao model-',num2str(al),' km altutude B_r (nT)'],'fontsize',18)

hcb = colorbar('position',[0.85 0.1 0.03 0.83]);
hcb.Label.String = 'B_r (nT)';

hcb.FontSize = 12;


%caxis([-50 50]);

caxis([-100 100]);


plotm([4.5 135.62],'*k','MarkerSize',20,'LineWidth',1.5)

textm(2,131,'InSight','color','black','FontSize',20,'FontWeight','bold')


title('G110 model B_r at 120 km altitude','FontSize',15)

%title('L134 model B_r at 120 km altitude','FontSize',15)

%title('The difference of B_r at 120 km altitude','FontSize',15)



%%



%%


set(gcf,'PaperPositionMode','manual','PaperUnits','centimeters',...
        'PaperPosition',pos,'units','centimeters','position',pos);
    
%print('-dtiff ','-r600',[ '/Users/gaojiawei/program/mars/crust/wucha/wucha_xin/model_quyu/','gao_quyu_4.tiff'])

%print('-dtiff ','-r600',[ '/Users/gaojiawei/Desktop/f_re/quyu_l134_120.tiff'])

print('-dtiff ','-r600',[ '/Users/gaojiawei/Desktop/f_re/quyu_g110_120.tiff'])

%print('-dtiff ','-r600',[ '/Users/gaojiawei/Desktop/f_re/quyu_db_120.tiff'])
