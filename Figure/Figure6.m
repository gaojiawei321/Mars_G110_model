clear;close;clc


load wc_suan.mat
%load wc_suan_duo.mat


rm=3393.5;


%%
   wsphmav=dg1';
  wsphmavt=(wsphmav(1,:).^2+wsphmav(2,:).^2+wsphmav(3,:).^2).^0.5;
  
  dlt=(dl1(:,1).^2+dl1(:,2).^2+dl1(:,3).^2).^0.5;
   
   wsphmgs=dg2';
   
  % histogram(H)
    
  mg110=gao_r_110(PCq')';
  mg110T=(mg110(:,1).^2+mg110(:,2).^2+mg110(:,3).^2).^0.5;
  
  H=(PCq(:,1).^2+PCq(:,2).^2+PCq(:,3).^2).^0.5-3393.5;
  
   
   %dg2 is mgs misfit for G90
   
   
   %%
   h1=0;
   h2=400;
   
   
   
   %%
   
      pos=[0 0 25 25];

set(gcf,'PaperPositionMode','manual','PaperUnits','centimeters',...
        'PaperPosition',pos,'units','centimeters','position',pos);
    

  %  a1=find()
    
   subplot(3,3,1)
   
   
   z1=find(H<h2&H>h1&mg110T<20&mg110T>0);
   
   s1=std(wsphmav(1,z1));
   edg=linspace(-3*s1,3*s1,30);

  h= histogram(wsphmav(1,z1),edg,'Normalization','pdf');
  
  hg=h.Values;
   
  hl1= histogram(dl1(z1),edg,'Normalization','pdf');
  hl=hl1.Values;
  
  xz=(edg(1:end-1)+edg(2:end))/2;
  

   plot(xz,hg,'r','LineWidth',1.5) ; hold on;

   plot(xz,hl,'b','LineWidth',1.5) ; hold on;

  
   xlim([-3*s1,3*s1]);
   ylim([0,0.12]);
   
   
   xticks([-2*s1:s1:2*s1]);
   yticks([0:0.01:0.12]);
   
   xticklabels({'-2\sigma','-\sigma','0','\sigma','2\sigma'});
   yticklabels({'0','1','2','3','4','5','6','7','8','9','10','11','12'});
   
   
   legend({'G110','L134'},'FontSize',7)
legend('boxoff')

   title('B_r misfit for |B| = 0-20 nT')
   
   
   ylabel('Relative counts (%)')
 

set(gca,'xminortick','on')
set(gca,'yminortick','on')
set(gca,'tickdir','out')
grid on;
   


   subplot(3,3,2)
   

   z1=find(H<h2&H>h1&mg110T<20&mg110T>0);
     
    s1=std(wsphmav(2,z1));
   edg=linspace(-3*s1,3*s1,30);

  h= histogram(wsphmav(2,z1),edg,'Normalization','pdf');
  
  hg=h.Values;
   
  hl1= histogram(dl1(z1,2),edg,'Normalization','pdf');
  hl=hl1.Values;
  
  xz=(edg(1:end-1)+edg(2:end))/2;
  

   plot(xz,hg,'r','LineWidth',1.5) ; hold on;

   plot(xz,hl,'b','LineWidth',1.5) ; hold on;

  
   xlim([-3*s1,3*s1]);
   ylim([0,0.12]);
   
   
   xticks([-2*s1:s1:2*s1]);
   yticks([0:0.01:0.12]);
   
   xticklabels({'-2\sigma','-\sigma','0','\sigma','2\sigma'});
   yticklabels({'0','1','2','3','4','5','6','7','8','9','10','11','12'});
   
   title('B_\theta misfit for |B| = 0-20 nT')
   
   ylabel('Relative counts (%)')
   
 

legend({'G110','L134'},'FontSize',7)
legend('boxoff')


set(gca,'xminortick','on')
set(gca,'yminortick','on')
set(gca,'tickdir','out')
grid on;
   



   subplot(3,3,3)

   z1=find(H<h2&H>h1&mg110T<20&mg110T>0);

   
       s1=std(wsphmav(3,z1));
   edg=linspace(-3*s1,3*s1,30);

  h= histogram(wsphmav(3,z1),edg,'Normalization','pdf');
  
  hg=h.Values;
   
  hl1= histogram(dl1(z1,3),edg,'Normalization','pdf');
  hl=hl1.Values;
  
  xz=(edg(1:end-1)+edg(2:end))/2;
  

   plot(xz,hg,'r','LineWidth',1.5) ; hold on;

   plot(xz,hl,'b','LineWidth',1.5) ; hold on;

  
   xlim([-3*s1,3*s1]);
   ylim([0,0.12]);
   
   
   xticks([-2*s1:s1:2*s1]);
   yticks([0:0.01:0.12]);
   
   xticklabels({'-2\sigma','-\sigma','0','\sigma','2\sigma'});
   yticklabels({'0','1','2','3','4','5','6','7','8','9','10','11','12'});
   
   title('B_\phi misfit for |B| = 0-20 nT')
   ylabel('Relative counts (%)')
   

legend({'G110','L134'},'FontSize',7)
legend('boxoff')


set(gca,'xminortick','on')
set(gca,'yminortick','on')
set(gca,'tickdir','out')
grid on;
   
   %%
   
      subplot(3,3,4)
   
   
   z1=find(H<h2&H>h1&mg110T<200&mg110T>20);
   
   s1=std(wsphmav(1,z1));
   edg=linspace(-3*s1,3*s1,30);

  h= histogram(wsphmav(1,z1),edg,'Normalization','pdf');
  
  hg=h.Values;
   
  hl1= histogram(dl1(z1),edg,'Normalization','pdf');
  hl=hl1.Values;
  
  xz=(edg(1:end-1)+edg(2:end))/2;
  

   plot(xz,hg,'r','LineWidth',1.5) ; hold on;

   plot(xz,hl,'b','LineWidth',1.5) ; hold on;

  
   xlim([-3*s1,3*s1]);
   %ylim([0,0.1]);
   
   
   xticks([-2*s1:s1:2*s1]);
   yticks([0:0.01:0.12]);
   
   xticklabels({'-2\sigma','-\sigma','0','\sigma','2\sigma'});
   yticklabels({'0','1','2','3','4','5','6','7','8','9','10','11','12'});
   
   
   legend({'G110','L134'},'FontSize',7)
legend('boxoff')

   title('B_r misfit for |B| = 20-200 nT')
   ylabel('Relative counts (%)')
 

set(gca,'xminortick','on')
set(gca,'yminortick','on')
set(gca,'tickdir','out')
grid on;
   


   subplot(3,3,5)
   
     
    s1=std(wsphmav(2,z1));
   edg=linspace(-3*s1,3*s1,30);

  h= histogram(wsphmav(2,z1),edg,'Normalization','pdf');
  
  hg=h.Values;
   
  hl1= histogram(dl1(z1,2),edg,'Normalization','pdf');
  hl=hl1.Values;
  
  xz=(edg(1:end-1)+edg(2:end))/2;
  

   plot(xz,hg,'r','LineWidth',1.5) ; hold on;

   plot(xz,hl,'b','LineWidth',1.5) ; hold on;

  
   xlim([-3*s1,3*s1]);
   %ylim([0,0.1]);
   
   
   xticks([-2*s1:s1:2*s1]);
   yticks([0:0.01:0.12]);
   
   xticklabels({'-2\sigma','-\sigma','0','\sigma','2\sigma'});
   yticklabels({'0','1','2','3','4','5','6','7','8','9','10','11','12'});
   
   title('B_\theta misfit for |B| = 20-200 nT')
   
   ylabel('Relative counts (%)')
   
 

legend({'G110','L134'},'FontSize',7)
legend('boxoff')


set(gca,'xminortick','on')
set(gca,'yminortick','on')
set(gca,'tickdir','out')
grid on;
   



   subplot(3,3,6)

   
       s1=std(wsphmav(3,z1));
   edg=linspace(-3*s1,3*s1,30);

  h= histogram(wsphmav(3,z1),edg,'Normalization','pdf');
  
  hg=h.Values;
   
  hl1= histogram(dl1(z1,3),edg,'Normalization','pdf');
  hl=hl1.Values;
  
  xz=(edg(1:end-1)+edg(2:end))/2;
  

   plot(xz,hg,'r','LineWidth',1.5) ; hold on;

   plot(xz,hl,'b','LineWidth',1.5) ; hold on;

  
   xlim([-3*s1,3*s1]);
   ylim([0,0.12]);
   
   
   xticks([-2*s1:s1:2*s1]);
   yticks([0:0.01:0.12]);
   
   xticklabels({'-2\sigma','-\sigma','0','\sigma','2\sigma'});
   yticklabels({'0','1','2','3','4','5','6','7','8','9','10','11','12'});
   
   title('B_\phi misfit for |B| = 20-200 nT')
   ylabel('Relative counts (%)')
   

legend({'G110','L134'},'FontSize',7)
legend('boxoff')


set(gca,'xminortick','on')
set(gca,'yminortick','on')
set(gca,'tickdir','out')
grid on;
   
   
   
   

   %%
      
   
      
      subplot(3,3,7)
   
   
   z1=find(H<h2&H>h1&mg110T<200000&mg110T>200);
   
   s1=std(wsphmav(1,z1));
   edg=linspace(-3*s1,3*s1,30);

  h= histogram(wsphmav(1,z1),edg,'Normalization','pdf');
  
  hg=h.Values;
   
  hl1= histogram(dl1(z1),edg,'Normalization','pdf');
  hl=hl1.Values;
  
  xz=(edg(1:end-1)+edg(2:end))/2;
  

   plot(xz,hg,'r','LineWidth',1.5) ; hold on;

   plot(xz,hl,'b','LineWidth',1.5) ; hold on;

  
   xlim([-3*s1,3*s1]);
   %ylim([0,0.1]);
   
   
   xticks([-2*s1:s1:2*s1]);
   yticks([0:0.01:0.12]);
   
   xticklabels({'-2\sigma','-\sigma','0','\sigma','2\sigma'});
   yticklabels({'0','1','2','3','4','5','6','7','8','9','10','11','12'});
   
   
   legend({'G110','L134'},'FontSize',7)
legend('boxoff')

   title('B_r misfit for |B| > 200 nT')
   ylabel('Relative counts (%)')
 

set(gca,'xminortick','on')
set(gca,'yminortick','on')
set(gca,'tickdir','out')
grid on;
   


   subplot(3,3,8)
   
     
    s1=std(wsphmav(2,z1));
   edg=linspace(-3*s1,3*s1,30);

  h= histogram(wsphmav(2,z1),edg,'Normalization','pdf');
  
  hg=h.Values;
   
  hl1= histogram(dl1(z1,2),edg,'Normalization','pdf');
  hl=hl1.Values;
  
  xz=(edg(1:end-1)+edg(2:end))/2;
  

   plot(xz,hg,'r','LineWidth',1.5) ; hold on;

   plot(xz,hl,'b','LineWidth',1.5) ; hold on;

  
   xlim([-3*s1,3*s1]);
   %ylim([0,0.1]);
   
   
   xticks([-2*s1:s1:2*s1]);
   yticks([0:0.01:0.12]);
   
   xticklabels({'-2\sigma','-\sigma','0','\sigma','2\sigma'});
   yticklabels({'0','1','2','3','4','5','6','7','8','9','10','11','12'});
   
   title('B_\theta misfit for |B| > 200 nT')
   
   ylabel('Relative counts (%)')
   
 

legend({'G110','L134'},'FontSize',7)
legend('boxoff')


set(gca,'xminortick','on')
set(gca,'yminortick','on')
set(gca,'tickdir','out')
grid on;
   



   subplot(3,3,9)

   
       s1=std(wsphmav(3,z1));
   edg=linspace(-3*s1,3*s1,30);

  h= histogram(wsphmav(3,z1),edg,'Normalization','pdf');
  
  hg=h.Values;
   
  hl1= histogram(dl1(z1,3),edg,'Normalization','pdf');
  hl=hl1.Values;
  
  xz=(edg(1:end-1)+edg(2:end))/2;
  

   plot(xz,hg,'r','LineWidth',1.5) ; hold on;

   plot(xz,hl,'b','LineWidth',1.5) ; hold on;

  
   xlim([-3*s1,3*s1]);
  % ylim([0,0.08]);
   
   
   xticks([-2*s1:s1:2*s1]);
   yticks([0:0.01:0.12]);
   
   xticklabels({'-2\sigma','-\sigma','0','\sigma','2\sigma'});
   yticklabels({'0','1','2','3','4','5','6','7','8','9','10','11','12'});
   
   title('B_\phi misfit for |B| > 200 nT')
   ylabel('Relative counts (%)')
   

legend({'G110','L134'},'FontSize',7)
legend('boxoff')


set(gca,'xminortick','on')
set(gca,'yminortick','on')
set(gca,'tickdir','out')
grid on;
   
   
   
   
   
   %%
   
   
  % text(-36,100,'(a)','fontsize',18,'FontWeight','Bold')
   

   
   %%
   


print('-dtiff ','-r600',[ '/Users/gaojiawei/Desktop/f_re/r1/','hist_Bt_0_400.tiff'])








