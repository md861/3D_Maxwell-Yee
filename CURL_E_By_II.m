%Function to compute curl of E and update Bx
function[By2]=CURL_E_By_II(c,noe,By1,Ex1,Ez1)
[ByII]=OCTANT_II_By(c,noe,By1,Ex1,Ez1);
By2=ByII;
end