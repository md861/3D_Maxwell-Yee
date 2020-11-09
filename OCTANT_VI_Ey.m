%Function to compute Ey by OCTANT I SHIFT method
function[EyVI]=OCTANT_VI_Ey(c,noe,Ey1,Bx2,Bz2)
%Define matrices to hold values of derivatives at every point
D_Bx=zeros(noe,noe,noe);
D_Bz=zeros(noe,noe,noe);
    %Calculate d/dz(Bx)
    for u=2:noe-1
        for v=2:noe-1
            for w=2:noe-1
                i=u-1;
                j=v;
                k=w-1;
                D_Bx1=Bx2(i,j,k+1)-Bx2(i,j,k);
                D_Bx2=Bx2(i+1,j,k+1)-Bx2(i+1,j,k);
                D_Bx3=Bx2(i,j+1,k+1)-Bx2(i,j+1,k);
                D_Bx4=Bx2(i+1,j+1,k+1)-Bx2(i+1,j+1,k);
                D_Bx(u,v,w)=(1/4)*(D_Bx1+D_Bx2+D_Bx3+D_Bx4);
            end
        end
    end
    %Calculate d/dx(Bz)
    for u=2:noe-1
        for v=2:noe-1
            for w=2:noe-1
                i=u-1;
                j=v;
                k=w-1;
                D_Bz1=Bz2(i+1,j,k)-Bz2(i,j,k);
                D_Bz2=Bz2(i+1,j+1,k)-Bz2(i,j+1,k);
                D_Bz3=Bz2(i+1,j,k+1)-Bz2(i,j,k+1);
                D_Bz4=Bz2(i+1,j+1,k+1)-Bz2(i,j+1,k+1);
                D_Bz(u,v,w)=(1/4)*(D_Bz1+D_Bz2+D_Bz3+D_Bz4);
            end
        end
    end
%Calculate Ex
EyVI=Ey1+(c)*(D_Bx-D_Bz);
end