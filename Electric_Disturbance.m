%Function to give the time and cordinate of disturbance along with its
%magnitude.
function[xd,yd,zd,td,Exd,Eyd,Ezd]=Electric_Disturbance(x,y,z,nofe,STATE,iterations,noe,disturbance_time,A,w,draw_disturbance,scale,rotate,az_user,el_user)
        %Define time to calculate sinusoidal function and calculate sine
        %values at different time instants
time=linspace(0,3,iterations);
sz=A*sin(w*time);
sy=A*sin(w*(time+0.5));
sx=A*sin(w*(time+0.2));
        %Generate a random value of index for x where the disturbance will
        %start at time given by disturbance_time
xp=nofe+2;%randperm(noe-2);
yp=xp;%randperm(noe-2);
zp=xp;%randperm(noe-2);
xd=1+xp(1);
yd=1+yp(1);
zd=1+zp(1);
        %The time at which disturbance starts is given by the user
td=disturbance_time;
        %Define matrix to store disturbance values at all values of x and
        %time.
Exd=zeros(noe,noe,noe,iterations);
Eyd=zeros(noe,noe,noe,iterations);
Ezd=zeros(noe,noe,noe,iterations);
        %Generate disturbance only for those time instants which are
        %greater than and equal to time of start of disturbance, i.e,
        %disturbance_time
for ti=td:iterations     %ti is the index for time
    Exd(xd,yd,:,ti)=0;%sx(ti);
    Eyd(xd,yd,:,ti)=0;%sy(ti);
    Ezd(xd,yd,:,ti)=sz(ti);
end
        %Plot the disturbance (optional)
        %STATE_E=[-A A -A A -A A];
if (draw_disturbance==1)    
    for n=0:iterations-1
        m=n+1;
        Ex=Exd(:,:,:,m);
        Ey=Eyd(:,:,:,m);
        Ez=Ezd(:,:,:,m);
        quiver3(x,y,z,Ex,Ey,Ez,scale)
        xlabel('Exd');
        ylabel('Eyd');
        zlabel('Ezd');
        axis tight
        axis(STATE);
        az=n/2;
        if(rotate==1)
            view(az,37);
        else
            view(az_user,el_user)
        end
        drawnow;
        %pause;
    end
end