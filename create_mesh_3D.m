%Function to create a 3D mesh of finite distances based on parameters given by
%the user.
%length(=1)         %length of space
%nofe(=5)           %number of finite elements
%c(=10)              %spedd of light in vaccumm


function [x,y,z,dx,dy,dz,dt,c2,noe,STATE,X,Y,Z]=create_mesh_3D(length,nofe,c)
%Define elementary space and time
nofe=nofe+1;
dx=length/nofe;
dy=dx;
dz=dx;
dt=dx/c;
c2=c*c;
%Define Euclidean 2D space co-ordinates
X=-length:dx:length;
Y=X;
Z=X;
X=X';
Y=Y';
Z=Z';
noe=size(X);
noe=noe(1);
[y,x,z]=meshgrid(X,Y,Z);                            %TO fix the index problem
STATE=[min(X) max(X) min(Y) max(Y) min(Z) max(Z)];  %To fix the axis points
end