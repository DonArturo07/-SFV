function varargout=destatico(varargin)

desest=varargin{1};
t=varargin{2};
AMotor=varargin{3};
fMotor=varargin{4};wMotor=2*pi*fMotor;
fiMotor=varargin{5};

if desest==1
    ADesEst=(AMotor*wMotor)^2;  % LA AMPLITUD VARÍA DE MANERA PROPORCIONAL AL CUADRADO DE LA VELOCIDAD (Vibration_Analysis_Diagnostic_Guide.pdf pág: 31/36)
    fDesEst=fMotor;             % FRECUENCIA PREDOMINANTE EN 1x RPM (Vibration_Analysis_Diagnostic_Guide.pdf pág: 31/36)
    wDesEst=2*pi*fDesEst;
    fiDesEst=fiMotor+17.5;      % LA FASE ESTÁ ENTRE 15° Y 20° (Vibration_Analysis_Diagnostic_Guide.pdf pág: 31/36)  
    xDesEst=ADesEst*sin(wDesEst*t+fiDesEst);             % DESPLAZAMIENTO GENERADO POR EL DESBALANCEO ESTÁTICO
    vDesEst=ADesEst*wDesEst*cos(wDesEst*t+fiDesEst);     % VELOCIDAD GENERADA POR EL DESBALANCEO ESTÁTICO
    aDesEst=-ADesEst*wDesEst^2*sin(wDesEst*t+fiDesEst);  % ACELERACIÓN GENERADA POR EL DESBALANCEO ESTÁTICO    
else
    xDesEst=0;
    vDesEst=0;
    aDesEst=0;
end

varargout{1}=xDesEst;
varargout{2}=vDesEst;
varargout{3}=aDesEst;

end