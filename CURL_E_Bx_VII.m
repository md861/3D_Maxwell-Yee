%Function to compute curl of E and update Bx
function[Bx2]=CURL_E_Bx_VII(c,noe,Bx1,Ez1,Ey1)
[BxVII]=OCTANT_VII_Bx(c,noe,Bx1,Ez1,Ey1);
Bx2=BxVII;
end