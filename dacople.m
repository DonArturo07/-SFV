function varargout=dacople(varargin)

desaco=varargin{1};
t=varargin{2};
AMotor=varargin{3};
fMotor=varargin{4};
fiMotor=varargin{5};

if desaco==1
    
    ADesAco3x=0.35*AMotor;
    fDesAco3x=4.5*fMotor;
    wDesAco3x=2*pi*fDesAco3x;
    fiDesAco3x=fiMotor-32;
    xDesAco3x=ADesAco3x*sin(wDesAco3x*t+fiDesAco3x);               % DESPLAZAMIENTO GENERADO POR DESBALANCEO EN EL ACOPLE
    vDesAco3x=ADesAco3x*wDesAco3x*cos(wDesAco3x*t+fiDesAco3x);     % VELOCIDAD GENERADA POR DESBALANCEO EN EL ACOPLE
    aDesAco3x=-ADesAco3x*wDesAco3x^2*sin(wDesAco3x*t+fiDesAco3x);  % ACELERACIÓN GENERADA POR DESBALANCEO EN EL ACOPLE
    
    ADesAco5x=0.35*AMotor;
    fDesAco5x=4.5*fMotor;
    wDesAco5x=2*pi*fDesAco5x;
    fiDesAco5x=fiMotor-32;
    xDesAco5x=ADesAco5x*sin(wDesAco5x*t+fiDesAco5x);               % DESPLAZAMIENTO GENERADO POR DESBALANCEO EN EL ACOPLE
    vDesAco5x=ADesAco5x*wDesAco5x*cos(wDesAco5x*t+fiDesAco5x);     % VELOCIDAD GENERADA POR DESBALANCEO EN EL ACOPLE
    aDesAco5x=-ADesAco5x*wDesAco5x^2*sin(wDesAco5x*t+fiDesAco5x);  % ACELERACIÓN GENERADA POR DESBALANCEO EN EL ACOPLE

    ADesAco7x=0.35*AMotor;
    fDesAco7x=4.5*fMotor;
    wDesAco7x=2*pi*fDesAco7x;
    fiDesAco7x=-32;
    xDesAco7x=ADesAco7x*sin(wDesAco7x*t+fiDesAco7x);               % DESPLAZAMIENTO GENERADO POR DESBALANCEO EN EL ACOPLE
    vDesAco7x=ADesAco7x*wDesAco7x*cos(wDesAco7x*t+fiDesAco7x);     % VELOCIDAD GENERADA POR DESBALANCEO EN EL ACOPLE
    aDesAco7x=-ADesAco7x*wDesAco7x^2*sin(wDesAco7x*t+fiDesAco7x);  % ACELERACIÓN GENERADA POR DESBALANCEO EN EL ACOPLE
    
    xDesAco=xDesAco3x+xDesAco5x+xDesAco7x;
    vDesAco=vDesAco3x+vDesAco5x+vDesAco7x;
    aDesAco=aDesAco3x+aDesAco5x+aDesAco7x;
else
    xDesAco=0;
    vDesAco=0;
    aDesAco=0;
end

varargout{1}=xDesAco;
varargout{2}=vDesAco;
varargout{3}=aDesAco;

end