%Function to compute Ez by OCTANT I SHIFT method
function[EzVI]=OCTANT_VI_Ez(c,noe,Ez1,By2,Bx2)
%Define matrices to hold values of derivatives at every point
D_By=zeros(noe,noe,noe);
D_Bx=zeros(noe,noe,noe);
    %Calculate d/dx(By)
    for u=2:noe-1
        for v=2:noe-1
            for w=2:noe-1
                i=u-1;
                j=v;
                k=w-1;
                D_By1=By2(i+1,j,k)-By2(i,j,k);
                D_By2=By2(i+1,j+1,k)-By2(i,j+1,k);
                D_By3=By2(i+1,j,k+1)-By2(i,j,k+1);
                D_By4=By2(i+1,j+1,k+1)-By2(i,j+1,k+1);
                D_By(u,v,w)=(1/4)*(D_By1+D_By2+D_By3+D_By4);
            end
        end
    end
    %Calculate d/dy(Bx)
    for u=2:noe-1
        for v=2:noe-1
            for w=2:noe-1
                i=u-1;
                j=v;
                k=w-1;
                D_Bx1=Bx2(i,j+1,k)-Bx2(i,j,k);
                D_Bx2=Bx2(i+1,j+1,k)-Bx2(i+1,j,k);
                D_Bx3=Bx2(i,j+1,k+1)-Bx2(i,j,k+1);
                D_Bx4=Bx2(i+1,j+1,k+1)-Bx2(i+1,j,k+1);
                D_Bx(u,v,w)=(1/4)*(D_Bx1+D_Bx2+D_Bx3+D_Bx4);
            end
        end
    end
%Calculate Ez
EzVI=Ez1+(c)*(D_By-D_Bx);
end