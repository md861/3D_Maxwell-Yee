%Function to compute curl of E and update Bx
function[Ex2]=CURL_B_Ex_IV(c,noe,Ex1,Bz2,By2)
[ExVI]=OCTANT_VI_Ex(c,noe,Ex1,Bz2,By2);
Ex2=ExVI;
end