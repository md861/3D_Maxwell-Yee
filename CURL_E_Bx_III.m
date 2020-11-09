%Function to compute curl of E and update Bx
function[Bx2]=CURL_E_Bx_III(c,noe,Bx1,Ez1,Ey1)
[BxIII]=OCTANT_III_Bx(c,noe,Bx1,Ez1,Ey1);
Bx2=BxIII;
end