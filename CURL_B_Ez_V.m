%Function to compute curl of E and update Bx
function[Ez2]=CURL_B_Ez_V(c,noe,Ez1,By2,Bx2)
[EzIII]=OCTANT_III_Ez(c,noe,Ez1,By2,Bx2);
Ez2=EzIII;
end