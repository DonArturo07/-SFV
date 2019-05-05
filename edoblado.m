function varargout=edoblado(varargin)

ejedob=varargin{1};
t=varargin{2};
AMotor=varargin{3};
fMotor=varargin{4};
fiMotor=varargin{5};

if ejedob==1

    AEjeDob1x=0.95*AMotor;
    fEjeDob1x=fMotor;
    wEjeDob1x=2*pi*fEjeDob1x;
    fiEjeDob1x=fiMotor+90;
    xEjeDob1x=AEjeDob1x*sin(wEjeDob1x*t+fiEjeDob1x);               % DESPLAZAMIENTO GENERADO POR EJE DOBLADO
    vEjeDob1x=AEjeDob1x*wEjeDob1x*cos(wEjeDob1x*t+fiEjeDob1x);     % VELOCIDAD GENERADA POR EJE DOBLADO
    aEjeDob1x=-AEjeDob1x*wEjeDob1x^2*sin(wEjeDob1x*t+fiEjeDob1x);  % ACELERACIÓN GENERADA POR EJE DOBLADO
    
    AEjeDob2x=0.25*AMotor;
    fEjeDob2x=2*fMotor;
    wEjeDob2x=2*pi*fEjeDob2x;
    fiEjeDob2x=fiMotor+90;
    xEjeDob2x=AEjeDob2x*sin(wEjeDob2x*t+fiEjeDob2x);               % DESPLAZAMIENTO GENERADO POR EJE DOBLADO
    vEjeDob2x=AEjeDob2x*wEjeDob2x*cos(wEjeDob2x*t+fiEjeDob2x);     % VELOCIDAD GENERADA POR EJE DOBLADO
    aEjeDob2x=-AEjeDob2x*wEjeDob2x^2*sin(wEjeDob2x*t+fiEjeDob2x);  % ACELERACIÓN GENERADA POR EJE DOBLADO
    
    xEjeDob=xEjeDob1x+xEjeDob2x;
    vEjeDob=vEjeDob1x+vEjeDob2x;
    aEjeDob=aEjeDob1x+aEjeDob2x;
else
    xEjeDob=0;
    vEjeDob=0;
    aEjeDob=0;
end

varargout{1}=xEjeDob;
varargout{2}=vEjeDob;
varargout{3}=aEjeDob;

end