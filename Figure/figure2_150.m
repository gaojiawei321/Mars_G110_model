clear;close all;clc
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

brtp=gao_r(a);
%brtp=gao_r_c(a);

%brtp=lang18_r(a);
%brtp=cain_r(a);



for i=1:3
  %  bx=reshape(bca(1,:),length(el),[]);
  %  by=reshape(bca(2,:),length(el),[]);
  %  bz=reshape(bca(3,:),length(el),[]);

    br=reshape(brtp(1,:),length(el),[]);
    bt=reshape(brtp(2,:),length(el),[]);
    bp=reshape(brtp(3,:),length(el),[]);
    
    
end

ball=(br.^2+bt.^2+bp.^2).^0.5;



%%     
   figure
 
   load geoid
   load mola128_dx
   load mycolormap2.mat
   load mycolormap4.mat
   
   %%
   
   pos=[1 1 20 30];
set(gcf,'unit','centimeters','position',pos)

%%
ln=1000;


ax1=axes('position',[0.05,0.76,0.18,0.18])  ;
axesm('ortho','maplatlim',[60 90]);

gridm on;
framem on;
axis off

%mlabel('equator')
%mlabel;
%mlabel('south')
%plabel('west')
%plabel('fontweight','bold')


geoidrefvec=[1/aj,90,0];  
B=geoshow(ball, geoidrefvec, 'DisplayType', 'texturemap'); hold on;

h1=hot(20); 
h1(19,:)=[0.9 0.9 0.9];
colormap(ax1,flipud(h1(1:2:20,:) ))
caxis([0 ln]);


%%

ax1=axes('position',[0.3,0.75,0.4,0.2])  ;
axesm eckert4; 
framem;
gridm;
axis off

geoidrefvec=[1/aj,90,180];  
B=geoshow(ball, geoidrefvec, 'DisplayType', 'texturemap'); hold on;

%colormap jet
%alpha(B,0.5);
%colormap(ax1,mycolormap2)
h1=hot(20);
h1(19,:)=[0.9 0.9 0.9];
colormap(ax1,flipud(h1(1:2:20,:) ))
caxis([0 ln]);

%title(['G90 model-',num2str(al),' km altutude B_t (nT)'],'fontsize',10)

text(-0.8,-1.8,'East Longitude','FontSize',10)
text(-3.3,-0.5,'Latitude','FontSize',10,'rotation',90)

hcb = colorbar('location','southoutside','position',[0.1 0.72 0.8 0.02]);
set(get(hcb,'Xlabel'),'String','|B| (nT)','FontSize',10)
%hcb = colorbar('position',[0.1 0.6 0.8 0.03]);

%set(get(hcb,'Xlabel'),'String','std (nT)')


text(2.1,1.2,'90^o')
text(2.75,0,'0^o')
text(2,-1.2,'-90^o')

text(-2.54,1.2,'90^o')
text(-3.0,0,'0^o')
text(-2.54,-1.2,'-90^o')

text(-1.7,-1.5,'0^o')
text(-0.1,-1.5,'180^o')
text(1.5,-1.5,'360^o')


ax1=axes('position',[0.3,0.75,0.4,0.2])  ;
axesm eckert4; 
%framem;
%gridm;
axis off

geoidrefvec=[2,90,180]; 
[c,h] = contourm(mola128_dx,geoidrefvec,-40000:20000:40000,'k'); hold on;

   %%
ax1=axes('position',[0.75,0.76,0.18,0.18])  ;
axesm('ortho','maplatlim',[-90 -60]);

gridm on;
framem on;
axis off

%mlabel('equator')
%mlabel;
%mlabel('north')
%plabel;
%plabel('meridian');
%plabel('fontweight','bold')


geoidrefvec=[1/aj,90,0];  
B=geoshow(ball, geoidrefvec, 'DisplayType', 'texturemap'); hold on;

h1=hot(20);
h1(19,:)=[0.9 0.9 0.9];
colormap(ax1,flipud(h1(1:2:20,:) ))
caxis([0 ln]);


%%
   
L1=500;

ax2=axes('position',[0.05,0.51,0.18,0.18])  ;
axesm('ortho','maplatlim',[60 90]);

gridm on;
framem on;
axis off

geoidrefvec=[1/aj,90,0];  
B=geoshow(br, geoidrefvec, 'DisplayType', 'texturemap'); hold on;

colormap(ax2,mycolormap4)
caxis([-L1 L1]);

ax2=axes('position',[0.3,0.50,0.4,0.2])  ;
axesm eckert4; 
framem;
gridm;
axis off

geoidrefvec=[1/aj,90,180];  
B=geoshow(br, geoidrefvec, 'DisplayType', 'texturemap'); hold on;

colormap(ax2,mycolormap4)
caxis([-L1 L1]);

text(-0.8,-1.8,'East Longitude','FontSize',10)
text(-3.3,-0.5,'Latitude','FontSize',10,'rotation',90)

text(2.1,1.2,'90^o')
text(2.75,0,'0^o')
text(2,-1.2,'-90^o')

text(-2.54,1.2,'90^o')
text(-3.0,0,'0^o')
text(-2.54,-1.2,'-90^o')

