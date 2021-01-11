function [B]=sph_r(g,h,rplanet,scr, sct, scp)
%SPH_R Summary of this function goes here
%    calculate magnetic field in igrf form.

theta=sct;
phi=scp;
r=scr;
a=rplanet;
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
%{
S = zeros(N,N+1);
for n=1:N
    for m=0:n
        if m>1
            S(n,m+1) = S(n,m)*((n-m+1)/(n+m))^0.5;
        elseif m>0
            S(n,m+1) = S(n,m)*(2*(n-m+1)/(n+m))^0.5;
        elseif n==1
            S(n,1) = 1;
        else
            S(n,1) = S(n-1,1)*(2*n-1)/(n);
        end
    end
end

S1(2:N+1,:)=S;
S1=S1';

%}
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
   
            
            Bt=Bt+rn(n)*((g(m+1,n+1)*cmp(m+1) + h(m+1,n+1)*smp(m+1)))*dP2 * S1(m+1,n+1);
       
            
            Bp=Bp+rn(n)*(m*(-g(m+1,n+1)*smp(m+1) + h(m+1,n+1)*cmp(m+1)))* P2 * S1(m+1,n+1);
       
            
        end
    end
end

B = [Br;-Bt;-Bp/sin(theta)];

%P=P.*S1;
%dP1=dP.*S1;

%for n=1:N
%    for m=0:N
        
%        X(m+1,n+1)=(a/r)^(n+2)*(n+1)*((g(m+1,n+1)*cos(m*phi) + h(m+1,n+1)*sin(m*phi)));
   
%    end
%end

%Br1=X.*P;

%B=sum(sum(Br1));



end

