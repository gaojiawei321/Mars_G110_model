clear all;close all;clc

load MGS_merged_mag1min.mat
load pc_q.mat
load mso_q.mat
load /Users/gaojiawei/program/mars/crust/model_zhong_duo/qdq



rm=3393.5;

T1=datenum(2016,10,1,0,0,0)
datestr(mso_q(1,1));


 mgsq=find(x<-500);%
 mavq=find(mso_q(:,5)<-500&mso_q(:,1)<T1);%
 
 
 

[MGSa,MGSe,MGSr] = cart2sph(Gx(mgsq),Gy(mgsq),Gz(mgsq));
r1=MGSr-rm;

[MAVa,MAVe,MAVr] = cart2sph(pc_q(mavq,5),pc_q(mavq,6),pc_q(mavq,7));
r2=MAVr-rm;

%�����廻ΪPCq_jia
[PCqa,PCqe,PCqr] = cart2sph(PCq(:,1),PCq(:,2),PCq(:,3));
r3=PCqr-rm;





%%
j1=zeros(50,181);
j2=zeros(50,181);
j3=zeros(50,181);



for g=1:length(MGSa)
    if r1(g)<500
    rj=round(r1(g)/10);
    ej=round(MGSe(g)/pi*180)+91;
    j1(rj,ej)=j1(rj,ej)+1;
    end

end

for g=1:length(MAVa)
    if r2(g)<500
    rj=round(r2(g)/10);
    ej=round(MAVe(g)/pi*180)+91;
    j2(rj,ej)=j2(rj,ej)+1;
    end

end

for g=1:length(PCqa)
    if r3(g)<500
    rj=round(r3(g)/10);
    ej=round(PCqe(g)/pi*180)+91;
    j3(rj,ej)=j3(rj,ej)+1;
    end

end

jmgs=j1;
jmav=j2;
jq=j3;

   nj=find(jmgs==0);
    jmgs(nj)=NaN;
   nj=find(jmav==0);   
   jmav(nj)=NaN;
   nj=find(jq==0);
    jq(nj)=NaN;
    
%%
pos=[1 1 25 20];
set(gcf,'unit','centimeters','position',pos)
    axes('position',[0.08,0.7,0.32,0.20])
%subplot(3,2,1)
   pcolor(jmgs)
   shading flat;
     colorbar
 set(gca,'Ytick',[10 20 30 40 50],'Yticklabel', {'100' '200' '300' '400' '500'} )
   set(gca,'Xtick',[1 45 90 135 180],'Xticklabel', {'-90' '-45' '0' '45' '90'} )
   h_1=  colorbar('position',[0.41,0.7,0.02,0.20]);
      h_1.Label.String={'counts'}
      h_1.Ticks=[ 10000 20000 30000];
     h_1.TickLabels=[{ '1*10^4';'2*10^4';'3*10^4' }];
      
      
   ylabel('Altitude (km)','fontsize',15);
   text(-40,55,'(a)','fontsize',18,'FontWeight','Bold')
   title('MGS','fontsize',15)
  % text(135,5,'MGS','fontsize',10)
  xlim([1 180])
    set(gca,'tickdir','out')
   set(gca,'xminortick','on');
set(gca,'yminortick','on');
    grid on;
    
 %axis([-pi/2 pi/2 0 500])
 
 axes('position',[0.08,0.4,0.32,0.20])
     pcolor(jmav)
    shading flat;
 set(gca,'Ytick',[10 20 30 40 50],'Yticklabel', {'100' '200' '300' '400' '500'} )
   set(gca,'Xtick',[1 45 90 135 180],'Xticklabel', {'-90' '-45' '0' '45' '90'} )
   h_2=  colorbar('position',[0.41,0.4,0.02,0.20]);
     h_2.Label.String={'counts'}
    h_2.Ticks=[ 2000 4000 6000 8000];
      h_2.TickLabels=[ {'2*10^3';'4*10^3';'6*10^3';'8*10^3'}];
          
 %set(h_2,'Ytick',[0.5 1 1.5 ] ,'YTicklabel',{'0.5','1' ,'1.5'});
   ylabel('Altitude (km)','fontsize',15);
   text(-40,55,'(b)','fontsize',18,'FontWeight','Bold')
  %text(135,5,'MAVEN','fontsize',10)
  title('MAVEN','fontsize',15)
    xlim([1 180])
    set(gca,'tickdir','out')
   set(gca,'xminortick','on');
set(gca,'yminortick','on');
     grid on;
     
  axes('position',[0.08,0.1,0.32,0.20])
    pcolor(jq)
   shading flat;
   colorbar
 set(gca,'Ytick',[10 20 30 40 50],'Yticklabel', {'100' '200' '300' '400' '500'} )
   set(gca,'Xtick',[1 45 90 135 180],'Xticklabel', {'-90' '-45' '0' '45' '90'} )
   h_3=  colorbar('position',[0.41,0.1,0.02,0.20]);
     h_3.Label.String={'counts'}
         h_3.Ticks=[ 5000 10000 15000];
      h_3.TickLabels=[{ '0.5*10^4';'1*10^4';'1.5*10^4'}];
  
 %set(h_2,'Ytick',[0.5 1 1.5 ] ,'YTicklabel',{'0.5','1' ,'1.5'});
  ylabel('Altitude (km)','fontsize',15);
  xlabel('Latitude (°)','fontsize',15);
   text(-40,55,'(c)','fontsize',18,'FontWeight','Bold')
   % text(100,5,'MGS+MAVEN','fontsize',10)
    title('Total data set','fontsize',15)
      xlim([1 180])
    set(gca,'tickdir','out')
   set(gca,'xminortick','on');
