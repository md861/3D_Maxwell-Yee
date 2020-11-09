%Function to compute Bx by OCTANT I SHIFT method
function[ByV]=OCTANT_V_By(c,noe,By1,Ex1,Ez1)
%Define matrices to hold values of derivatives at every point
D_Ex=zeros(noe,noe,noe);
D_Ez=zeros(noe,noe,noe);
    %Calculate d/dz(Ex)
    for u=2:noe-1
        for v=2:noe-1
            for w=2:noe-1
                i=u;
                j=v;
                k=w-1;
                D_Ex1=Ex1(i,j,k+1)-Ex1(i,j,k);
                D_Ex2=Ex1(i+1,j,k+1)-Ex1(i+1,j,k);
                D_Ex3=Ex1(i,j+1,k+1)-Ex1(i,j+1,k);
                D_Ex4=Ex1(i+1,j+1,k+1)-Ex1(i+1,j+1,k);
                D_Ex(u,v,w)=(1/4)*(D_Ex1+D_Ex2+D_Ex3+D_Ex4);
            end
        end
    end
    %Calculate d/dx(Ez)
    for u=2:noe-1
        for v=2:noe-1
            for w=2:noe-1
                i=u;
                j=v;
                k=w-1;
                D_Ez1=Ez1(i+1,j,k)-Ez1(i,j,k);
                D_Ez2=Ez1(i+1,j+1,k)-Ez1(i,j+1,k);
                D_Ez3=Ez1(i+1,j,k+1)-Ez1(i,j,k+1);
                D_Ez4=Ez1(i+1,j+1,k+1)-Ez1(i,j+1,k+1);
                D_Ez(u,v,w)=(1/4)*(D_Ez1+D_Ez2+D_Ez3+D_Ez4);
            end
        end
    end
%Calculate Bx
ByV=By1-(c)*(D_Ex-D_Ez);
end