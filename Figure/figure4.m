clear all;close all;clc

rm=3393.5;

aj=0.5;
ej=0.5;
%Az=1:aj:359;
Az=180;
El=-89:ej:89;
az=Az/180*pi;
el=El/180*pi;

[AZ,EL]=meshgrid(az,el);

h=(120:10:600)+3393.5;

[h1,h2]=meshgrid(el,h-3393.5);

%h=rm+1*ones(length(el),length(az));



[lx,ly,lz] = sph2cart(AZ,EL,h);

Lx=reshape(lx,1,[]);
Ly=reshape(ly,1,[]);
Lz=reshape(lz,1,[]);

a=[Lx;Ly;Lz];


%bca=cain_r(a);
%bca=lang18_r(a);
bca=gao_r(a);
%bca=m14_r(a);
%bca=bca';


for i=1:3
    br=reshape(bca(1,:),length(el),[]);
    bt=reshape(bca(2,:),length(el),[]);
    bp=reshape(bca(3,:),length(el),[]);
    
    
end

br=br';
bt=bt';
bp=bp';

%startx = -1:0.2:1;
%starty = ones(size(startx));
%streamline(h1,h2,bx,by,startx,starty)

%%

bho=(br.^2+bt.^2).^0.5;
contourf(El,h-3393.5,bho,5,'ShowText','on'); hold on;

%quiver(El,h-3393.5,-by,bx*10 ,2  ); hold on;

startx = -90:0.5:90;
starty = ones(size(startx))*120;

s1=streamline(El,h-3393.5,-bt,br*14,startx,starty); hold on;

for i=1:length(s1)
    s1(i).Color=[1 1 1];
    
    s1(i).LineWidth=1;
    
 %   try
 
 x1=s1(i).XData;
 y1=s1(i).YData;
 
 arrowPlot(x1,y1,'color',[1 1 1],'number',4 ,'scale',0.1); hold on;
 
end
 
 %{
 dh=50;
 if length(x1)>dh
        for j=1:round(length(x1)/dh)-1
           % ii=round(length(x1)/5*j);
            ii=j*dh-dh/2;
        %    ah = annotation('arrow',[x1(ii) y1(ii)],[100*(x1(ii)-x1(ii+1)) 10*(y1(ii)-y1(ii+1)) ] )
            
        %zd=((x1(ii)-x1(ii+1)).^2+(y1(ii)-y1(ii+1)).^2).^0.5;
  %      zd=(abs(x1(ii)-x1(ii+1))+abs(y1(ii)-y1(ii+1)));
        
  %      dx=-(x1(ii)-x1(ii+1))/zd;
  %      dy=-(y1(ii)-y1(ii+1))/zd;
        
     %   scatter
        arrowPlot([x1(ii) x1(ii+1)],[y1(ii) y1(ii+1)],'color',[1 1 1],'number',1); hold on;
  %      plot([x1(ii) x1(ii+1)],[y1(ii) y1(ii+1)],'w','Marker','<','MarkerFaceColor','w','MarkerSize',3)
        
       % quiver(x1(ii),y1(ii),10*dx,20*dy,'w','filled','LineWidth',0.5,'MaxHeadSize',1,'AutoScale','on')   ;hold on;
        
     %       ah = annotation('arrow','headStyle','cback1','HeadLength',8,'HeadWidth',4,'Units','normalized');
         %   set(ah,'parent',gca);   
     %       set(ah,'position',[x1(ii) y1(ii) 100*(x1(ii)-x1(ii+1)) 10*(y1(ii)-y1(ii+1)) ]);
     %       hold on;
        end
        
 end
  %  catch
  %  end
    
    
end

%}

%streamslice(El,h-3393.5,-bt,br)

axis([-90 0 120 500]);



colormap cool
ylabel('Altitude (km)')
xlabel('Latitude (бу)')
title('Magnetic field geometry at Longitude=180бу')
pos=[0 0 30 15];
h1=colorbar;
h1.Label.String={'|B| (nT) '};

set(gca,'FontSize',20)

set(gca,'xminortick','on');
set(gca,'yminortick','on');    grid on;
set(gca,'tickdir','out')

set(gcf,'PaperPositionMode','manual','PaperUnits','centimeters',...
    'PaperPosition',pos,'units','centimeters','position',pos);


a=1;

%%

print('-dtiff ','-r600',[ 'C:\Users\gao\Desktop\','t3.tiff'])


