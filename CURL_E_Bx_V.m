%Function to compute curl of E and update Bx
function[Bx2]=CURL_E_Bx_V(c,noe,Bx1,Ez1,Ey1)
[BxV]=OCTANT_V_Bx(c,noe,Bx1,Ez1,Ey1);
Bx2=BxV;
end