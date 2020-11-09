%Function to compute Bx by OCTANT I SHIFT method
function[BzV]=OCTANT_V_Bz(c,noe,Bz1,Ey1,Ex1)
%Define matrices to hold values of derivatives at every point
D_Ey=zeros(noe,noe,noe);
D_Ex=zeros(noe,noe,noe);
    %Calculate d/dx(Ey)
    for u=2:noe-1
        for v=2:noe-1
            for w=2:noe-1
                i=u;
                j=v;
                k=w-1;
                D_Ey1=Ey1(i+1,j,k)-Ey1(i,j,k);
                D_Ey2=Ey1(i+1,j+1,k)-Ey1(i,j+1,k);
                D_Ey3=Ey1(i+1,j,k+1)-Ey1(i,j,k+1);
                D_Ey4=Ey1(i+1,j+1,k+1)-Ey1(i,j+1,k+1);
                D_Ey(u,v,w)=(1/4)*(D_Ey1+D_Ey2+D_Ey3+D_Ey4);
            end
        end
    end
    %Calculate d/dy(Ex)
    for u=2:noe-1
        for v=2:noe-1
            for w=2:noe-1
                i=u;
                j=v;
                k=w-1;
                D_Ex1=Ex1(i,j+1,k)-Ex1(i,j,k);
                D_Ex2=Ex1(i+1,j+1,k)-Ex1(i+1,j,k);
                D_Ex3=Ex1(i,j+1,k+1)-Ex1(i,j,k+1);
                D_Ex4=Ex1(i+1,j+1,k+1)-Ex1(i+1,j,k+1);
                D_Ex(u,v,w)=(1/4)*(D_Ex1+D_Ex2+D_Ex3+D_Ex4);
            end
        end
    end
%Calculate Bx
BzV=Bz1-(c)*(D_Ey-D_Ex);
end