%Function to compute curl of E and update Bx
function[Ey2]=CURL_B_Ey_VIII(c,noe,Ey1,Bx2,Bz2)
[EyII]=OCTANT_II_Ey(c,noe,Ey1,Bx2,Bz2);
Ey2=EyII;
end