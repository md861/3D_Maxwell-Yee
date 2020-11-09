%Function to compute curl of E and update Bx
function[Ez2]=CURL_B_Ez_VI(c,noe,Ez1,By2,Bx2)
[EzIV]=OCTANT_IV_Ez(c,noe,Ez1,By2,Bx2);
Ez2=EzIV;
end