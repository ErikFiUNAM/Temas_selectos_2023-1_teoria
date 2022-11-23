%Programa de preuba de la solución geometrica del Dofbot 

%%Trayectoria a realizar

%Parametros de la trayectoria

t_total = 10; %s
t_muestreo = 0.1; %s
t = 0:t_muestreo:t_total; %arreglo del tiempo

%Coordenandas de inicio
x_in = 0.30; %m
y_in = 0.15; %m
z_in = 0.14; %m


%Coordenandas de finales
x_fin = 0.30; %m
y_fin = -0.15; %m
z_fin = 0.14; %m

x_m_P = x_in+((10/t_total^3)*t.^3-(15/t_total^4)*t.^4+(6/t_total^5)*t.^5)*(x_fin-x_in);
y_m_P = y_in+((10/t_total^3)*t.^3-(15/t_total^4)*t.^4+(6/t_total^5)*t.^5)*(y_fin-y_in);
z_m_P = z_in+((10/t_total^3)*t.^3-(15/t_total^4)*t.^4+(6/t_total^5)*t.^5)*(z_fin-z_in);

figure
plot3(x_m_P,y_m_P,z_m_P)
grid
title('Trayectoria Dofbot')
xlabel('x')
ylabel('y')
zlabel('z')


%% Solución geometrica del robot Dofbot



