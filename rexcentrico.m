function varargout=rexcentrico(varargin)

rotexc=varargin{1};
t=varargin{2};
AMotor=varargin{3};
fMotor=varargin{4};
fiMotor=varargin{5};

if rotexc==1
    ARotExc=0.95*AMotor;
    fRotExc=fMotor;
    wRotExc=2*pi*fRotExc;
    fiRotExc=fiMotor;
    xRotExc=ARotExc*sin(wRotExc*t+fiRotExc);             % DESPLAZAMIENTO GENERADO POR EXCENTRICIDAD EN EL ROTOR
    vRotExc=ARotExc*wRotExc*cos(wRotExc*t+fiRotExc);     % VELOCIDAD GENERADA POR EXCENTRICIDAD EN EL ROTOR
    aRotExc=-ARotExc*wRotExc^2*sin(wRotExc*t+fiRotExc);  % ACELERACIÓN GENERADA POR EXCENTRICIDAD EN EL ROTOR
else
    xRotExc=0;
    vRotExc=0;
    aRotExc=0;
end

varargout{1}=xRotExc;
varargout{2}=vRotExc;
varargout{3}=aRotExc;

end