clear all;close all;clc

load qd

Rm=3393.5;

 [qa,qe,qr] = cart2sph(PCq(:,1),PCq(:,2),PCq(:,3));

 
qe_zhuan=pi/2-qe;

%%

z1=find(qe>0);

mean(Bq(z1))

z2=find(qe<0);

mean(Bq(z2))


%%



jg=linspace(-pi,pi,200);
wg=linspace(max(qe),1.57,40);

%wg=logspace(max(qe),1.57,40);

%wg=[1.5207,1.53,1.54,1.55,1.56];

hg=linspace(120,410,1)+3393.5;

%hg=120+3393.5;

% 200*40*10

PCq_jia=[];
Bq_jia=[];


for i=1:length(jg)
    for j=1:length(wg)
        for k=1:length(hg)
        %    w1=(jg(i),wg(j),h(k));
            [x,y,z] = sph2cart(jg(i),wg(j),hg(k));
            
     %       z1=find(qe>1.5& qa>jg(i) &qa<jg(i+1))
            
            bj=lang18([x,y,z]');
            
     
             PCq_jia=[PCq_jia;[x,y,z]];
        
            Bq_jia=[Bq_jia;bj'];
            
       %     Bq_jia=[Bq_jia;[0 0 0]];
            
            
            
        end
    end
end

%%


%%

jg=linspace(-pi,pi,200);
wg=linspace(-1.57,min(qe),40);
hg=linspace(200,350,1)+3393.5;

%wg=[1.5207,1.53,1.54,1.55,1.56];
%hg=120+3393.5;

for i=1:length(jg)
    for j=1:length(wg)
        for k=1:length(hg)
        %    w1=(jg(i),wg(j),h(k));
            [x,y,z] = sph2cart(jg(i),wg(j),hg(k));
            
            bj=lang18([x,y,z]');
            
            PCq_jia=[PCq_jia;[x,y,z]];
      
                 Bq_jia=[Bq_jia;bj'];
         
            %  Bq_jia=[Bq_jia;[0 0 0]];
            
        end
    end
end
            
       a=1     ;
    
    %%
        

pos=[0 0 17  15];

set(gcf,'PaperPositionMode','manual','PaperUnits','centimeters',...
        'PaperPosition',pos,'units','centimeters','position',pos);
      
    
    
a1=find(PCq(z1,3)>0);

s1=scatter(PCq(z1(a1),1),PCq(z1(a1),2),2,Bq(z1(a1),1)); hold on;

s1.MarkerEdgeAlpha=0.7

a2=find(PCq_jia(:,3)>0);
scatter(PCq_jia(a2,1),PCq_jia(a2,2),2,Bq_jia(a2,1),'d','filled'); hold on;

xlim([-300 300])
ylim([-300 300])


j89=(3393.5+400)*sin(1/180*pi);
j88=(3393.5+400)*sin(2/180*pi);
j87=(3393.5+400)*sin(3/180*pi);
j86=(3393.5+400)*sin(4/180*pi);
j85=(3393.5+400)*sin(5/180*pi);


rectangle('Position',[-j89,-j89,j89*2,j89*2],'Curvature',[1,1],'linewidth',1)
rectangle('Position',[-j88,-j88,j88*2,j88*2],'Curvature',[1,1],'linewidth',1)
rectangle('Position',[-j87,-j87,j87*2,j87*2],'Curvature',[1,1],'linewidth',1)
rectangle('Position',[-j86,-j86,j86*2,j86*2],'Curvature',[1,1],'linewidth',1)
rectangle('Position',[-j85,-j85,j85*2,j85*2],'Curvature',[1,1],'linewidth',1)

text(j89-35,0,'89°','FontSize',12)
text(j88-35,0,'88°','FontSize',12)
text(j87-35,0,'87°','FontSize',12)
text(j86-35,0,'86°','FontSize',12)
text(j85-35,0,'85°','FontSize',12)



colormap jet

c = colorbar;
c.Label.String = 'B_r (nT)';
c.FontSize = 15;


caxis([-20 20])
    
grid on;

xlabel('X (km)','FontSize',20)
ylabel('Y (km)','FontSize',20)

set(gca,'tickdir','out')
title('North pole','FontSize',20)

legend({'MGS data','Artificial data'},'FontSize',12)


 print('-dtiff','-r1200',[ '/Users/gaojiawei/Desktop/f_re/pole_1.tiff'])
 
 %print('-dps',['/Users/gaojiawei/Desktop/f_re/pole_1.ps']);

%%
clf
    
    %%
    
    
pos=[0 0 17  15];

set(gcf,'PaperPositionMode','manual','PaperUnits','centimeters',...
        'PaperPosition',pos,'units','centimeters','position',pos);
      
    
    
a1=find(PCq(z2,3)<0);

s1=scatter(PCq(z2(a1),1),PCq(z2(a1),2),2,Bq(z2(a1),1)); hold on;

s1.MarkerEdgeAlpha=0.7

a2=find(PCq_jia(:,3)<0);
scatter(PCq_jia(a2,1),PCq_jia(a2,2),2,Bq_jia(a2,1),'d','filled'); hold on;

xlim([-300 300])
ylim([-300 300])


j89=(3393.5+400)*sin(1/180*pi);
j88=(3393.5+400)*sin(2/180*pi);
j87=(3393.5+400)*sin(3/180*pi);
j86=(3393.5+400)*sin(4/180*pi);
j85=(3393.5+400)*sin(5/180*pi);


rectangle('Position',[-j89,-j89,j89*2,j89*2],'Curvature',[1,1],'linewidth',1)
rectangle('Position',[-j88,-j88,j88*2,j88*2],'Curvature',[1,1],'linewidth',1)
rectangle('Position',[-j87,-j87,j87*2,j87*2],'Curvature',[1,1],'linewidth',1)
rectangle('Position',[-j86,-j86,j86*2,j86*2],'Curvature',[1,1],'linewidth',1)
rectangle('Position',[-j85,-j85,j85*2,j85*2],'Curvature',[1,1],'linewidth',1)

text(j89-35,0,'-89°','FontSize',12)
text(j88-35,0,'-88°','FontSize',12)
text(j87-35,0,'-87°','FontSize',12)
text(j86-35,0,'-86°','FontSize',12)
text(j85-35,0,'-85°','FontSize',12)



colormap jet

c = colorbar;
c.Label.String = 'B_r (nT)';
c.FontSize = 15;

caxis([-20 20])
    
grid on;

xlabel('X (km)','FontSize',20)
ylabel('Y (km)','FontSize',20)

set(gca,'tickdir','out')
title('South pole','FontSize',20)

legend({'MGS data','Artificial data'},'FontSize',12)


 print('-dtiff ','-r1200',[ '/Users/gaojiawei/Desktop/f_re/pole_2.tiff'])



    
    %%
    
    

    %%
    Bq=[Bq;Bq_jia];
    PCq=[PCq;PCq_jia];

    
  %  Bjiat=(Bq_jia(:,1).^2+Bq_jia(:,2).^2+Bq_jia(:,3).^2).^2;
    
  %  scatter(PCq_jia(:,1),PCq_jia(:,2),1,Bq_jia(:,3))
  
  
 %save qd_jia.mat   Bq PCq
 
 
    %%

    
    