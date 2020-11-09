%Function to give Electric and Magnetic fields
function[Ex,Ey,Ez,Bx,By,Bz,x,y,z,dx,dt,iterations,c2,noe,Tx,Ty,Tz]=Electro_Magnetic_Field_III(length,nofe,c,totaltime,disturbance_time,A,w,draw_disturbance,Plot_or_not,scale,rotate,az_user,el_user,Pause_or_not)
            %Create mesh
[x,y,z,dx,dy,dz,dt,c2,noe,STATE,X,Y,Z]=create_mesh_3D(length,nofe,c);
iterations=totaltime/dt;
            %Create disturbance at different instants and store in
            %arrays,also provide the co-ordinates of disturbance
[xd,yd,zd,td,Exd,Eyd,Ezd]=Electric_Disturbance(x,y,z,nofe,STATE,iterations,noe,disturbance_time,A,w,draw_disturbance,scale,rotate,az_user,el_user);
            %Create arrays to store the values of fields
            Ex=zeros(noe,noe,noe,iterations);
            Ey=zeros(noe,noe,noe,iterations);
            Ez=zeros(noe,noe,noe,iterations);
            Bx=zeros(noe,noe,noe,iterations);
            By=zeros(noe,noe,noe,iterations);
            Bz=zeros(noe,noe,noe,iterations);
                %Pseudo matrices to store values between calculations of
                %each field
            Ex1=zeros(noe,noe,noe,1);
            Ey1=zeros(noe,noe,noe,1);
            Ez1=zeros(noe,noe,noe,1);
            Bx1=zeros(noe,noe,noe,1);
            By1=zeros(noe,noe,noe,1);
            Bz1=zeros(noe,noe,noe,1);
            Ex2=zeros(noe,noe,noe,1);
            Ey2=zeros(noe,noe,noe,1);
            Ez2=zeros(noe,noe,noe,1);
            Bx2=zeros(noe,noe,noe,1);
            By2=zeros(noe,noe,noe,1);
            Bz2=zeros(noe,noe,noe,1);
	%Calculate the fields , update and iterate
    Ex(xd,yd,zd,1)=Exd(xd,yd,zd,1);
    Ey(xd,yd,zd,1)=Eyd(xd,yd,zd,1);
    Ez(xd,yd,zd,1)=Ezd(xd,yd,zd,1);
for n=2:iterations
        %Update Magnetic field
        Bx1=Bx(:,:,:,n-1);
        By1=By(:,:,:,n-1);
        Bz1=Bz(:,:,:,n-1);
        %Update Electric field
        Ex1=Ex(:,:,:,n-1);
        Ey1=Ey(:,:,:,n-1);
        Ez1=Ez(:,:,:,n-1);
    %Magnetic Field
    [Bx2]=CURL_E_Bx_III(c,noe,Bx1,Ez1,Ey1);
    [By2]=CURL_E_By_III(c,noe,By1,Ex1,Ez1);
    [Bz2]=CURL_E_Bz_III(c,noe,Bz1,Ey1,Ex1);
        %Electric Field
    [Ex2]=CURL_B_Ex_III(c,noe,Ex1,Bz2,By2);
    [Ey2]=CURL_B_Ey_III(c,noe,Ey1,Bx2,Bz2);
    [Ez2]=CURL_B_Ez_III(c,noe,Ez1,By2,Bx2);
        %Update Magnetic field
        Bx(:,:,:,n)=Bx2;
        By(:,:,:,n)=By2;
        Bz(:,:,:,n)=Bz2;
        %Update Electric field
        Ex(:,:,:,n)=Ex2;
        Ey(:,:,:,n)=Ey2;
        Ez(:,:,:,n)=Ez2;
    %Update Disturbance
    Ex(xd,yd,:,n)=Exd(xd,yd,:,n);
    Ey(xd,yd,:,n)=Eyd(xd,yd,:,n);
    Ez(xd,yd,:,n)=Ezd(xd,yd,:,n);
end
%Poynting vector
[Tx,Ty,Tz]=cross_product(Ex,Ey,Ez,Bx,By,Bz,noe,iterations);
%PLOT(optional)
if(Plot_or_not==1)
     %ELECTRIC FIELD
    for n=1:iterations
        u=Ex(:,:,:,n);
        v=Ey(:,:,:,n);
        w=Ez(:,:,:,n);
        quiver3(x,y,z,u,v,w,scale);
        xlabel('Ex');
        ylabel('Ey');
        zlabel('Ez');
        az=n/2;
        if(rotate==1)
            view(az,el_user);
        else
            view(az_user,el_user)
        end
        drawnow;
        if(Pause_or_not==1)
            pause;
        end
    end
    %MAGNETIC FIELD
    for n=1:iterations
        u=Bx(:,:,:,n);
        v=By(:,:,:,n);
        w=Bz(:,:,:,n);
        quiver3(x,y,z,u,v,w,scale);
        xlabel('Bx');
        ylabel('By');
        zlabel('Bz');
        az=n/2;
        if(rotate==1)
            view(az,el_user);
        else
            view(az_user,el_user)
        end
        drawnow;
        if(Pause_or_not==1)
            pause;
        end
    end
    %Poynting vector
    for n=1:iterations
        u=Tx(:,:,:,n);
        v=Ty(:,:,:,n);
        w=Tz(:,:,:,n);
        quiver3(x,y,z,u,v,w,scale);
        xlabel('Tx');
        ylabel('Ty');
        zlabel('Tz');
        az=n/2;
        if(rotate==1)
            view(az,el_user);
        else
            view(az_user,el_user)
        end
        drawnow;
        if(Pause_or_not==1)
            pause;
        end
    end
end
end