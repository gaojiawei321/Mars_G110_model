clear all;close all;clc



load D:\program/mars/crust/mars_crust_model/model_cain/gc
cain_g=gc;
load D:\program/mars/crust/mars_crust_model/model_cain/hc
cain_h=hc;
load D:\program/mars/crust/mars_crust_model/M14/g
m14_g=g;
load D:\program/mars/crust/mars_crust_model/M14/h
m14_h=h;
load D:\program/mars/crust/mars_crust_model/model_lang_2018/g_lang_18
l18_g=g;
load D:\program/mars/crust/mars_crust_model/model_lang_2018/h_lang_18
l18_h=h;

load D:\program/mars/crust/mars_crust_model/model_gao/g_90_mm
gao_g=g;
load D:\program/mars/crust/mars_crust_model/model_gao/h_90_mm
gao_h=h;
%a=r=1

a=3393.5;
r=a+0;


for n=1:91
    g2=cain_g.^2;
    h2=cain_h.^2;
    R_c(n)=(n+1)* (a/r).^(2*n+4) *(sum(g2(:,n))+sum(h2(:,n)));
end

for n=1:111
    g2=m14_g.^2;
    h2=m14_h.^2;
    R_m(n)=(n+1)* (a/r)^(2*n+4)*(sum(g2(:,n))+sum(h2(:,n)));
end
for n=1:135
    g2=l18_g.^2;
    h2=l18_h.^2;
    R_l(n)=(n+1)*(a/r)^(2*n+4)*(sum(g2(:,n))+sum(h2(:,n)));
end
for n=1:length(gao_g)
    g2=gao_g.^2;
    h2=gao_h.^2;
    R_g(n)=(n+1)*(a/r)^(2*n+4)*(sum(g2(:,n))+sum(h2(:,n)));
end

%%
axes('position',[0.1,0.1,0.35,0.8])
zt=2;

plot(R_g,'k','Linewidth',zt);hold on;
plot(R_c,'r','Linewidth',zt);hold on;
plot(R_m,'g','Linewidth',zt);hold on;
plot(R_l,'b','Linewidth',zt);hold on;
plot(R_g,'k','Linewidth',zt);hold on;

title('Surface','FontSize',18)
xlabel('Spherical harmonic degree')
ylabel('Power spectrum (nT^2)')

set(gca,'yscale','log')
set(gca,'tickdir','out')
 % set(gca,'FontSize',10)
   set(gca,'xminortick','on');
set(gca,'yminortick','on');    grid on;

legend({'G90','C90','M110','L134'},'Location','south','FontSize',12)

text(-30,100000,'(a)','FontSize',18)
       
grid on;

%%
a=3393.5;
r=a+120;


for n=1:91
    g2=cain_g.^2;
    h2=cain_h.^2;
    R_c(n)=(n+1)* (a/r).^(2*n+4) *(sum(g2(:,n))+sum(h2(:,n)));
end

for n=1:111
    g2=m14_g.^2;
    h2=m14_h.^2;
    R_m(n)=(n+1)* (a/r)^(2*n+4)*(sum(g2(:,n))+sum(h2(:,n)));
end
for n=1:135
    g2=l18_g.^2;
    h2=l18_h.^2;
    R_l(n)=(n+1)*(a/r)^(2*n+4)*(sum(g2(:,n))+sum(h2(:,n)));
end
for n=1:length(gao_g)
    g2=gao_g.^2;
    h2=gao_h.^2;
    R_g(n)=(n+1)*(a/r)^(2*n+4)*(sum(g2(:,n))+sum(h2(:,n)));
end


axes('position',[0.55,0.1,0.35,0.8])

plot(R_g,'k','Linewidth',zt);hold on;
plot(R_c,'r','Linewidth',zt);hold on;
plot(R_m,'g','Linewidth',zt);hold on;
plot(R_l,'b','Linewidth',zt);hold on;
plot(R_g,'k','Linewidth',zt);hold on;

title('120 km altitude','FontSize',18)
xlabel('Spherical harmonic degree')
ylabel('Power spectrum (nT^2)')

set(gca,'yscale','log')
    set(gca,'tickdir','out')
% set(gca,'FontSize',10)
   set(gca,'xminortick','on');
set(gca,'yminortick','on');    grid on;

legend({'G90','C90','M110','L134'},'Location','south','FontSize',12)
    
grid on;


%%

text(-30,1000,'(b)','FontSize',18)


%%
pos=[0 0 26 13];
set(gcf,'PaperPositionMode','manual','PaperUnits','centimeters',...
        'PaperPosition',pos,'units','centimeters','position',pos);
print('-dtiff ','-r600',[ 'C:/Users/gao/Desktop/','f5.tiff'])

