%Function to compute curl of E and update Bx
function[Bz2]=CURL_E_Bz_VII(c,noe,Bz1,Ey1,Ex1)
[BzVII]=OCTANT_VII_Bz(c,noe,Bz1,Ey1,Ex1);
Bz2=BzVII;
end