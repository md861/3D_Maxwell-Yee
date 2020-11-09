%Function to compute curl of E and update Bx
function[Ex2]=CURL_B_Ex_VI(c,noe,Ex1,Bz2,By2)
[ExIV]=OCTANT_IV_Ex(c,noe,Ex1,Bz2,By2);
Ex2=ExIV;
end