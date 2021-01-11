clear all;close all;clc

load D:\program\mars\crust\wucha\wucha_xin\qd1_res.mat

rm=3393.5;




  % wsph= qd1_res.Bsph_res_m14';
  % wpc= qd1_res.Bpc_res_m14';
   
%   wsph= qd1_res.Bsph_res_m14';
%   wpc= qd1_res.Bpc_res_m14';
   
   wsph= qd1_res.Bsph_res_l18';
   wpc= qd1_res.Bpc_res_l18';
   jie=2984000;
   wsphmav=wsph(:,1:jie);
   wsphmav=wsph(:,1:jie);
   
   wsphmgs=wsph(:,jie:end);
   wsphmgs=wsph(:,jie:end);
   
    
   %%
  %  Bt=(wpc(1,:).^2+wpc(2,:).^2+wpc(3,:).^2).^0.5;
  %  stot=std(Bt)
   %%
   
   
   subplot(2,3,1)
   s1=std(wsphmav(1,:));
   edg=linspace(-3*s1,3*s1,50);

  h= histogram(wsphmav(1,:),edg,'Normalization','pdf'); hold on;
  h.EdgeColor=[0 0 1] 
  h.FaceColor=[1 1 1]
  
   xlim([-3*s1,3*s1]);
   ylim([0,0.1]);
   
   
   xticks([-2*s1:s1:2*s1]);
   yticks([0:0.01:0.1]);
   
   xticklabels({'-2\sigma','-\sigma','0','\sigma','2\sigma'});
   yticklabels({'0','1','2','3','4','5','6','7','8','9','10'});
   
   title('MAVEN B_r misfit')
   ylabel('Relative counts (%)')
   
[mu,sigma]=normfit(wsphmav(1,:));
set(gca,'xminortick','on')
set(gca,'yminortick','on')
set(gca,'tickdir','out')
grid on;
   
   subplot(2,3,2)
        s2=std(wsphmav(2,:));
         edg=linspace(-3*s2,3*s2,50);
 
   l1=length(wsphmav(2,:));
h= histogram(wsphmav(2,:),edg,'Normalization','pdf');
    h.EdgeColor=[0 0 1] 
  h.FaceColor=[1 1 1] 
  
   xlim([-3*s1,3*s1]);
   ylim([0,0.1]);
   
   
   xticks([-2*s1:s1:2*s1]);
   yticks([0:0.01:0.1]);
   
   xticklabels({'-2\sigma','-\sigma','0','\sigma','2\sigma'});
   yticklabels({'0','1','2','3','4','5','6','7','8','9','10'});
   
   title('MAVEN B_\theta misfit')
   ylabel('Relative counts (%)')
   set(gca,'xminortick','on')
set(gca,'yminortick','on')
set(gca,'tickdir','out')
grid on;
   
   subplot(2,3,3)
     s3=std(wsphmav(3,:));
        edg=linspace(-3*s3,3*s3,50);
    
  h= histogram(wsphmav(3,:),edg,'Normalization','pdf');
     h.EdgeColor=[0 0 1] 
  h.FaceColor=[1 1 1]
  
   xlim([-3*s1,3*s1]);
   ylim([0,0.1]);
   
   
   xticks([-2*s1:s1:2*s1]);
   yticks([0:0.01:0.1]);
   
   xticklabels({'-2\sigma','-\sigma','0','\sigma','2\sigma'});
   yticklabels({'0','1','2','3','4','5','6','7','8','9','10'});
   
   title('MAVEN B_\phi misfit')
   ylabel('Relative counts (%)')
set(gca,'xminortick','on')
set(gca,'yminortick','on')
set(gca,'tickdir','out')
grid on;
   
   
   %%
      
   subplot(2,3,4)
   s1=std(wsphmgs(1,:));
   edg=linspace(-3*s1,3*s1,50);

  h= histogram(wsphmgs(1,:),edg,'Normalization','pdf'); hold on;
  h.EdgeColor=[0 0 1] 
  h.FaceColor=[1 1 1]
  
   xlim([-3*s1,3*s1]);
   ylim([0,0.1]);
   
   
   xticks([-2*s1:s1:2*s1]);
   yticks([0:0.01:0.1]);
   
   xticklabels({'-2\sigma','-\sigma','0','\sigma','2\sigma'});
   yticklabels({'0','1','2','3','4','5','6','7','8','9','10'});
   
   title('MGS B_r misfit')
   ylabel('Relative counts (%)')
   set(gca,'xminortick','on')
set(gca,'yminortick','on')
set(gca,'tickdir','out')
grid on;
[mu,sigma]=normfit(wsphmgs(1,:));

   
   subplot(2,3,5)
        s2=std(wsphmgs(2,:));
         edg=linspace(-3*s2,3*s2,50);
 
   l1=length(wsphmgs(2,:));
h= histogram(wsphmgs(2,:),edg,'Normalization','pdf');
    h.EdgeColor=[0 0 1] 
  h.FaceColor=[1 1 1] 
  
   xlim([-3*s1,3*s1]);
   ylim([0,0.1]);
   
   
   xticks([-2*s1:s1:2*s1]);
   yticks([0:0.01:0.1]);
   
   xticklabels({'-2\sigma','-\sigma','0','\sigma','2\sigma'});
   yticklabels({'0','1','2','3','4','5','6','7','8','9','10'});
   
   title('MGS B_\theta misfit')
   ylabel('Relative counts (%)')
   set(gca,'xminortick','on')
set(gca,'yminortick','on')
set(gca,'tickdir','out')
grid on;
   
   subplot(2,3,6)
     s3=std(wsphmgs(3,:));
        edg=linspace(-3*s3,3*s3,50);
    
  h= histogram(wsphmgs(3,:),edg,'Normalization','pdf');
     h.EdgeColor=[0 0 1] 
  h.FaceColor=[1 1 1]
  
   xlim([-3*s1,3*s1]);
   ylim([0,0.1]);
   
   
   xticks([-2*s1:s1:2*s1]);
   yticks([0:0.01:0.1]);
   
   xticklabels({'-2\sigma','-\sigma','0','\sigma','2\sigma'});
   yticklabels({'0','1','2','3','4','5','6','7','8','9','10'});
   
   title('MGS B_\phi misfit')
   ylabel('Relative counts (%)')
   
set(gca,'xminortick','on')
set(gca,'yminortick','on')
set(gca,'tickdir','out')

  grid on; 
   
   %%
   pos=[0 0 25 15];

set(gcf,'PaperPositionMode','manual','PaperUnits','centimeters',...
        'PaperPosition',pos,'units','centimeters','position',pos);
    


print('-dtiff ','-r600',[ 'C:\Users\gao\Desktop\','misfit_2.tiff'])








