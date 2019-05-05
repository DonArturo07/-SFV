function varargout=ddinamico(varargin)

desdin=varargin{1};
t=varargin{2};
AMotor=varargin{3};
fMotor=varargin{4};
fiMotor=varargin{5};

if desdin==1
    ADesDin=0.75*AMotor;
    fDesDin=fMotor;
    wDesDin=2*pi*fDesDin;
    fiDesDin=fiMotor+0;    
    xDesDin=ADesDin*sin(wDesDin*t+fiDesDin);             % DESPLAZAMIENTO GENERADO POR EL DESBALANCEO DINÁMICO
    vDesDin=ADesDin*wDesDin*cos(wDesDin*t+fiDesDin);     % VELOCIDAD GENERADA POR EL DESBALANCEO DINÁMICO
    aDesDin=-ADesDin*wDesDin^2*sin(wDesDin*t+fiDesDin);  % ACELERACIÓN GENERADA POR EL DESBALANCEO DINÁMICO    
else
    xDesDin=0;
    vDesDin=0;
    aDesDin=0;
end

varargout{1}=xDesDin;
varargout{2}=vDesDin;
varargout{3}=aDesDin; 

end