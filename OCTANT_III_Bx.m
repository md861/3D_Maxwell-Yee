%Function to compute Bx by OCTANT I SHIFT method
function[BxIII]=OCTANT_III_Bx(c,noe,Bx1,Ez1,Ey1)
%Define matrices to hold values of derivatives at every point
D_Ez=zeros(noe,noe,noe);
D_Ey=zeros(noe,noe,noe);
    %Calculate d/dy(Ez)
    for u=2:noe-1
        for v=2:noe-1
            for w=2:noe-1
                i=u-1;
                j=v-1;
                k=w;
                D_Ez1=Ez1(i,j+1,k)-Ez1(i,j,k);
                D_Ez2=Ez1(i+1,j+1,k)-Ez1(i+1,j,k);
                D_Ez3=Ez1(i,j+1,k+1)-Ez1(i,j,k+1);
                D_Ez4=Ez1(i+1,j+1,k+1)-Ez1(i+1,j,k+1);
                D_Ez(u,v,w)=(1/4)*(D_Ez1+D_Ez2+D_Ez3+D_Ez4);
            end
        end
    end
    %Calculate d/dz(Ey)
    for u=2:noe-1
        for v=2:noe-1
            for w=2:noe-1
                i=u-1;
                j=v-1;
                k=w;
                D_Ey1=Ey1(i,j,k+1)-Ey1(i,j,k);
                D_Ey2=Ey1(i+1,j,k+1)-Ey1(i+1,j,k);
                D_Ey3=Ey1(i,j+1,k+1)-Ey1(i,j+1,k);
                D_Ey4=Ey1(i+1,j+1,k+1)-Ey1(i+1,j+1,k);
                D_Ey(u,v,w)=(1/4)*(D_Ey1+D_Ey2+D_Ey3+D_Ey4);
            end
        end
    end
%Calculate Bx
BxIII=Bx1-(c)*(D_Ez-D_Ey);
end