text(-1.7,-1.5,'0^o')
text(-0.1,-1.5,'180^o')
text(1.5,-1.5,'360^o')


ax2=axes('position',[0.3,0.50,0.4,0.2])  ;
axesm eckert4; 
%framem;
%gridm;
axis off

geoidrefvec=[2,90,180]; 
[c,h] = contourm(mola128_dx,geoidrefvec,-40000:20000:40000,'k'); hold on;

ax2=axes('position',[0.75,0.51,0.18,0.18])  ;
axesm('ortho','maplatlim',[-90 -60]);

gridm on;
framem on;
axis off
geoidrefvec=[1/aj,90,0];  
B=geoshow(br, geoidrefvec, 'DisplayType', 'texturemap'); hold on;

colormap(ax2,mycolormap4)
caxis([-L1 L1]);

%%


ax2=axes('position',[0.05,0.31,0.18,0.18])  ;
axesm('ortho','maplatlim',[60 90]);

gridm on;
framem on;
axis off

geoidrefvec=[1/aj,90,0];  
B=geoshow(bt, geoidrefvec, 'DisplayType', 'texturemap'); hold on;

colormap(ax2,mycolormap4)
caxis([-L1 L1]);

ax2=axes('position',[0.3,0.30,0.4,0.2])  ;
axesm eckert4; 
framem;
gridm;
axis off

geoidrefvec=[1/aj,90,180];  
B=geoshow(bt, geoidrefvec, 'DisplayType', 'texturemap'); hold on;

colormap(ax2,mycolormap4)
caxis([-L1 L1]);

text(-0.8,-1.8,'East Longitude','FontSize',10)
text(-3.3,-0.5,'Latitude','FontSize',10,'rotation',90)

text(2.1,1.2,'90^o')
text(2.75,0,'0^o')
text(2,-1.2,'-90^o')

text(-2.54,1.2,'90^o')
text(-3.0,0,'0^o')
text(-2.54,-1.2,'-90^o')

text(-1.7,-1.5,'0^o')
text(-0.1,-1.5,'180^o')
text(1.5,-1.5,'360^o')


ax2=axes('position',[0.3,0.30,0.4,0.2])  ;
axesm eckert4; 
%framem;
%gridm;
axis off

geoidrefvec=[2,90,180]; 
[c,h] = contourm(mola128_dx,geoidrefvec,-40000:20000:40000,'k'); hold on;

ax2=axes('position',[0.75,0.31,0.18,0.18])  ;
axesm('ortho','maplatlim',[-90 -60]);

gridm on;
framem on;
axis off
geoidrefvec=[1/aj,90,0];  
B=geoshow(bt, geoidrefvec, 'DisplayType', 'texturemap'); hold on;

colormap(ax2,mycolormap4)
caxis([-L1 L1]);
%%

ax2=axes('position',[0.05,0.11,0.18,0.18])  ;
axesm('ortho','maplatlim',[60 90]);

gridm on;
framem on;
axis off

geoidrefvec=[1/aj,90,0];  
B=geoshow(bp, geoidrefvec, 'DisplayType', 'texturemap'); hold on;

colormap(ax2,mycolormap4)
caxis([-L1 L1]);

ax2=axes('position',[0.3,0.10,0.4,0.2])  ;
axesm eckert4; 
framem;
gridm;
axis off

geoidrefvec=[1/aj,90,180];  
B=geoshow(bp, geoidrefvec, 'DisplayType', 'texturemap'); hold on;

colormap(ax2,mycolormap4)
caxis([-L1 L1]);

text(-0.8,-1.8,'East Longitude','FontSize',10)
text(-3.3,-0.5,'Latitude','FontSize',10,'rotation',90)

text(2.1,1.2,'90^o')
text(2.75,0,'0^o')
text(2,-1.2,'-90^o')

text(-2.54,1.2,'90^o')
text(-3.0,0,'0^o')
text(-2.54,-1.2,'-90^o')

text(-1.7,-1.5,'0^o')
text(-0.1,-1.5,'180^o')
text(1.5,-1.5,'360^o')

hcb = colorbar('location','southoutside','position',[0.1 0.05 0.8 0.02]);
set(get(hcb,'Xlabel'),'String','B (nT)','FontSize',10)

ax2=axes('position',[0.3,0.10,0.4,0.2])  ;
axesm eckert4; 
%framem;
%gridm;
axis off

geoidrefvec=[2,90,180]; 
[c,h] = contourm(mola128_dx,geoidrefvec,-40000:20000:40000,'k'); hold on;

ax2=axes('position',[0.75,0.11,0.18,0.18])  ;
axesm('ortho','maplatlim',[-90 -60]);

gridm on;
framem on;
axis off
geoidrefvec=[1/aj,90,0];  
B=geoshow(bp, geoidrefvec, 'DisplayType', 'texturemap'); hold on;

colormap(ax2,mycolormap4)
caxis([-L1 L1]);

%%



   
   
%%
      set(gcf,'PaperPositionMode','manual','PaperUnits','centimeters',...
        'PaperPosition',pos);
      
        print('-dtiff ','-r600',['C:\Users\gao\Desktop\f2_maven_G90.tiff']);
      print('-depsc ',['C:\Users\gao\Desktop\f2_maven_G90.eps']);
   
   