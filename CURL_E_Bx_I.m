%Function to compute curl of E and update Bx
function[Bx2]=CURL_E_Bx_I(c,noe,Bx1,Ez1,Ey1)
[BxI]=OCTANT_I_Bx(c,noe,Bx1,Ez1,Ey1);
Bx2=BxI;
end