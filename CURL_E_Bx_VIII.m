%Function to compute curl of E and update Bx
function[Bx2]=CURL_E_Bx_VIII(c,noe,Bx1,Ez1,Ey1)
[BxVIII]=OCTANT_VIII_Bx(c,noe,Bx1,Ez1,Ey1);
Bx2=BxVIII;
end