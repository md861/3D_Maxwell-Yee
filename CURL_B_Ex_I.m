%Function to compute curl of E and update Bx
function[Ex2]=CURL_B_Ex_I(c,noe,Ex1,Bz2,By2)
[ExVII]=OCTANT_VII_Ex(c,noe,Ex1,Bz2,By2);
Ex2=ExVII;
end