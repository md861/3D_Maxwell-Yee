%Function to compute curl of E and update Bx
function[By2]=CURL_E_By_I(c,noe,By1,Ex1,Ez1)
[ByI]=OCTANT_I_By(c,noe,By1,Ex1,Ez1);
By2=ByI;
end