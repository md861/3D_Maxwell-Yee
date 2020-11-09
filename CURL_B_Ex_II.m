%Function to compute curl of E and update Bx
function[Ex2]=CURL_B_Ex_II(c,noe,Ex1,Bz2,By2)
[ExVIII]=OCTANT_VIII_Ex(c,noe,Ex1,Bz2,By2);
Ex2=ExVIII;
end