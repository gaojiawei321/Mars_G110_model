clear;close all;clc
rm=3393.5;
aj=0.5;
ej=0.5;
Az=aj:aj:360;
El=-90+ej:ej:90;
az=Az/180*pi;
el=El/180*pi;

[AZ,EL]=meshgrid(az,el);

al=0;
h=rm+al*ones(length(el),length(az));

[lx,ly,lz] = sph2cart(AZ,EL,h);

Lx=reshape(lx,1,[]);
Ly=reshape(ly,1,[]);
Lz=reshape(lz,1,[]);

a=[Lx;Ly;Lz];

brtp=gao_r_110(a);

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

br1=br;
bt1=bt;
bp1=bp;

%dlevels = [0,10,20,25,50,200,500,800,1000,1100,1200,1500,2000,3000,4000] ;
   
%dlevels = [-3000, -2000,-1250,-1000,-750,-300,-100,100,300,750,1000,1250,2000,3000] ;
dlevels= -5000:500:5000


for k = 1 : length(dlevels) - 1
     
   br(find(br>dlevels(k) & br<=dlevels(k+1))) = k ;
   bt(find(bt>dlevels(k) & bt<=dlevels(k+1))) = k ;
   bp(find(bp>dlevels(k) & bp<=dlevels(k+1))) = k ;
   
   
end

   br(find(br1<dlevels(1))) = 1 ;
   br(find(br1>dlevels(end))) = length(dlevels) - 1 ;
   
   %bt(find(bt==dlevels(1))) = 1 ;
   %bp(find(bp==dlevels(1))) = 1 ;


 %  cmap = colormap(jet(length(dlevels) - 1)) ;

   
   %{
   zh1=find(br1<100&br1>-100);
   br2=zeros(900,1800);
   br2(zh1)=br1(zh1);
   zn1=find(br2==0);
   br2(zn1)=NaN;
   brk=br2./br2-1;
  
      
   zh2=find(br1>100);
   brd=zeros(900,1800);
   brd(zh2)=br1(zh2);
   zn1=find(brd==0);
   brd(zn1)=NaN;
   
   zh4=find(br1<100);
   brx=zeros(900,1800);
   brx(zh4)=br1(zh4);
   zn1=find(brx==0);
   brx(zn1)=NaN;
%}
   
 jieg=150;
   brw=br1;
   zh1=find(br1<jieg&br1>-jieg);
   brw(zh1)=0;
   
   btw=bt1;
   zh1=find(bt1<jieg&bt1>-jieg);
   btw(zh1)=0;
   
   bpw=bp1;
   zh1=find(bp1<jieg&bp1>-jieg);
   bpw(zh1)=0;
   
   
%%     
   figure
 
   load geoid
   load mola128_dx
   load mycolormap2.mat
 %  load mycolormap4.mat
   
   load mycolormap5.mat
   
   %%
   
   pos=[1 1 20 30];
set(gcf,'unit','centimeters','position',pos)

   
L1=4000;



ax2=axes('position',[0.1,0.65,0.8,0.4])  ;
axesm eckert4; 
framem;
gridm;
axis off

geoidrefvec=[1/aj,90,180];  
%B=geoshow(br2, geoidrefvec, 'DisplayType', 'texturemap'); hold on;

B=geoshow(brw, geoidrefvec, 'DisplayType', 'texturemap'); hold on;

%caxis([1 length(dlevels)]) ;

%colormap(ax2,mycolormap4)

caxis([-L1 L1]);
colormap(ax2,mycolormap5) ;


   
%text(-0.5,3,'G110 model - 120 km altitude','FontSize',15)

text(-0.05,1.5,'B_r','FontSize',15)

 text(-0.1,-1.8,'B_\theta','FontSize',15)
 
 text(-3.3,-0.4,'Latitude','FontSize',15,'rotation',90)
 
 
text(2.1,1.2,'90^o')
text(2.75,0,'0^o')
text(2,-1.2,'-90^o')

text(-2.4,1.2,'90^o')
text(-2.9,0.05,'0^o')
text(-2.4,-1.2,'-90^o')

