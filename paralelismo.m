function varargout=paralelismo(varargin)

despar=varargin{1};
t=varargin{2};
AMotor=varargin{3};
fMotor=varargin{4};
fiMotor=varargin{5};

if despar==1
    
    ADesPar2x=0.95*AMotor;
    fDesPar2x=2*fMotor;
    wDesPar2x=2*pi*fDesPar2x;
    fiDesPar2x=fiMotor+180;
    xDesPar2x=ADesPar2x*sin(wDesPar2x*t+fiDesPar2x);               % DESPLAZAMIENTO GENERADO POR LA DESALINEACIÓN PARALELA
    vDesPar2x=ADesPar2x*wDesPar2x*cos(wDesPar2x*t+fiDesPar2x);     % VELOCIDAD GENERADA POR LA DESALINEACIÓN PARALELA
    aDesPar2x=-ADesPar2x*wDesPar2x^2*sin(wDesPar2x*t+fiDesPar2x);  % ACELERACIÓN GENERADA POR LA DESALINEACIÓN PARALELA

    ADesPar1x=0.3*ADesPar2x;
    fDesPar1x=fMotor;
    wDesPar1x=2*pi*fDesPar1x;
    fiDesPar1x=fiMotor+180;
    xDesPar1x=ADesPar1x*sin(wDesPar1x*t+fiDesPar1x);               % DESPLAZAMIENTO GENERADO POR LA DESALINEACIÓN PARALELA
    vDesPar1x=ADesPar1x*wDesPar1x*cos(wDesPar1x*t+fiDesPar1x);     % VELOCIDAD GENERADA POR LA DESALINEACIÓN PARALELA
    aDesPar1x=-ADesPar1x*wDesPar1x^2*sin(wDesPar1x*t+fiDesPar1x);  % ACELERACIÓN GENERADA POR LA DESALINEACIÓN PARALELA

    ADesPar3x=0.25*ADesPar2x;
    fDesPar3x=3*fMotor;
    wDesPar3x=2*pi*fDesPar3x;
    fiDesPar3x=fiMotor+0;
    xDesPar3x=ADesPar3x*sin(wDesPar3x*t+fiDesPar3x);               % DESPLAZAMIENTO GENERADO POR LA DESALINEACIÓN PARALELA
    vDesPar3x=ADesPar3x*wDesPar3x*cos(wDesPar3x*t+fiDesPar3x);     % VELOCIDAD GENERADA POR LA DESALINEACIÓN PARALELA
    aDesPar3x=-ADesPar3x*wDesPar3x^2*sin(wDesPar3x*t+fiDesPar3x);  % ACELERACIÓN GENERADA POR LA DESALINEACIÓN PARALELA
    
    xDesPar=xDesPar1x+xDesPar2x+xDesPar3x;
    vDesPar=vDesPar1x+vDesPar2x+vDesPar3x;
    aDesPar=aDesPar1x+aDesPar2x+aDesPar3x;
    
else
    xDesPar=0;
    vDesPar=0;
    aDesPar=0;
end

varargout{1}=xDesPar;
varargout{2}=vDesPar;
varargout{3}=aDesPar;

end