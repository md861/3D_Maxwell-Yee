%Function to compute curl of E and update Bx
function[Ez2]=CURL_B_Ez_VIII(c,noe,Ez1,By2,Bx2)
[EzII]=OCTANT_II_Ez(c,noe,Ez1,By2,Bx2);
Ez2=EzII;
end