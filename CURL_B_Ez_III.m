%Function to compute curl of E and update Bx
function[Ez2]=CURL_B_Ez_III(c,noe,Ez1,By2,Bx2)
[EzV]=OCTANT_V_Ez(c,noe,Ez1,By2,Bx2);
Ez2=EzV;
end