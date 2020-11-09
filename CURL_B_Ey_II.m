%Function to compute curl of E and update Bx
function[Ey2]=CURL_B_Ey_II(c,noe,Ey1,Bx2,Bz2)
[EyVIII]=OCTANT_VIII_Ey(c,noe,Ey1,Bx2,Bz2);
Ey2=EyVIII;
end