%%%Programa base para el generador de trayectoria robot Dofbot


%Punto inicial%%%%%%%%%%%%
x_in = 0.30;
y_in = 0.15;
z_in = 0.15;
beta_in = 3*pi/4;

%Punto final%%%%%%%%%%%%%%
x_fin = 0.30;
y_fin = -0.15;
z_fin = 0.15;
beta_fin = 3*pi/4;

%Coordenadas del origen del sistema 1 con respecto al sistema m.
x_m_1 = 0.072;
y_m_1 = 0.0;
z_m_1 = 0.105;


%Definición de los parámetros de la trayectoria%%%%%%%%%%%%
t_total = 10;
t_in = 0.1;
t_sim = 0:t_in:t_total;
 
%Puntos de la trayectoria%%%%%%%%%%%%%%
xp = x_in+((10/t_total^3)*t_sim.^3-(15/t_total^4)*t_sim.^4+(6/t_total^5)*t_sim.^5)*(x_fin-x_in);
yp = y_in+((10/t_total^3)*t_sim.^3-(15/t_total^4)*t_sim.^4+(6/t_total^5)*t_sim.^5)*(y_fin-y_in);
zp = z_in+((10/t_total^3)*t_sim.^3-(15/t_total^4)*t_sim.^4+(6/t_total^5)*t_sim.^5)*(z_fin-z_in);
betap = beta_in+((10/t_total^3)*t_sim.^3-(15/t_total^4)*t_sim.^4+(6/t_total^5)*t_sim.^5)*(beta_fin-beta_in);

%%Generación de la subtrayectoria para la cadena cinemática


%Parametros del robot
%Longitudes de los eslabones
L_1 = 0.08412; %m
L_2 = 0.08412; %m
L_3 = 0.16332; %m

for i=1:length(t_sim)

    theta_m_1(i) = atan2(yp(i),(xp(i)-x_m_1));
    x4 = xp-L_3*cos(theta_m_1(i))*cos(betap(i));
    y4 = yp-L_3*sin(theta_m_1(i))*cos(betap(i));
    z4 = zp-L_3*sin(betap(i));


end


%%Grafica de la trayectoria

plot3(xp,yp,zp,x3,y3,z3,'--')
grid on
title('Trayectoria')
xlabel('x')
ylabel('y')
zlabel('z')



