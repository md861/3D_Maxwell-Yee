%Function to compute curl of E and update Bx
function[Ez2]=CURL_B_Ez_I(c,noe,Ez1,By2,Bx2)
[EzVII]=OCTANT_VII_Ez(c,noe,Ez1,By2,Bx2);
Ez2=EzVII;
end