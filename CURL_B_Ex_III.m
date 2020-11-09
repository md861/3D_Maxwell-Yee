%Function to compute curl of E and update Bx
function[Ex2]=CURL_B_Ex_III(c,noe,Ex1,Bz2,By2)
[ExV]=OCTANT_V_Ex(c,noe,Ex1,Bz2,By2);
Ex2=ExV;
end