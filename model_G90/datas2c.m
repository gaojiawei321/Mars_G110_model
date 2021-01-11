function [ N ] = datas2c( rdat,tdat,pdat,tposn,pposn )
%datas2c Transform spherical coordinate data to cartesian coordinate data 
%input:rdat tdat pdat 
% tposn  pposn     theta  and phi is the angle in arc radians
%output N=[Bx,By,Bz]
cp=cos(pposn);
sp=sin(pposn);
ct=cos(tposn);
st=sin(tposn);
%Transformation matrix
%  st*cp    ct*cp    -sp 
%  st*sp    ct*sp     cp  ;
%   ct       -st      0 
N=[(st.*cp.*rdat'+ct.*cp.*tdat'-sp.*pdat');
    (st.*sp.*rdat'+ct.*sp.*tdat'+cp.*pdat');
    (ct.*rdat'-st.*tdat')];
end

