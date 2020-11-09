%Function to compute curl of E and update Bx
function[Ey2]=CURL_B_Ey_VII(c,noe,Ey1,Bx2,Bz2)
[EyI]=OCTANT_I_Ey(c,noe,Ey1,Bx2,Bz2);
Ey2=EyI;
end