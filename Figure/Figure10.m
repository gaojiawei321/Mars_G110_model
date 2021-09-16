clear all;close all;clc



load /Users/gaojiawei/program/mars/crust/mars_crust_model/model_cain/gc
cain_g=gc;
load /Users/gaojiawei/program/mars/crust/mars_crust_model/model_cain/hc
cain_h=hc;
load /Users/gaojiawei/program/mars/crust/mars_crust_model/M14/g
m14_g=g;
load /Users/gaojiawei/program/mars/crust/mars_crust_model/M14/h
m14_h=h;
load /Users/gaojiawei/program/mars/crust/mars_crust_model/model_lang_2018/g_lang_18
l18_g=g;
load /Users/gaojiawei/program/mars/crust/mars_crust_model/model_lang_2018/h_lang_18
l18_h=h;

load /Users/gaojiawei/program/mars/crust/mars_crust_model/model_gao/g_110_mm_q
gao_g110=g;
load /Users/gaojiawei/program/mars/crust/mars_crust_model/model_gao/h_110_mm_q
gao_h110=h;

load /Users/gaojiawei/program/mars/crust/mars_crust_model/model_gao/g_90_mm_q
gao_g90=g;
load /Users/gaojiawei/program/mars/crust/mars_crust_model/model_gao/h_90_mm_q
gao_h90=h;

load /Users/gaojiawei/program/mars/crust/mars_crust_model/model_gao/g_80_mm_q
gao_g80=g;
load /Users/gaojiawei/program/mars/crust/mars_crust_model/model_gao/h_80_mm_q
gao_h80=h;

load /Users/gaojiawei/program/mars/crust/mars_crust_model/model_gao/g_100_mm_q
gao_g100=g;
load /Users/gaojiawei/program/mars/crust/mars_crust_model/model_gao/h_100_mm_q
gao_h100=h;

load /Users/gaojiawei/program/mars/crust/mars_crust_model/model_gao/g_120_mm_q
gao_g120=g;
load /Users/gaojiawei/program/mars/crust/mars_crust_model/model_gao/h_120_mm_q
gao_h120=h;



%a=r=1

a=3393.5;
r=a+0;


for n=1:91-1
    g2=cain_g.^2;
    h2=cain_h.^2;
    R_c(n)=(n+1)* (a/r).^(2*n+4) *(sum(g2(:,n+1))+sum(h2(:,n+1)));
end

for n=1:111-1
    g2=m14_g.^2;
    h2=m14_h.^2;
    R_m(n)=(n+1)* (a/r)^(2*n+4)*(sum(g2(:,n+1))+sum(h2(:,n+1)));
end
for n=1:135-1
    g2=l18_g.^2;
    h2=l18_h.^2;
    R_l(n)=(n+1)*(a/r)^(2*n+4)*(sum(g2(:,n+1))+sum(h2(:,n+1)));
end
for n=1:length(gao_g110)-1
    g2=gao_g110.^2;
    h2=gao_h110.^2;
    R_g110(n)=(n+1)*(a/r)^(2*n+4)*(sum(g2(:,n+1))+sum(h2(:,n+1)));
end

for n=1:length(gao_g90)-1
    g2=gao_g90.^2;
    h2=gao_h90.^2;
    R_g90(n)=(n+1)*(a/r)^(2*n+4)*(sum(g2(:,n+1))+sum(h2(:,n+1)));
end
for n=1:length(gao_g80)-1
    g2=gao_g80.^2;
    h2=gao_h80.^2;
    R_g80(n)=(n+1)*(a/r)^(2*n+4)*(sum(g2(:,n+1))+sum(h2(:,n+1)));
end


for n=1:length(gao_g100)-1
    g2=gao_g100.^2;
    h2=gao_h100.^2;
    R_g100(n)=(n+1)*(a/r)^(2*n+4)*(sum(g2(:,n+1))+sum(h2(:,n+1)));
end