set(gca,'yminortick','on');
    grid on;
   %%
   
   xj=91;
   yj=181;
   j4=zeros(xj,yj);
   j5=zeros(xj,yj);
   j6=zeros(xj,yj);
   
   for g=1:length(MGSa)
    if r1(g)<500
    wj=round(MGSe(g)/pi*180 /(180/xj) )+round(xj/2);
    jj=round(MGSa(g)/pi*180 /(360/yj) )+round(yj/2);
    j4(wj,jj)=j4(wj,jj)+1;
    end
end

  for g=1:length(MAVa)
    if r2(g)<500
    wj=round(MAVe(g)/pi*180 /(180/xj) )+round(xj/2);
    jj=round(MAVa(g)/pi*180 /(360/yj) )+round(yj/2);
    j5(wj,jj)=j5(wj,jj)+1;
    end
end

  for g=1:length(PCqa)
    if r3(g)<500
    wj=round(PCqe(g)/pi*180 /(180/xj) )+round(xj/2);
    jj=round(PCqa(g)/pi*180 /(360/yj) )+round(yj/2);
    if jj==0
        jj=jj+1;
    end
    if jj==182
        jj=jj-1;
    end
        
    j6(wj,jj)=j6(wj,jj)+1;
    
    end
end

qmgs=j4;
qmav=j5;
qall=j6;

   nj=find(qmgs==0);
    qmgs(nj)=NaN;
   nj=find(qmav==0);   
   qmav(nj)=NaN;
   nj=find(qall==0);
    qall(nj)=NaN;
    
   
   
   
   
   
   %%
    axes('position',[0.56,0.7,0.32,0.20])
   pcolor((qmgs(2:xj,2:yj)))
   shading flat;
     colorbar
 %  set(gca,'Ytick',[1 45  90 135 180],'Yticklabel', {'-90' '-45' '0' '45' '90'} )
 %  set(gca,'Xtick',[1 90 180 270 360],'Xticklabel', {'0' '95' '180' '270' '360'} )
   
   set(gca,'Ytick',[1 22.5 45 67.5 90],'Yticklabel', {'-90' '-45' '0' '45' '90'} )
   set(gca,'Xtick',[1 45 90 135 180],'Xticklabel', {'0' '90' '180' '270' '360'} )
   
   h_4=  colorbar('position',[0.89,0.7,0.02,0.2]);
     h_4.Label.String={'counts'};
 ylabel('Latitude (°)','fontsize',15);
 text(-36,100,'(d)','fontsize',18,'FontWeight','Bold')
 title('MGS','fontsize',15)
 set(gca,'tickdir','out')
set(gca,'xminortick','on');
set(gca,'yminortick','on');

% set(gca,'ticklength',[0.05 0.025]);
  % text(280,15,'MGS','fontsize',10)
    grid on;
    
     axes('position',[0.56,0.4,0.32,0.20])
   pcolor(qmav(2:xj,2:yj))
   shading flat;
     colorbar
   set(gca,'Ytick',[1 22.5 45 67.5 90],'Yticklabel', {'-90' '-45' '0' '45' '90'} )
   set(gca,'Xtick',[1 45 90 135 180],'Xticklabel', {'0' '90' '180' '270' '360'} )
      h_4=  colorbar('position',[0.89,0.4,0.02,0.20]);
    h_4.Label.String={'counts'}
  ylabel('Latitude (°)','fontsize',15);
  text(-36,100,'(e)','fontsize',18,'FontWeight','Bold')
  title('MAVEN','fontsize',15)
   set(gca,'tickdir','out')
   set(gca,'xminortick','on');
set(gca,'yminortick','on');

  % text(280,15,'MAVEN','fontsize',10)
    grid on;
    
     axes('position',[0.56,0.1,0.32,0.20])
   pcolor(qall(2:xj,2:yj))
   shading flat;
     colorbar
   set(gca,'Ytick',[1 22.5 45 67.5 90],'Yticklabel', {'-90' '-45' '0' '45' '90'} )
   set(gca,'Xtick',[1 45 90 135 180],'Xticklabel', {'0' '90' '180' '270' '360'} )
     h_4=  colorbar('position',[0.89,0.1,0.02,0.2]);
    h_4.Label.String={'counts'}
   ylabel('Latitude (°)','fontsize',15);
   xlabel('Longitude (°)','fontsize',15)
  text(-36,100,'(f)','fontsize',18,'FontWeight','Bold')
   %text(200,15,'MGS+MAVEN','fontsize',10)
   title('Total data set','fontsize',15)
    set(gca,'tickdir','out')
 
   set(gca,'xminortick','on');
set(gca,'yminortick','on');    grid on;
    
    
    %%
    
   
   %%
   
    set(gcf,'PaperPositionMode','manual','PaperUnits','centimeters',...
        'PaperPosition',pos);
   
    print('-dtiff ','-r600',[ '/Users/gaojiawei/Desktop/f_re/r1/data_dis_2.tiff'])

    %   print('-depsc ','-r600',['C:\Users\gao\Desktop\f1_z.eps']);
   
   
   
   
   
   
   