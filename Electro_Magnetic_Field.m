function[Ex,Ey,Ez,Bx,By,Bz,x,y,z,dx,dt,iterations,c2,az,noe,Tx,Ty,Tz]=Electro_Magnetic_Field(length,nofe,c,totaltime,disturbance_time,A,w,draw_disturbance,Plot_or_not,scale,rotate,az_user,el_user,Pause_or_not)
%cALCULATE FIELDS FOR ALL SHIFTS
[ExI,EyI,EzI,BxI,ByI,BzI,x,y,z,dx,dt,iterations,c2,noe]=Electro_Magnetic_Field_I(length,nofe,c,totaltime,disturbance_time,A,w,draw_disturbance,0,scale,rotate,az_user,el_user,Pause_or_not);
[ExII,EyII,EzII,BxII,ByII,BzII]=Electro_Magnetic_Field_II(length,nofe,c,totaltime,disturbance_time,A,w,0,0,scale,rotate,az_user,el_user,Pause_or_not);
[ExIII,EyIII,EzIII,BxIII,ByIII,BzIII]=Electro_Magnetic_Field_III(length,nofe,c,totaltime,disturbance_time,A,w,0,0,scale,rotate,az_user,el_user,Pause_or_not);
[ExIV,EyIV,EzIV,BxIV,ByIV,BzIV]=Electro_Magnetic_Field_IV(length,nofe,c,totaltime,disturbance_time,A,w,0,0,scale,rotate,az_user,el_user,Pause_or_not);
[ExV,EyV,EzV,BxV,ByV,BzV]=Electro_Magnetic_Field_V(length,nofe,c,totaltime,disturbance_time,A,w,0,0,scale,rotate,az_user,el_user,Pause_or_not);
[ExVI,EyVI,EzVI,BxVI,ByVI,BzVI]=Electro_Magnetic_Field_VI(length,nofe,c,totaltime,disturbance_time,A,w,0,0,scale,rotate,az_user,el_user,Pause_or_not);
[ExVII,EyVII,EzVII,BxVII,ByVII,BzVII]=Electro_Magnetic_Field_VII(length,nofe,c,totaltime,disturbance_time,A,w,0,0,scale,rotate,az_user,el_user,Pause_or_not);
[ExVIII,EyVIII,EzVIII,BxVIII,ByVIII,BzVIII]=Electro_Magnetic_Field_VIII(length,nofe,c,totaltime,disturbance_time,A,w,0,0,scale,rotate,az_user,el_user,Pause_or_not);
%TAKE AVERAGE
Ex=(1/8)*(ExI+ExII+ExIII+ExIV+ExV+ExVI+ExVII+ExVIII);
Ey=(1/8)*(EyI+EyII+EyIII+EyIV+EyV+EyVI+EyVII+EyVIII);
Ez=(1/8)*(EzI+EzII+EzIII+EzIV+EzV+EzVI+EzVII+EzVIII);
Bx=(1/8)*(BxI+BxII+BxIII+BxIV+BxV+BxVI+BxVII+BxVIII);
By=(1/8)*(ByI+ByII+ByIII+ByIV+ByV+ByVI+ByVII+ByVIII);
Bz=(1/8)*(BzI+BzII+BzIII+BzIV+BzV+BzVI+BzVII+BzVIII);
%CALCULATE POYNTING VECTOR
[Tx,Ty,Tz]=cross_product(Ex,Ey,Ez,Bx,By,Bz,noe,iterations);
%Plot (optional)
%Plots 
vB = VideoWriter('BField.avi');
vE = VideoWriter('EField.avi');
vP = VideoWriter('PVec.avi');
open(vB);
open(vE);
open(vP);
pause;
STATE_E=[-A A -A A -A A];
if(Plot_or_not==1)
     %ELECTRIC FIELD
    for n=1:iterations
        u=Ex(:,:,:,n);
        v=Ey(:,:,:,n);
        w=Ez(:,:,:,n);
        quiver3(x,y,z,u,v,w,scale);
        axis(STATE_E);
        axis tight;
        xlabel('Ex');
        ylabel('Ey');
        zlabel('Ez');
        title('3D Electric fields');
        az=n/2;
        if(rotate==1)
            view(az,el_user);
        else
            view(az_user,el_user)
        end
        frameE = getframe(gcf);
        writeVideo(vE,frameE);
        drawnow;
        if(Pause_or_not==1)
            pause;
        end
    end
    close(vE);
    %MAGNETIC FIELD
    for n=1:iterations
        u=Bx(:,:,:,n);
        v=By(:,:,:,n);
        w=Bz(:,:,:,n);
        quiver3(x,y,z,u,v,w,scale);
        xlabel('Bx');
        ylabel('By');
        zlabel('Bz');
        title('3D Magnetic fields');
        az=n/2;
        if(rotate==1)
            view(az,el_user);
        else
            view(az_user,el_user)
        end
        frameB = getframe(gcf);
        writeVideo(vB,frameB);
        drawnow;
        if(Pause_or_not==1)
            pause;
        end
    end
    close(vB);
    %Poynting vector
    for n=1:iterations
        u=Tx(:,:,:,n);
        v=Ty(:,:,:,n);
        w=Tz(:,:,:,n);
        quiver3(x,y,z,u,v,w,scale);
        xlabel('Tx');
        ylabel('Ty');
        zlabel('Tz');
        title('3D Pointing vectors');
        az=n/2;
        if(rotate==1)
            view(az,el_user);
        else
            view(az_user,el_user)
        end
        frameP = getframe(gcf);
        writeVideo(vP,frameP);
        drawnow;
        if(Pause_or_not==1)
            pause;
        end
    end
    close(vP);
end