% Animation code

function T=Simul(Y,Vector)

colordef black

%Defino la pelotica movil
head = line( ...
        'color','m', ...
        'Marker','.', ...
        'markersize',40, ...
        'erase','xor', ...
        'xdata',[],'ydata',[]);
     %defino el punto donde se sostiene el resorte
    centro = line( ...
        'color','g', ...
        'Marker','.', ...
        'markersize',35, ...
        'xdata',[],'ydata',[]);
    %Defino la estela azul
    %perro=whitebg([1 1 1]);
        body = line( ...
        'color',[0.8 0.8 0.8], ...
        'LineStyle','-', ...
        'erase','none', ...
        'xdata',[],'ydata',[]);
    %defino el resorte
       h=line(...
        'color','y', ...
        'LineStyle','.', ...
        'markersize',5, ...
        'erase','xor', ...        
        'xdata',[],'ydata',[]);
        
        
    Y(1,1)=Vector(4)*cos(Vector(3));%CONDICION INICIAL
    Y(2,1)=Vector(4)*sin(Vector(3));
    %MOdifique aca los ejes 
    tax=(max(abs(Y(1,:))));
   
    %ESTA PARTE DEBE MERORARSE NO ENCONTRE FORMA 
    %DE AJUSTAR EFICIENTEMENTE LOS EJES Y
    %SI SABES COMO HACERLO HASMELO SABER
    if max(Y(2,:))<0
    tay=min(Y(2,:));
    tay2=0;
    else if  max(Y(2,:))>=0
    tay=min(Y(2,:));
    tay2=max(Y(2,:)); 
    end
    end
    f=max(abs(tax),abs(tay));
    axis([-f f -f f])
    axis off
    %gRAFICO EL CENTRO
    set(centro,'xdata',0,'ydata',0)
    title('Resorte Loco')
    
    %s es para mandar a para el codigo
    s=1;
        for i=2:length(Y(1,:))
            %Grafico el punto movil
            set(head,'xdata',Y(1,i),'ydata',Y(2,i))
            %Grafico la estela
            if i>50
            set(body,'xdata',Y(1,i-49:i),'ydata',Y(2,i-49:i))
            end
            %Grafico la cuerda resorte
            L1=[0:Y(1,i)/100:Y(1,i)];
            L2=[0:Y(2,i)/100:Y(2,i)];
            set(h,'xdata',L1,'ydata',L2)
            drawnow;
            %esto me hace las veces de pauce
            Pausa=300000;
            for j=1: Pausa            
            end 
            if s==0
                break
            end
        end
