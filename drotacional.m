function varargout=drotacional(varargin)

desrot=varargin{1};
t=varargin{2};
AMotor=varargin{3};
fMotor=varargin{4};
fiMotor=varargin{5};

if desrot==1
    
    ADesRot2x=0.95*AMotor;
    fDesRot2x=4*fMotor;
    wDesRot2x=2*pi*fDesRot2x;
    fiDesRot2x=fiMotor;
    xDesRot2x=ADesRot2x*sin(wDesRot2x*t+fiDesRot2x);               % DESPLAZAMIENTO GENERADO POR EL DESBALANCEO ROTACIONAL
    vDesRot2x=ADesRot2x*wDesRot2x*cos(wDesRot2x*t+fiDesRot2x);     % VELOCIDAD GENERADA POR EL DESBALANCEO ROTACIONAL
    aDesRot2x=-ADesRot2x*wDesRot2x^2*sin(wDesRot2x*t+fiDesRot2x);  % ACELERACIÓN GENERADA POR EL DESBALANCEO ROTACIONAL
    
    ADesRot4x=0.95*AMotor;
    fDesRot4x=4*fMotor;
    wDesRot4x=2*pi*fDesRot4x;
    fiDesRot4x=fiMotor;
    xDesRot4x=ADesRot4x*sin(wDesRot4x*t+fiDesRot4x);               % DESPLAZAMIENTO GENERADO POR EL DESBALANCEO ROTACIONAL
    vDesRot4x=ADesRot4x*wDesRot4x*cos(wDesRot4x*t+fiDesRot4x);     % VELOCIDAD GENERADA POR EL DESBALANCEO ROTACIONAL
    aDesRot4x=-ADesRot4x*wDesRot4x^2*sin(wDesRot4x*t+fiDesRot4x);  % ACELERACIÓN GENERADA POR EL DESBALANCEO ROTACIONAL

    xDesRot=xDesRot2x+xDesRot4x;
    vDesRot=vDesRot2x+vDesRot4x;
    aDesRot=aDesRot2x+aDesRot4x;
else
    xDesRot=0;
    vDesRot=0;
    aDesRot=0;
end

varargout{1}=xDesRot;
varargout{2}=vDesRot;
varargout{3}=aDesRot;

end

