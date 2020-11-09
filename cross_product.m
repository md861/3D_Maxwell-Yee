%Function to calculate the cross product of Electric and Magnetic fields
function [Tx,Ty,Tz]=cross_product(Ex,Ey,Ez,Bx,By,Bz,noe,iterations)
Tx=zeros(noe(1),noe(1),noe(1),(iterations+1));
Ty=zeros(noe(1),noe(1),noe(1),(iterations+1));
Tz=zeros(noe(1),noe(1),noe(1),(iterations+1));
for n=1:iterations
    for i=1:noe(1)
    for j=1:noe(1)
        for k=1:noe(1)
            Tx(i,j,k,n)=(Ey(i,j,k,n))*(Bz(i,j,k,n))-(By(i,j,k,n))*(Ez(i,j,k,n));
            Ty(i,j,k,n)=(Ez(i,j,k,n))*(Bx(i,j,k,n))-(Bz(i,j,k,n))*(Ex(i,j,k,n));
            Tz(i,j,k,n)=(Ex(i,j,k,n))*(By(i,j,k,n))-(Bx(i,j,k,n))*(Ey(i,j,k,n));
        end
    end
end
end