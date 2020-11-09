%Function to compute curl of E and update Bx
function[Ex2]=CURL_B_Ex_V(c,noe,Ex1,Bz2,By2)
[ExIII]=OCTANT_III_Ex(c,noe,Ex1,Bz2,By2);
Ex2=ExIII;
end