clear all;close all;clc
%load Bq;
%load pcq;
load qd_jie2
load B

B=B';
load Cdn
%Bq=Bq(2765:1:end,:);
%PCq=PCq(2765:1:end,:);

%pcq=PCq;
[Ga,Ge,Gr] = cart2sph(PCq(:,1),PCq(:,2),PCq(:,3));

%load gy
%load hy

gy=ones(150,150);
hy=ones(150,150);


g=gy;
h=hy;

Rm=3393.5;
ye=pi/2-Ge;
%Gr/Rm;
ge=length(Bq);
%ge=1050000;
bsph=datac2s(Bq(:,1),Bq(:,2),Bq(:,3),ye',Ga');

nmax=110;
g=g(1:nmax+1,1:nmax+1);
h=h(1:nmax+1,1:nmax+1);

cchang= 20000;


 e1=zeros(nmax*(nmax+2),nmax*(nmax+2));
 ef=zeros(nmax*(nmax+2),nmax*(nmax+2));
 
%C=zeros(3,nmax*(nmax+2));

bbc=1;
cung=(ge/cchang);

for cun=1:cung
    
    cun
    bc=1;
    
    C=zeros(cchang*3,nmax*(nmax+2));
    
    for bge=1+cchang*(cun-1):cchang*cun
        
        %   bc=bge-cchang*(cun-1);
        
        bge;
        
        
        theta=ye(bge);
        phi=Ga(bge);
        r=Gr(bge);
        a=3393.5;
        sz=size(g);
        
        N=sz(1)-1;
        
        st=sin(theta);
        ct=cos(theta);
        
        
        n=1:1:N;
        m=0:1:N;
        rn=(a/r).^(n+2);
        
        cmp=cos(m.*phi);
        smp=sin(m.*phi);
        
        
        %%
        S1= zeros(N+1,N+1);
        for n=1:N
            for m=0:n
                if m>1
                    S1(m+1,n+1) = S1(m,n+1)*((n-m+1)/(n+m))^0.5;
                elseif m==1
                    S1(m+1,n+1) = S1(m,n+1)*(2*(n-m+1)/(n+m))^0.5;
                elseif n==1
                    S1(1,1+n) = 1;
                else
                    S1(1,1+n) = S1(1,n)*(2*n-1)/(n);
                end
            end
        end
        
        
        %%
        
        %P=zeros(N+1,N+1);
        
        %dP=zeros(N+1,N+1);
        
        P11=1; P10=P11;
        dP11=0; dP10=dP11;
        
        Br=0; Bt=0; Bp=0;
        Br1=zeros(N+1,N+1); Bt1=zeros(N+1,N+1); Bp1=zeros(N+1,N+1);
        Br2=zeros(N+1,N+1); Bt2=zeros(N+1,N+1); Bp2=zeros(N+1,N+1);
        
        
        for m=0:N
            
            %   m
            for n=m:N
                
                %   n
                if n==0
                    
                else
                    
                    % Calculate Legendre polynomials and derivatives recursively
                    if n==m
                        P2 = st*P11;
                        dP2 = st*dP11 + ct*P11;
                        P11=P2; P10=P11; P20=0;
                        dP11=dP2; dP10=dP11; dP20=0;
                    elseif n==1
                        P2 = ct*P10;
                        dP2 = ct*dP10 - st*P10;
                        P20=P10; P10=P2;
                        dP20=dP10; dP10=dP2;
                    else
                        K = ((n-1)^2-m^2)/((2*n-1)*(2*n-3));
                        P2 = ct*P10 - K*P20;
                        dP2 = ct*dP10 - st*P10 - K*dP20;
                        P20=P10; P10=P2;
                        dP20=dP10; dP10=dP2;
                    end
                    
                    
                    %        P(m+1,n+1)=P2;
                    %        dP(m+1,n+1)=dP2;
                    
                    Br=Br+rn(n)*(n+1)*((g(m+1,n+1)*cmp(m+1) + h(m+1,n+1)*smp(m+1) ))*P2*S1(m+1,n+1);
                    Br1(m+1,n+1)=rn(n)*(n+1)*g(m+1,n+1)*cmp(m+1)*P2*S1(m+1,n+1);
                    Br2(m+1,n+1)=rn(n)*(n+1)*h(m+1,n+1)*smp(m+1)*P2*S1(m+1,n+1);
                    
                    
                    Bt=Bt+rn(n)*((g(m+1,n+1)*cmp(m+1) + h(m+1,n+1)*smp(m+1)))*dP2 * S1(m+1,n+1);
                    Bt1(m+1,n+1)=rn(n)*g(m+1,n+1)*cmp(m+1)*dP2 * S1(m+1,n+1);
                    Bt2(m+1,n+1)=rn(n)*h(m+1,n+1)*smp(m+1)*dP2 * S1(m+1,n+1);
                    
                    
                    Bp=Bp+rn(n)*(m*(-g(m+1,n+1)*smp(m+1) + h(m+1,n+1)*cmp(m+1)))* P2 * S1(m+1,n+1);
                    Bp1(m+1,n+1)=rn(n)*(m*(-g(m+1,n+1)*smp(m+1)))* P2 * S1(m+1,n+1);
                    Bp2(m+1,n+1)=rn(n)*(m*(h(m+1,n+1)*cmp(m+1)))* P2 * S1(m+1,n+1);
                    
                    
                end
            end
        end
        
    %    B = [Br;-Bt;-Bp/sin(theta)];
        
    Bt1=-Bt1;
    Bt2=-Bt2;
    
    Bp1=-Bp1/sin(theta);
    Bp2=-Bp2/sin(theta);
    
    

        ci=1;
        
        for n=1:nmax
            for m=0:n
                
                if m==0
                    
                    
                    
                    C(bc,ci)=Br1(m+1,n+1);
                    C(bc+1,ci)=Bt1(m+1,n+1);
                    C(bc+2,ci)=Bp1(m+1,n+1);
                    ci=ci+1;
                    
                else
                    C(bc,ci)=Br1(m+1,n+1);
                    C(bc,ci+1)=Br2(m+1,n+1);
                    C(bc+1,ci)=Bt1(m+1,n+1);
                    C(bc+1,ci+1)=Bt2(m+1,n+1);
                    C(bc+2,ci)=Bp1(m+1,n+1);
                    C(bc+2,ci+1)=Bp2(m+1,n+1);
                    ci=ci+2;
                end
            end
            
        end
       
        bc=bc+3;
        bbc=bbc+3;
        
    end
    
  %  c1=['C:\Users\gao\Desktop\f1\C',num2str(cun)]; 
    
   % save(c1,'C')
    
   z1=isnan(C);
   z2=find(z1==1);
   C(z2)=0;
   
   ef=ef+C'* Cdn((cun-1)*cchang*3+1:cun*cchang*3,(cun-1)*cchang*3+1:cun*cchang*3) *C;
   
 %   f1(cun,C);
    
 clear C
    
    
