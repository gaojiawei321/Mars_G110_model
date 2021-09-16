clear all;close all;clc

load qd_q

Rm=3393.5;

 [qa,qe,qr] = cart2sph(PCq(:,1),PCq(:,2),PCq(:,3));

 
qe_zhuan=pi/2-qe;

%%

z1=find(qe>1.5);

mean(Bq(z1))

z2=find(qe<-1.5);

mean(Bq(z2))


%%



jg=linspace(-pi,pi,100);
wg=linspace(max(qe),1.57,20);

%wg=logspace(max(qe),1.57,40);

%wg=[1.5207,1.53,1.54,1.55,1.56];

hg=linspace(120,410,10)+3393.5;

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

jg=linspace(-pi,pi,100);
wg=linspace(-1.57,min(qe),20);
hg=linspace(120,350,10)+3393.5;

%hg=linspace(120,410,10)+3393.5;


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
        
a1=find(PCq(z1,3)>0);

scatter(PCq(z1(a1),1),PCq(z1(a1),2),1,Bq(z1(a1),3)); hold on;
 a2=find(PCq_jia(:,3)>0);
scatter(PCq_jia(a2,1),PCq_jia(a2,2),1,Bq_jia(a2,3)); hold on;
colormap jet
colorbar
caxis([-20 20])
    
    
    %%
a1=find(PCq(z2,3)<0);

scatter(PCq(z2(a1),1),PCq(z2(a1),2),1,Bq(z2(a1),3)); hold on;
 a2=find(PCq_jia(:,3)<0);
scatter(PCq_jia(a2,1),PCq_jia(a2,2),1,Bq_jia(a2,3)); hold on;
colormap jet
colorbar
caxis([-20 20])
    
    
    %%
    Bq=[Bq;Bq_jia];
    PCq=[PCq;PCq_jia];

    
  %  Bjiat=(Bq_jia(:,1).^2+Bq_jia(:,2).^2+Bq_jia(:,3).^2).^2;
    
  %  scatter(PCq_jia(:,1),PCq_jia(:,2),1,Bq_jia(:,3))
  
  
 save qdq.mat   Bq PCq
 
 
    %%

    
    