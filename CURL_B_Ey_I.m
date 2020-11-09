%Function to compute curl of E and update Bx
function[Ey2]=CURL_B_Ey_I(c,noe,Ey1,Bx2,Bz2)
[EyVII]=OCTANT_VII_Ey(c,noe,Ey1,Bx2,Bz2);
Ey2=EyVII;
end