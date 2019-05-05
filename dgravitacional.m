function varargout=dgravitacional(varargin)

desgra=varargin{1};
t=varargin{2};
AMotor=varargin{3};
fMotor=varargin{4};
fiMotor=varargin{5};

if desgra==1
    ADesGra=0.75*AMotor;
    fDesGra=fMotor;
    wDesGra=2*pi*fDesGra;
    fiDesGra=fiMotor+0;
    xDesGra=ADesGra*sin(wDesGra*t+fiDesGra);             % DESPLAZAMIENTO GENERADO POR EL DESBALANCEO GRAVITACIONAL
    vDesGra=ADesGra*wDesGra*cos(wDesGra*t+fiDesGra);     % VELOCIDAD GENERADA POR EL DESBALANCEO GRAVITACIONAL
    aDesGra=-ADesGra*wDesGra^2*sin(wDesGra*t+fiDesGra);  % ACELERACIÓN GENERADA POR EL DESBALANCEO GRAVITACIONAL
else
    xDesGra=0;
    vDesGra=0;
    aDesGra=0;
end

varargout{1}=xDesGra;
varargout{2}=vDesGra;
varargout{3}=aDesGra;

end

