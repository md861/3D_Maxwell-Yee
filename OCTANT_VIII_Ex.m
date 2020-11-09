%Function to compute Ex by OCTANT I SHIFT method
function[ExVIII]=OCTANT_VIII_Ex(c,noe,Ex1,Bz2,By2)
%Define matrices to hold values of derivatives at every point
D_Bz=zeros(noe,noe,noe);
D_By=zeros(noe,noe,noe);
    %Calculate d/dy(Bz)
    for u=2:noe-1
        for v=2:noe-1
            for w=2:noe-1
                i=u;
                j=v-1;
                k=w-1;
                D_Bz1=Bz2(i,j+1,k)-Bz2(i,j,k);
                D_Bz2=Bz2(i+1,j+1,k)-Bz2(i+1,j,k);
                D_Bz3=Bz2(i,j+1,k+1)-Bz2(i,j,k+1);
                D_Bz4=Bz2(i+1,j+1,k+1)-Bz2(i+1,j,k+1);
                D_Bz(u,v,w)=(1/4)*(D_Bz1+D_Bz2+D_Bz3+D_Bz4);
            end
        end
    end
    %Calculate d/dz(By)
    for u=2:noe-1
        for v=2:noe-1
            for w=2:noe-1
                i=u;
                j=v-1;
                k=w-1;
                D_By1=By2(i,j,k+1)-By2(i,j,k);
                D_By2=By2(i+1,j,k+1)-By2(i+1,j,k);
                D_By3=By2(i,j+1,k+1)-By2(i,j+1,k);
                D_By4=By2(i+1,j+1,k+1)-By2(i+1,j+1,k);
                D_By(u,v,w)=(1/4)*(D_By1+D_By2+D_By3+D_By4);
            end
        end
    end
%Calculate Ex
ExVIII=Ex1+(c)*(D_Bz-D_By);
end