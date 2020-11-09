%Function to compute curl of E and update Bx
function[Ey2]=CURL_B_Ey_VI(c,noe,Ey1,Bx2,Bz2)
[EyIV]=OCTANT_IV_Ey(c,noe,Ey1,Bx2,Bz2);
Ey2=EyIV;
end