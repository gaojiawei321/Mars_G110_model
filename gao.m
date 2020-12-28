function [ bpc_xyz ] = gao( pc_xyz )
%CAIN �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
nmax=150;     
%��гչ���Ľ�����������Ĭ��Ϊ90�������޸ĵĸ�С��

%load hc.mat
%load gc.mat
%g=gc;
%h=hc;
load g_90_mm_jial.mat
load h_90_mm_jial.mat

%������гϵ��
%rplanet=2;
rplanet=3393.5;


sz=size(pc_xyz);
num=sz(2);  %������ݸ���?
if nmax~=150;
    g=g(1:nmax+1,1:nmax+1);
    h=h(1:nmax+1,1:nmax+1);
end
[pcp, pct, pcr]=cart2sph(pc_xyz(1,:),pc_xyz(2,:),pc_xyz(3,:));
pct=pi/2-pct; %��pc�ѿ�������ϵ�µ�λ��ת����������ϵ�µ�λ�ã�lon/lat/r��
% (���Ƚǣ���γ�Ƚǣ�����)��
bpcsph=zeros(num,3);
parfor i=1:num
 bpcsph(i,:)=sph_r(g,h,rplanet,pcr(i),pct(i),pcp(i));
    
end

bpc_xyz=datas2c(bpcsph(:,1),bpcsph(:,2),bpcsph(:,3),pct,pcp);
%�������������ϵ��ת��Ϊֱ������ϵ�¡�?
%bt=(bpc_xyz(1,:).^2+bpc_xyz(2,:).^2+bpc_xyz(3,:).^2).^0.5;

end

