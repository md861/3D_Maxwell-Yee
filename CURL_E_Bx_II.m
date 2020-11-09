%Function to compute curl of E and update Bx
function[Bx2]=CURL_E_Bx_II(c,noe,Bx1,Ez1,Ey1)
[BxII]=OCTANT_II_Bx(c,noe,Bx1,Ez1,Ey1);
Bx2=BxII;
end