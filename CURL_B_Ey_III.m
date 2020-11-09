%Function to compute curl of E and update Bx
function[Ey2]=CURL_B_Ey_III(c,noe,Ey1,Bx2,Bz2)
[EyV]=OCTANT_V_Ey(c,noe,Ey1,Bx2,Bz2);
Ey2=EyV;
end