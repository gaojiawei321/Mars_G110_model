function [  bpcsph ] = gao_r( pc_xyz )
%G90 Martian crustal field model in PC_spherical  coordinate 
nmax=150;     

%load hc.mat
%load gc.mat
%g=gc;
%h=hc;
%load h_ceshi.mat
%load g_ceshi.mat
load g_90_mm_jial.mat
load h_90_mm_jial.mat

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

%bakc to PC_spherical coordinate 

bpcsph=bpcsph';

end

