function varargout=angularidad(varargin)

desang=varargin{1};
t=varargin{2};
AMotor=varargin{3};
fMotor=varargin{4};
fiMotor=varargin{5};

if desang==1
    
    ADesAng1x=0.95*AMotor;
    fDesAng1x=fMotor;
    wDesAng1x=2*pi*fDesAng1x;
    fiDesAng1x=fiMotor+180;
    xDesAng1x=ADesAng1x*sin(wDesAng1x*t+fiDesAng1x);               % DESPLAZAMIENTO GENERADO POR LA DESALINEACIÓN ANGULAR
    vDesAng1x=ADesAng1x*wDesAng1x*cos(wDesAng1x*t+fiDesAng1x);     % VELOCIDAD GENERADA POR LA DESALINEACIÓN ANGULAR
    aDesAng1x=-ADesAng1x*wDesAng1x^2*sin(wDesAng1x*t+fiDesAng1x);  % ACELERACIÓN GENERADA POR LA DESALINEACIÓN ANGULAR
    
    ADesAng2x=0.3*ADesAng1x;
    fDesAng2x=2*fMotor;
    wDesAng2x=2*pi*fDesAng2x;
    fiDesAng2x=fiMotor+180;
    xDesAng2x=ADesAng2x*sin(wDesAng2x*t+fiDesAng2x);               % DESPLAZAMIENTO GENERADO POR LA DESALINEACIÓN ANGULAR
    vDesAng2x=ADesAng2x*wDesAng2x*cos(wDesAng2x*t+fiDesAng2x);     % VELOCIDAD GENERADA POR LA DESALINEACIÓN ANGULAR
    aDesAng2x=-ADesAng2x*wDesAng2x^2*sin(wDesAng2x*t+fiDesAng2x);  % ACELERACIÓN GENERADA POR LA DESALINEACIÓN ANGULAR

    ADesAng3x=0.25*ADesAng1x;
    fDesAng3x=3*fMotor;
    wDesAng3x=2*pi*fDesAng3x;
    fiDesAng3x=fiMotor+0;
    xDesAng3x=ADesAng3x*sin(wDesAng3x*t+fiDesAng3x);               % DESPLAZAMIENTO GENERADO POR LA DESALINEACIÓN ANGULAR
    vDesAng3x=ADesAng3x*wDesAng3x*cos(wDesAng3x*t+fiDesAng3x);     % VELOCIDAD GENERADA POR LA DESALINEACIÓN ANGULAR
    aDesAng3x=-ADesAng3x*wDesAng3x^2*sin(wDesAng3x*t+fiDesAng3x);  % ACELERACIÓN GENERADA POR LA DESALINEACIÓN ANGULAR
    
    xDesAng=xDesAng1x+xDesAng2x+xDesAng3x;
    vDesAng=vDesAng1x+vDesAng2x+vDesAng3x;
    aDesAng=aDesAng1x+aDesAng2x+aDesAng3x;
    
else
    xDesAng=0;
    vDesAng=0;
    aDesAng=0;
end

varargout{1}=xDesAng;
varargout{2}=vDesAng;
varargout{3}=aDesAng;

end