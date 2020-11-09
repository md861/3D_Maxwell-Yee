%Function to compute curl of E and update Bx
function[Ez2]=CURL_B_Ez_VII(c,noe,Ez1,By2,Bx2)
[EzI]=OCTANT_I_Ez(c,noe,Ez1,By2,Bx2);
Ez2=EzI;
end