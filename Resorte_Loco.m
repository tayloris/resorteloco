clear all 
clc
close

g=9.81;

%% Condiciones Iniciales
r=1.2; % Indica la proporcion de cuanto se estiro r>1 o cuanto se encoogio el resorte
% r<0. (r=1 quiere decir que ni se estiro ni se encogio)

tita=0.9; %[rad] Angulo inicial respecto a la vertical 

Vector=[0 0 tita r];%VECTOR CONDICION INICIAL



%% T final
t=50; %tiempo que durara la simulacion

%% RESUELVO EL SISTEMA EN COORDENADAS POLARES

% el sistema de ecuaciones esta guardado en el archivo Sist.m

options = odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-4 1e-4 1e-4]);
[t,T] = ode45(@Sist,[0 t],Vector,options);



%% PASO A COORDENADAS CARTESIANAS
Y(:,1)=T(:,4).*sin(T(:,3));
Y(:,2)=-T(:,4).*cos(T(:,3)); 
Y=Y';%CUESTIONES DE MATLAB NO SE PUEDE ESCRIBIR Y(1,:)=T(:,4).*sin(T(:,3));
%POR ESO LO PIDO AL REVES Y LUEGO LO TRASPONGO



%% Aca realizo la graficacion
Simul2(Y,Vector);

% Si la grafica donde es muy lenta o muy rapida entonces abra
%el archivo Simul2.m y ubique la linea 72 alli puede cambiar la variab
% pausa para aumentar o disminuir el ciclo que hace el papel de pause