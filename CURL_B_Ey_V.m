%Function to compute curl of E and update Bx
function[Ey2]=CURL_B_Ey_V(c,noe,Ey1,Bx2,Bz2)
[EyIII]=OCTANT_III_Ey(c,noe,Ey1,Bx2,Bz2);
Ey2=EyIII;
end