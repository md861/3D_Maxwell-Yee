%Function to compute curl of E and update Bx
function[Ez2]=CURL_B_Ez_IV(c,noe,Ez1,By2,Bx2)
[EzVI]=OCTANT_VI_Ez(c,noe,Ez1,By2,Bx2);
Ez2=EzVI;
end