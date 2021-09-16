function [ bpc_xyz ] = gao( pc_xyz )
%G90 Martian crustal field model in PC_cartesian coordinate 
nmax=150;     

%load hc.mat
%load gc.mat
%g=gc;
%h=hc;
load g_90_mm_q.mat
load h_90_mm_q.mat

%load spherical harmonic coefficients
%rplanet= Mars radiu;
rplanet=3393.5;


sz=size(pc_xyz);
num=sz(2);  %select SH degree
if nmax~=150;
    g=g(1:nmax+1,1:nmax+1);
    h=h(1:nmax+1,1:nmax+1);
end
[pcp, pct, pcr]=cart2sph(pc_xyz(1,:),pc_xyz(2,:),pc_xyz(3,:));
pct=pi/2-pct;
% change cartesian coordinates to planetocentric local spherical coordinates
bpcsph=zeros(num,3);
parfor i=1:num
 bpcsph(i,:)=sph_r(g,h,rplanet,pcr(i),pct(i),pcp(i));
    %calculate SH model
end

bpc_xyz=datas2c(bpcsph(:,1),bpcsph(:,2),bpcsph(:,3),pct,pcp);
%bakc to PC_cartesian coordinate 
%bt=(bpc_xyz(1,:).^2+bpc_xyz(2,:).^2+bpc_xyz(3,:).^2).^0.5;

end