end

%%
a=1

ez=ef^-1;

save ef_jie_mm ef

zz=zeros(nmax*(nmax+2),1);



%%
bbc=1;
for cun=1:cung
    
    cun
    bc=1;
    
    C=zeros(cchang*3,nmax*(nmax+2));
    
    for bge=1+cchang*(cun-1):cchang*cun
        
        %   bc=bge-cchang*(cun-1);
        
        bge;
        
        
        theta=ye(bge);
        phi=Ga(bge);
        r=Gr(bge);
        a=3393.5;
        sz=size(g);
        
        N=sz(1)-1;
        
        st=sin(theta);
        ct=cos(theta);
        
        
        n=1:1:N;
        m=0:1:N;
        rn=(a/r).^(n+2);
        
        cmp=cos(m.*phi);
        smp=sin(m.*phi);
        
        
        %%
        S1= zeros(N+1,N+1);
        for n=1:N
            for m=0:n
                if m>1
                    S1(m+1,n+1) = S1(m,n+1)*((n-m+1)/(n+m))^0.5;
                elseif m==1
                    S1(m+1,n+1) = S1(m,n+1)*(2*(n-m+1)/(n+m))^0.5;
                elseif n==1
                    S1(1,1+n) = 1;
                else
                    S1(1,1+n) = S1(1,n)*(2*n-1)/(n);
                end
            end
        end
        
        
        %%
        
        %P=zeros(N+1,N+1);
        
        %dP=zeros(N+1,N+1);
        
        P11=1; P10=P11;
        dP11=0; dP10=dP11;
        
        Br=0; Bt=0; Bp=0;
        Br1=zeros(N+1,N+1); Bt1=zeros(N+1,N+1); Bp1=zeros(N+1,N+1);
        Br2=zeros(N+1,N+1); Bt2=zeros(N+1,N+1); Bp2=zeros(N+1,N+1);
        
        
        for m=0:N
            
            %   m
            for n=m:N
                
                %   n
                if n==0
                    
                else
                    
                    % Calculate Legendre polynomials and derivatives recursively
                    if n==m
                        P2 = st*P11;
                        dP2 = st*dP11 + ct*P11;
                        P11=P2; P10=P11; P20=0;
                        dP11=dP2; dP10=dP11; dP20=0;
                    elseif n==1
                        P2 = ct*P10;
                        dP2 = ct*dP10 - st*P10;
                        P20=P10; P10=P2;
                        dP20=dP10; dP10=dP2;
                    else
                        K = ((n-1)^2-m^2)/((2*n-1)*(2*n-3));
                        P2 = ct*P10 - K*P20;
                        dP2 = ct*dP10 - st*P10 - K*dP20;
                        P20=P10; P10=P2;
                        dP20=dP10; dP10=dP2;
                    end
                    
                    
                    %        P(m+1,n+1)=P2;
                    %        dP(m+1,n+1)=dP2;
                    
                    Br=Br+rn(n)*(n+1)*((g(m+1,n+1)*cmp(m+1) + h(m+1,n+1)*smp(m+1) ))*P2*S1(m+1,n+1);
                    Br1(m+1,n+1)=rn(n)*(n+1)*g(m+1,n+1)*cmp(m+1)*P2*S1(m+1,n+1);
                    Br2(m+1,n+1)=rn(n)*(n+1)*h(m+1,n+1)*smp(m+1)*P2*S1(m+1,n+1);
                    
                    
                    Bt=Bt+rn(n)*((g(m+1,n+1)*cmp(m+1) + h(m+1,n+1)*smp(m+1)))*dP2 * S1(m+1,n+1);
                    Bt1(m+1,n+1)=rn(n)*g(m+1,n+1)*cmp(m+1)*dP2 * S1(m+1,n+1);
                    Bt2(m+1,n+1)=rn(n)*h(m+1,n+1)*smp(m+1)*dP2 * S1(m+1,n+1);
                    
                    
                    Bp=Bp+rn(n)*(m*(-g(m+1,n+1)*smp(m+1) + h(m+1,n+1)*cmp(m+1)))* P2 * S1(m+1,n+1);
                    Bp1(m+1,n+1)=rn(n)*(m*(-g(m+1,n+1)*smp(m+1)))* P2 * S1(m+1,n+1);
                    Bp2(m+1,n+1)=rn(n)*(m*(h(m+1,n+1)*cmp(m+1)))* P2 * S1(m+1,n+1);
                    
                    
                end
            end
        end
        
    %    B = [Br;-Bt;-Bp/sin(theta)];
        
    Bt1=-Bt1;
    Bt2=-Bt2;
    
    Bp1=-Bp1/sin(theta);
    Bp2=-Bp2/sin(theta);
    
    

        ci=1;
        
        for n=1:nmax
            for m=0:n
                
                if m==0
                    
                    
                    
                    C(bc,ci)=Br1(m+1,n+1);
                    C(bc+1,ci)=Bt1(m+1,n+1);
                    C(bc+2,ci)=Bp1(m+1,n+1);
                    ci=ci+1;
                    
                else
                    C(bc,ci)=Br1(m+1,n+1);
                    C(bc,ci+1)=Br2(m+1,n+1);
                    C(bc+1,ci)=Bt1(m+1,n+1);
                    C(bc+1,ci+1)=Bt2(m+1,n+1);
                    C(bc+2,ci)=Bp1(m+1,n+1);
                    C(bc+2,ci+1)=Bp2(m+1,n+1);
                    ci=ci+2;
                end
            end
            
        end
       
        bc=bc+3;
        bbc=bbc+3;
        
    end
    
   z1=isnan(C);
   z2=find(z1==1);
   C(z2)=0;
   
  zz=zz+ez*C'* Cdn((cun-1)*cchang*3+1:cun*cchang*3,(cun-1)*cchang*3+1:cun*cchang*3)* B((cun-1)*cchang*3+1:cun*cchang*3) ;
   
    
end


 %zz=zz+ez*C'*B(1+(ge-1)*3:ge*3);

%save z1 zz
%%
xs=zz;
nj=nmax+1;
g=zeros(nj,nj);
h=zeros(nj,nj);
gg=1;
for i=1:nj-1
    for j=0:i
       
        if j==0
            
        g(j+1,i+1)=xs(gg);
       gg=gg+1; 
      else
        g(j+1,i+1)=xs(gg);
        h(j+1,i+1)=xs(gg+1);
          gg=gg+2;       
        end
      
    end
    
end

save g_110_mm_jie1 g
save h_110_mm_jie1 h



%}
