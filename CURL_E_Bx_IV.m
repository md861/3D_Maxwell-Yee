%Function to compute curl of E and update Bx
function[Bx2]=CURL_E_Bx_IV(c,noe,Bx1,Ez1,Ey1)
[BxIV]=OCTANT_IV_Bx(c,noe,Bx1,Ez1,Ey1);
Bx2=BxIV;
end