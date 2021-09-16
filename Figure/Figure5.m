clear;close;clc


load wc_suan.mat
%load wc_suan_duo.mat


rm=3393.5;


%%
   wsphmav=dg1';
  
   
   wsphmgs=dg2';
   
    
   %dg2 is mgs misfit for G90
   
   %%
   %{
  subplot(1,3,1)
   s1=std(wsphmav(1,:));
   edg=linspace(-3*s1,3*s1,30);

 % h= histogram(wsphmav(1,:),edg,'Normalization','pdf'); hold on;
          histfit(wsphmav(1,:)); hold on;
        title('Br') 
        legend('data','fit')
        xlim([-50 50])
          
     subplot(1,3,2)
   s1=std(wsphmav(1,:));
   edg=linspace(-3*s1,3*s1,30);

 % h= histogram(wsphmav(1,:),edg,'Normalization','pdf'); hold on;
          histfit(wsphmav(2,:)); hold on;
        title('B\theta') 
        legend('data','fit')
                  xlim([-50 50])
                  
          subplot(1,3,3)
   s1=std(wsphmav(1,:));
   edg=linspace(-3*s1,3*s1,30);

 % h= histogram(wsphmav(1,:),edg,'Normalization','pdf'); hold on;
          histfit(wsphmav(3,:)); hold on;
        title('B\phi') 
        legend('data','fit')
                  xlim([-50 50])
        
                  print('-dtiff ','-r600',[ '/Users/gaojiawei/Desktop/f_re/','hist_gauss.tiff'])


%}
   %%
      pos=[0 0 25 15];

set(gcf,'PaperPositionMode','manual','PaperUnits','centimeters',...
        'PaperPosition',pos,'units','centimeters','position',pos);
    

    
    
   subplot(2,3,1)
   s1=std(wsphmav(1,:));
   edg=linspace(-3*s1,3*s1,30);

  h= histogram(wsphmav(1,:),edg,'Normalization','pdf');
  
  hg=h.Values;
   
  hl1= histogram(dl1(:,1),edg,'Normalization','pdf');
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

   title('MAVEN B_r misfit')
   ylabel('Relative counts (%)')
 

set(gca,'xminortick','on')
set(gca,'yminortick','on')
set(gca,'tickdir','out')
grid on;
   

   subplot(2,3,2)
   
    s1=std(wsphmav(2,:));
   edg=linspace(-3*s1,3*s1,30);

  h= histogram(wsphmav(2,:),edg,'Normalization','pdf');
  
  hg=h.Values;
   
  hl1= histogram(dl1(:,2),edg,'Normalization','pdf');
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
   
   title('MAVEN B_\theta misfit')
   ylabel('Relative counts (%)')
   
    z1=find(abs(wsphmav(2,:))<3*s1);

legend({'G110','L134'},'FontSize',7)
legend('boxoff')


set(gca,'xminortick','on')
set(gca,'yminortick','on')
set(gca,'tickdir','out')
grid on;
   



   subplot(2,3,3)
   
       s1=std(wsphmav(3,:));
   edg=linspace(-3*s1,3*s1,30);

  h= histogram(wsphmav(3,:),edg,'Normalization','pdf');
  
  hg=h.Values;
   
  hl1= histogram(dl1(:,3),edg,'Normalization','pdf');
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
   
   title('MAVEN B_\phi misfit')
   ylabel('Relative counts (%)')
   

legend({'G110','L134'},'FontSize',7)
legend('boxoff')


set(gca,'xminortick','on')
set(gca,'yminortick','on')
set(gca,'tickdir','out')
grid on;
   
   
   
   

   %%
      
   subplot(2,3,4)
   
      s1=std(wsphmgs(1,:));
   edg=linspace(-3*s1,3*s1,30);

  h= histogram(wsphmgs(1,:),edg,'Normalization','pdf');
  
  hg=h.Values;
   
  hl1= histogram(dl2(:,1),edg,'Normalization','pdf');
  hl=hl1.Values;
  
  xz=(edg(1:end-1)+edg(2:end))/2;
  

   plot(xz,hg,'r','LineWidth',1.5) ; hold on;

   plot(xz,hl,'b','LineWidth',1.5) ; hold on;

  
   xlim([-3*s1,3*s1]);
   ylim([0,0.08]);

   
   
   xticks([-2*s1:s1:2*s1]);
   yticks([0:0.01:0.12]);
   
   xticklabels({'-2\sigma','-\sigma','0','\sigma','2\sigma'});
   yticklabels({'0','1','2','3','4','5','6','7','8','9','10','11','12'});
   
   
   legend({'G110','L134'},'FontSize',7)
legend('boxoff')

      title('MGS B_r misfit')
   ylabel('Relative counts (%)')
   set(gca,'xminortick','on')
set(gca,'yminortick','on')
set(gca,'tickdir','out')
grid on;
   
   
   subplot(2,3,5)
      
         s1=std(wsphmgs(2,:));
   edg=linspace(-3*s1,3*s1,30);

  h= histogram(wsphmgs(2,:),edg,'Normalization','pdf');
  
  hg=h.Values;
   
  hl1= histogram(dl2(:,2),edg,'Normalization','pdf');
  hl=hl1.Values;
  
  xz=(edg(1:end-1)+edg(2:end))/2;
  

   plot(xz,hg,'r','LineWidth',1.5) ; hold on;

   plot(xz,hl,'b','LineWidth',1.5) ; hold on;

  
   xlim([-3*s1,3*s1]);
   ylim([0,0.08]);

   
   
   xticks([-2*s1:s1:2*s1]);
   yticks([0:0.01:0.12]);
   
   xticklabels({'-2\sigma','-\sigma','0','\sigma','2\sigma'});
   yticklabels({'0','1','2','3','4','5','6','7','8','9','10','11','12'});
   
   
   legend({'G110','L134'},'FontSize',7)
legend('boxoff')

   title('MGS B_\theta misfit')
   ylabel('Relative counts (%)')
   set(gca,'xminortick','on')
set(gca,'yminortick','on')
set(gca,'tickdir','out')
grid on;
   
   
   
   
 
   subplot(2,3,6)
   
   
            s1=std(wsphmgs(3,:));
   edg=linspace(-3*s1,3*s1,30);

  h= histogram(wsphmgs(3,:),edg,'Normalization','pdf');
  
  hg=h.Values;
   
  hl1= histogram(dl2(:,3),edg,'Normalization','pdf');
  hl=hl1.Values;
  
  xz=(edg(1:end-1)+edg(2:end))/2;
  

   plot(xz,hg,'r','LineWidth',1.5) ; hold on;

   plot(xz,hl,'b','LineWidth',1.5) ; hold on;

  
   xlim([-3*s1,3*s1]);
   ylim([0,0.08]);

   
   
   xticks([-2*s1:s1:2*s1]);
   yticks([0:0.01:0.12]);
   
   xticklabels({'-2\sigma','-\sigma','0','\sigma','2\sigma'});
   yticklabels({'0','1','2','3','4','5','6','7','8','9','10','11','12'});
   
   
   legend({'G110','L134'},'FontSize',7)
legend('boxoff')

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
    


%print('-dtiff ','-r600',[ '/Users/gaojiawei/Desktop/f_re/r1/','hist110j.tiff'])








