%Function to compute curl of E and update Bx
function[Bz2]=CURL_E_Bz_VIII(c,noe,Bz1,Ey1,Ex1)
[BzVIII]=OCTANT_VIII_Bz(c,noe,Bz1,Ey1,Ex1);
Bz2=BzVIII;
end