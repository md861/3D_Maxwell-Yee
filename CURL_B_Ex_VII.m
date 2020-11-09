%Function to compute curl of E and update Bx
function[Ex2]=CURL_B_Ex_VII(c,noe,Ex1,Bz2,By2)
[ExI]=OCTANT_I_Ex(c,noe,Ex1,Bz2,By2);
Ex2=ExI;
end