text(-1.7,-1.5,'0^o')
text(-0.1,-1.5,'180^o')
text(1.5,-1.5,'360^o')

ax2=axes('position',[0.1,0.65,0.8,0.4])  ;

axesm eckert4; 
%framem;
%gridm;
axis off

geoidrefvec=[2,90,180]; 
[c,h] = contourm(mola128_dx,geoidrefvec,-40000:20000:40000,'k'); hold on;


%%



ax2=axes('position',[0.1,0.35,0.8,0.4])  ;


axesm eckert4; 
framem;
gridm;
axis off

geoidrefvec=[1/aj,90,180];  
B=geoshow(btw, geoidrefvec, 'DisplayType', 'texturemap'); hold on;

%colormap(ax2,mycolormap4)
%colormap(ax2,cmap) ;

%caxis([-L1 L1]);

caxis([-L1 L1]);
colormap(ax2,mycolormap5) ;



 text(-0.05,-1.8,'B_\phi','FontSize',15)
 text(-3.3,-0.4,'Latitude','FontSize',15,'rotation',90)
 
text(2.1,1.2,'90^o')
text(2.75,0,'0^o')
text(2,-1.2,'-90^o')

text(-2.4,1.2,'90^o')
text(-2.9,0.05,'0^o')
text(-2.4,-1.2,'-90^o')

text(-1.7,-1.5,'0^o')
text(-0.1,-1.5,'180^o')
text(1.5,-1.5,'360^o')


ax2=axes('position',[0.1,0.35,0.8,0.4])  ;

axesm eckert4; 
%framem;
%gridm;
axis off

geoidrefvec=[2,90,180]; 
[c,h] = contourm(mola128_dx,geoidrefvec,-40000:20000:40000,'k'); hold on;


%%



ax2=axes('position',[0.1,0.05,0.8,0.4])  ;


axesm eckert4; 
framem;
gridm;
axis off

geoidrefvec=[1/aj,90,180];  
B=geoshow(bpw, geoidrefvec, 'DisplayType', 'texturemap'); hold on;

%colormap(ax2,mycolormap4)
%colormap(ax2,cmap) ;

%caxis([-L1 L1]);
%caxis([0 length(dlevels)-1]) ;
   
caxis([-L1 L1]);
colormap(ax2,mycolormap5) ;

   
   
 text(-0.6,-1.7,'East Longitude','FontSize',15)
 text(-3.3,-0.4,'Latitude','FontSize',15,'rotation',90)
 
text(2.1,1.2,'90^o')
text(2.75,0,'0^o')
text(2,-1.2,'-90^o')

text(-2.4,1.2,'90^o')
text(-2.9,0.05,'0^o')
text(-2.4,-1.2,'-90^o')

text(-1.7,-1.5,'0^o')
text(-0.1,-1.5,'180^o')
text(1.5,-1.5,'360^o')

hcb = colorbar('location','southoutside','position',[0.1 0.05 0.8 0.02]);
set(get(hcb,'Xlabel'),'String','B (nT)','FontSize',15)

set(hcb,'Ticks', [-4000 -2000 -1000 -500 -250 -120 120 250 500 1000 2000 4000])

set(hcb,'TickLabels', {' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '})

%set(hcb,'Ticks',[-4000 -2000 -1000  1000 2000 4000])



%set(hcb,'Ticks', 0:1:length(dlevels)-1,'TickLabels',dlevels) ;

ax2=axes('position',[0.1,0.05,0.8,0.4])  ;

axesm eckert4; 
%framem;
%gridm;
axis off

geoidrefvec=[2,90,180]; 
[c,h] = contourm(mola128_dx,geoidrefvec,-40000:20000:40000,'k'); hold on;



%%



   
   
%%
      set(gcf,'PaperPositionMode','manual','PaperUnits','centimeters',...
        'PaperPosition',pos);
     
    
print('-dtiff ','-r600',[ '/Users/gaojiawei/Desktop/f_re/r1/','map_gao_3s.tiff'])


    %    print('-dtiff ','-r600',['C:\Users\gao\Desktop\f2_maven_G90.tiff']);
    %  print('-depsc ',['C:\Users\gao\Desktop\f2_maven_G90.eps']);
   
   