for n=1:length(gao_g120)-1
    g2=gao_g120.^2;
    h2=gao_h120.^2;
    R_g120(n)=(n+1)*(a/r)^(2*n+4)*(sum(g2(:,n+1))+sum(h2(:,n+1)));
end


%%
%axes('position',[0.1,0.1,0.35,0.8])
zt=2;

pos=[0 0 26 26];
set(gcf,'PaperPositionMode','manual','PaperUnits','centimeters',...
        'PaperPosition',pos,'units','centimeters','position',pos);

    
axes('position',[0.1,0.55,0.35,0.35])


%plot(R_g120,'color',[0  0 0],'Linewidth',zt);hold on;


%plot(R_g90,'color','m','Linewidth',zt);hold on;
%plot(R_g100,'color','y','Linewidth',zt);hold on;

%plot(R_g110,'color',[0 0 0],'Linewidth',zt);hold on;
%plot(R_g100,'color',[0.3 0.3 0.3],'Linewidth',zt);hold on;
%plot(R_g90,'color',[0.6 0.6 0.6],'Linewidth',zt);hold on;


plot(R_c,'k','Linewidth',zt);hold on;
plot(R_m,'g','Linewidth',zt);hold on;
plot(R_l,'b','Linewidth',zt);hold on;

%plot(R_g110,'k','Linewidth',zt);hold on;

plot(R_g110,'color','r','Linewidth',zt);hold on;

title('Surface','FontSize',18)
xlabel('Spherical harmonic degree')
ylabel('Power spectrum (nT^2)')

set(gca,'yscale','log')
set(gca,'tickdir','out')
 % set(gca,'FontSize',10)
   set(gca,'xminortick','on');
set(gca,'yminortick','on');    grid on;

legend({'C90','M110','L134','G110'},'Location','south','FontSize',12)

text(-30,100000,'(a)','FontSize',18,'FontWeight','Bold')
       
grid on;

%%


axes('position',[0.55,0.55,0.35,0.35])


%plot(R_g120,'color',[0  0 0],'Linewidth',zt);hold on;

plot(R_g80,'color','g','Linewidth',zt);hold on;

plot(R_g90,'color','m','Linewidth',zt);hold on;
plot(R_g100,'color','y','Linewidth',zt);hold on;

%plot(R_g110,'color',[0 0 0],'Linewidth',zt);hold on;
%plot(R_g100,'color',[0.3 0.3 0.3],'Linewidth',zt);hold on;
%plot(R_g90,'color',[0.6 0.6 0.6],'Linewidth',zt);hold on;


%plot(R_c,'k','Linewidth',zt);hold on;
%plot(R_m,'g','Linewidth',zt);hold on;
%plot(R_l,'b','Linewidth',zt);hold on;
%plot(R_g110,'k','Linewidth',zt);hold on;
plot(R_g120,'color','b','Linewidth',zt);hold on;

plot(R_g110,'color','r','Linewidth',zt);hold on;


title('Surface','FontSize',18)
xlabel('Spherical harmonic degree')
ylabel('Power spectrum (nT^2)')

set(gca,'yscale','log')
set(gca,'tickdir','out')
 % set(gca,'FontSize',10)
   set(gca,'xminortick','on');
set(gca,'yminortick','on');    grid on;

legend({'G80','G90','G100','G120','G110'},'Location','south','FontSize',12)

text(-25,100000,'(b)','FontSize',18,'FontWeight','Bold')
       
grid on;







%%
a=3393.5;
r=a+120;


for n=1:91-1
    g2=cain_g.^2;
    h2=cain_h.^2;
    R_c(n)=(n+1)* (a/r).^(2*n+4) *(sum(g2(:,n+1))+sum(h2(:,n+1)));
end

for n=1:111-1
    g2=m14_g.^2;
    h2=m14_h.^2;
    R_m(n)=(n+1)* (a/r)^(2*n+4)*(sum(g2(:,n+1))+sum(h2(:,n+1)));
