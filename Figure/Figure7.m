clear all;close all;clc


load wc_cml_rms_hq


load mso_q
load mso_n
load pc_q
load pc_n



%%

rm=3393.5;

jian=1;

pcq=pc_q(1:jian:end,5:7);
pcn=pc_n(1:jian:end,5:7);

[qa,qe,qr] = cart2sph(pcq(:,1),pcq(:,2),pcq(:,3));
[na,ne,nr] = cart2sph(pcn(:,1),pcn(:,2),pcn(:,3));

qe_zhuan=pi/2-qe;
ne_zhuan=pi/2-ne;

bpcsph_q=datac2s(pc_q(1:jian:end,2),pc_q(1:jian:end,3),pc_q(1:jian:end,4),qe_zhuan',qa')';
bpcsph_n=datac2s(pc_n(1:jian:end,2),pc_n(1:jian:end,3),pc_n(1:jian:end,4),ne_zhuan',na')';


h=100:10:600;
Tm=datenum(2016,10,1,0,0,0);

for i=1:length(h)-1

   %   z=find(Mr>h(i)+rm&Mr<h(i+1)+rm&mso(:,1)<0&Me>0);
 
   %  z1=find(qr>h(i)+rm&qr<h(i+1)+rm&mso_q(1:jian:end,5)<-500);
   %  z2=find(nr>h(i)+rm&nr<h(i+1)+rm&mso_n(1:jian:end,5)<-500);
  
     z1=find(qr>h(i)+rm&qr<h(i+1)+rm&mso_q(1:jian:end,5)<-500&mso_q(1:jian:end,1)<Tm);
     z2=find(nr>h(i)+rm&nr<h(i+1)+rm&mso_n(1:jian:end,5)<-500&mso_n(1:jian:end,1)<Tm);
  
      ge_q(i)=length(z1);
      ge_n(i)=length(z2);
      
      bgaoq=gao_r([pcq(z1,1) pcq(z1,2) pcq(z1,3)]');
   
      bgaon=gao_r([pcn(z2,1) pcn(z2,2) pcn(z2,3)]');   
   
%  wgz= bgao-Bq(:,z);
 % by1=bpcsph_q(z1,;)'
  wgzq= bgaoq-bpcsph_q(z1,:)';
  wgzn= bgaon-bpcsph_n(z2,:)';
  
    
   wgq(i,1:4)= [  std( vecnorm(wgzq,2) ) ;std( wgzq(1,:)); std( wgzq(2,:));std( wgzq(3,:));] ;

   wgn(i,1:4)= [  std( vecnorm(wgzn,2) ) ;std( wgzn(1,:)); std( wgzn(2,:));std( wgzn(3,:));] ;
  
end


%plot(wg(3:end),h(3:end-1),'r'); hold on;
%%

figure
   pos=[1 1 40 15];
set(gcf,'unit','centimeters','position',pos)

ld=1.5;
lad=15;
axes('position',[0.05,0.1,0.2,0.8])


kai=5;
kan=2;
plot(wgq(kai:end,kan),h(kai:end-1),'r-','linewidth',ld); hold on;

plot(rmscq(kai:end,kan),h(kai:end-1),'k-','linewidth',ld); hold on;
plot(rmsmq(kai:end,kan),h(kai:end-1),'g-','linewidth',ld); hold on;
plot(rmslq(kai:end,kan),h(kai:end-1),'b-','linewidth',ld); hold on;

plot(wgn(kai:end,kan),h(kai:end-1),'r--','linewidth',ld); hold on;

plot(rmscn(kai:end,kan),h(kai:end-1),'k--','linewidth',ld); hold on;
plot(rmsmn(kai:end,kan),h(kai:end-1),'g--','linewidth',ld); hold on;
plot(rmsln(kai:end,kan),h(kai:end-1),'b--','linewidth',ld); hold on;

ylim([100 600])
xlim([3 20])

legend({'G_{110} Quiet','C_{90} Quiet','M_{110} Quiet','L_{134} Quiet','G_{110} Disturbed','C_{90} Disturbed','M_{110} Disturbed','L_{134} Disturbed'},'FontSize',12)

xlabel('B_r (nT)','fontsize',lad)
ylabel('Altitude (km)','fontsize',lad)
title('(a)','fontsize',20)

set(gca,'xminortick','on')
set(gca,'yminortick','on')
set(gca,'linewidth',1.5)

grid on
%%

axes('position',[0.3,0.1,0.2,0.8])
kai=5;
kan=3;
plot(wgq(kai:end,kan),h(kai:end-1),'r-','linewidth',ld); hold on;

plot(rmscq(kai:end,kan),h(kai:end-1),'k-','linewidth',ld); hold on;
plot(rmsmq(kai:end,kan),h(kai:end-1),'g-','linewidth',ld); hold on;
plot(rmslq(kai:end,kan),h(kai:end-1),'b-','linewidth',ld); hold on;

plot(wgn(kai:end,kan),h(kai:end-1),'r--','linewidth',ld); hold on;

plot(rmscn(kai:end,kan),h(kai:end-1),'k--','linewidth',ld); hold on;
plot(rmsmn(kai:end,kan),h(kai:end-1),'g--','linewidth',ld); hold on;
plot(rmsln(kai:end,kan),h(kai:end-1),'b--','linewidth',ld); hold on;

ylim([100 600])
xlim([3 20])

legend({'G_{110} Quiet','C_{90} Quiet','M_{110} Quiet','L_{134} Quiet','G_{110} Disturbed','C_{90} Disturbed','M_{110} Disturbed','L_{134} Disturbed'},'FontSize',12)

xlabel('B_\theta (nT)','fontsize',lad)
ylabel('Altitude (km)','fontsize',lad)
%title('Residual |B|')
title('(b)','fontsize',20)

set(gca,'xminortick','on')
set(gca,'yminortick','on')
set(gca,'linewidth',1.5)

grid on
%%
axes('position',[0.55,0.1,0.2,0.8])

kai=5;
kan=4;
plot(wgq(kai:end,kan),h(kai:end-1),'r-','linewidth',ld); hold on;

plot(rmscq(kai:end,kan),h(kai:end-1),'k-','linewidth',ld); hold on;
plot(rmsmq(kai:end,kan),h(kai:end-1),'g-','linewidth',ld); hold on;
plot(rmslq(kai:end,kan),h(kai:end-1),'b-','linewidth',ld); hold on;

plot(wgn(kai:end,kan),h(kai:end-1),'r--','linewidth',ld); hold on;

plot(rmscn(kai:end,kan),h(kai:end-1),'k--','linewidth',ld); hold on;
plot(rmsmn(kai:end,kan),h(kai:end-1),'g--','linewidth',ld); hold on;
plot(rmsln(kai:end,kan),h(kai:end-1),'b--','linewidth',ld); hold on;

ylim([100 600])
xlim([3 20])

legend({'G_{110} Quiet','C_{90} Quiet','M_{110} Quiet','L_{134} Quiet','G_{110} Disturbed','C_{90} Disturbed','M_{110} Disturbed','L_{134} Disturbed'},'FontSize',12)

xlabel('B_\phi  (nT)','fontsize',lad)
ylabel('Altitude (km)','fontsize',lad)
%title('Residual |B|')
title('(c)','fontsize',20)

set(gca,'xminortick','on')
set(gca,'yminortick','on')
set(gca,'linewidth',1.5)

grid on
%%

axes('position',[0.8,0.1,0.15,0.8])
plot(ge_q,h(1:end-1),'r','linewidth',ld); hold on;

plot(ge_n,h(1:end-1),'b','linewidth',ld); hold on;

xlabel('Number of points','fontsize',lad)
ylabel('Altitude (km)','fontsize',lad)
legend({'MAVEN Quiet data','MAVEN Disturbed data'},'FontSize',12)
%title('global')
title('(d)','fontsize',20)


set(gca,'xminortick','on')
set(gca,'yminortick','on')
set(gca,'Xscale','log');
xlim([5000 200000])
set(gca,'linewidth',1.5)

grid on

%%

set(gcf,'PaperPositionMode','manual','PaperUnits','centimeters',...
        'PaperPosition',pos,'units','centimeters','position',pos);
    
%print('-dtiff ','-r600',[ 'D:\program\mars\crust\wucha\wucha_tu\','wc_qn_3.tiff'])

 print('-dtiff ','-r600',[ '/Users/gaojiawei/Desktop/f_re/r1/','RMS_al.tiff'])


 