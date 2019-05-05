function graficaSimulacion(varargin)

t=varargin{1};
senalH=varargin{2};senalV=varargin{3};senalA=varargin{4};
f=varargin{5};
P1senalH=varargin{6};P1senalV=varargin{7};P1senalA=varargin{8};
axHt=varargin{9};axHf=varargin{10};
axVt=varargin{11};axVf=varargin{12};
axAt=varargin{13};axAf=varargin{14};
vecModo=varargin{15};

x=vecModo(1);v=vecModo(2);a=vecModo(3);

if x==1
    tTitulo='SEÑAL DE DESPLAZAMIENTO DE LA VIBRACIÓN';
    fTitulo='ESPECTRO DEL DESPLAZAMIENTO DE LA VIBRACIÓN';
    ytunidad='DESPLAZAMIENTO [mm]';
    yfunidad='AMPLITUD [mm]';
elseif v==1
    tTitulo='SEÑAL DE VELOCIDAD DE LA VIBRACIÓN';
    fTitulo='ESPECTRO DE LA VELOCIDAD DE LA VIBRACIÓN';
    ytunidad='VELOCIDAD [mm/s]';
    yfunidad='AMPLITUD [mm/s]';
elseif a==1
    tTitulo='SEÑAL DE ACELERACIÓN DE LA VIBRACIÓN';
    fTitulo='ESPECTRO DE LA ACELERACIÓN DE LA VIBRACIÓN';
    ytunidad='ACELERACIÓN [mm/s^2]';
    yfunidad='AMPLITUD [mm/s^2]';
end

axes(axHt)
plot(1000*t,senalH)
title(tTitulo,'FontSize',8)
xlabel('TIEMPO [ms]','FontSize',7)
ylabel(ytunidad,'FontSize',7)
axes(axHf)
plot(f,P1senalH)
title(fTitulo,'FontSize',8)
xlabel('FRECUENCIA [Hz]','FontSize',7)
ylabel(yfunidad,'FontSize',7)

axes(axVt)
plot(1000*t,senalV)
title(tTitulo,'FontSize',8)
xlabel('TIEMPO [ms]','FontSize',7)
ylabel(ytunidad,'FontSize',7)
axes(axVf)
plot(f,P1senalV)
title(fTitulo,'FontSize',8)
xlabel('FRECUENCIA [Hz]','FontSize',7)
ylabel(yfunidad,'FontSize',7)

axes(axAt)
plot(1000*t,senalA)
title(tTitulo,'FontSize',8)
xlabel('TIEMPO [ms]','FontSize',7)
ylabel(ytunidad,'FontSize',7)
axes(axAf)
plot(f,P1senalA)
title(fTitulo,'FontSize',8)
xlabel('FRECUENCIA [Hz]','FontSize',7)
ylabel(yfunidad,'FontSize',7)

end