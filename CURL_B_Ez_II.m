%Function to compute curl of E and update Bx
function[Ez2]=CURL_B_Ez_II(c,noe,Ez1,By2,Bx2)
[EzVIII]=OCTANT_VIII_Ez(c,noe,Ez1,By2,Bx2);
Ez2=EzVIII;
end