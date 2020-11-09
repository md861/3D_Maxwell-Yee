%Function to compute curl of E and update Bx
function[Ex2]=CURL_B_Ex_VIII(c,noe,Ex1,Bz2,By2)
[ExII]=OCTANT_II_Ex(c,noe,Ex1,Bz2,By2);
Ex2=ExII;
end