end
for n=1:135-1
    g2=l18_g.^2;
    h2=l18_h.^2;
    R_l(n)=(n+1)*(a/r)^(2*n+4)*(sum(g2(:,n+1))+sum(h2(:,n+1)));
end
for n=1:length(gao_g110)-1
    g2=gao_g110.^2;
    h2=gao_h110.^2;
    R_g110(n)=(n+1)*(a/r)^(2*n+4)*(sum(g2(:,n+1))+sum(h2(:,n+1)));
end
for n=1:length(gao_g90)-1
    g2=gao_g90.^2;
    h2=gao_h90.^2;
    R_g90(n)=(n+1)*(a/r)^(2*n+4)*(sum(g2(:,n+1))+sum(h2(:,n+1)));
end
for n=1:length(gao_g80)-1
    g2=gao_g80.^2;
    h2=gao_h80.^2;
    R_g80(n)=(n+1)*(a/r)^(2*n+4)*(sum(g2(:,n+1))+sum(h2(:,n+1)));
end
for n=1:length(gao_g100)-1
    g2=gao_g100.^2;
    h2=gao_h100.^2;
    R_g100(n)=(n+1)*(a/r)^(2*n+4)*(sum(g2(:,n+1))+sum(h2(:,n+1)));
end

for n=1:length(gao_g120)-1
    g2=gao_g120.^2;
    h2=gao_h120.^2;
    R_g120(n)=(n+1)*(a/r)^(2*n+4)*(sum(g2(:,n+1))+sum(h2(:,n+1)));
end
%%



axes('position',[0.55,0.1,0.35,0.35])
%plot(R_g110,'k','Linewidth',zt);hold on;


plot(R_g80,'color','g','Linewidth',zt);hold on;

plot(R_g90,'color','m','Linewidth',zt);hold on;
plot(R_g100,'color','y','Linewidth',zt);hold on;

plot(R_g120,'color','b','Linewidth',zt);hold on;

plot(R_g110,'color','r','Linewidth',zt);hold on;



title('120 km Altitude','FontSize',18)
xlabel('Spherical harmonic degree')
ylabel('Power spectrum (nT^2)')

set(gca,'yscale','log')
    set(gca,'tickdir','out')
% set(gca,'FontSize',10)
   set(gca,'xminortick','on');
set(gca,'yminortick','on');    grid on;

legend({'G80','G90','G100','G120','G110'},'Location','south','FontSize',12)

grid on;

text(-25,1000,'(d)','FontSize',18,'FontWeight','Bold')

%%

axes('position',[0.1,0.1,0.35,0.35])


%plot(R_g120,'color',[0  0 0],'Linewidth',zt);hold on;


%plot(R_g90,'color','m','Linewidth',zt);hold on;
%plot(R_g100,'color','y','Linewidth',zt);hold on;

%plot(R_g110,'color',[0 0 0],'Linewidth',zt);hold on;
%plot(R_g100,'color',[0.3 0.3 0.3],'Linewidth',zt);hold on;
%plot(R_g90,'color',[0.6 0.6 0.6],'Linewidth',zt);hold on;


plot(R_c,'k','Linewidth',zt);hold on;
plot(R_m,'g','Linewidth',zt);hold on;
plot(R_l,'b','Linewidth',zt);hold on;

%plot(R_g110,'k','Linewidth',zt);hold on;

plot(R_g110,'color','r','Linewidth',zt);hold on;

title('120 km Altitude','FontSize',18)
xlabel('Spherical harmonic degree')
ylabel('Power spectrum (nT^2)')

set(gca,'yscale','log')
set(gca,'tickdir','out')
 % set(gca,'FontSize',10)
   set(gca,'xminortick','on');
set(gca,'yminortick','on');    grid on;

legend({'C90','M110','L134','G110'},'Location','south','FontSize',12)

text(-30,1000,'(c)','FontSize',18,'FontWeight','Bold')
       
grid on;


%%


%%

%%
print('-dtiff ','-r600',[ '/Users/gaojiawei/Desktop/f_re/r1/','power2.tiff'])
