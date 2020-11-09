%Function to compute curl of E and update Bx
function[Bx2]=CURL_E_Bx_VI(c,noe,Bx1,Ez1,Ey1)
[BxVI]=OCTANT_VI_Bx(c,noe,Bx1,Ez1,Ey1);
Bx2=BxVI;
end