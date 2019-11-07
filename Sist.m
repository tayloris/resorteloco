function dy=Sist(t,y)

dy = zeros(4,1);  

g=9.81; %graveda
L=1; %Longitud del resorte
m=2.6; %masa del resorte
k=300;  %ccte de elasticidad del resorte
a=0.05;  % cctte relacioada a las perdidas de energia por friccion en el pendulo
b=0.05; % cctte relacioada a las perdidas de energia por friccion en el resorte



dy(1)=-(g/y(4))*sin(y(3))-a*y(1);
dy(2)=g*cos(y(3))-(k/m)*(y(4)-L)-b*y(2);
dy(3)=y(1);
dy(4)=y(2);