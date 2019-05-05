function varargout=calculaSimulacion(varargin)

vecRpm=varargin{1};
vecRuido=varargin{2};
vecModo=varargin{3};
flgApertura=varargin{4};

rpm12=vecRpm(1);rpm18=vecRpm(2);rpm36=vecRpm(3);rpmOtro=vecRpm(4);rpm=vecRpm(5);
if rpm12==1
    AMotor=18.907/rpm;  % [mm]
    fMotor=rpm/60;      % [Hz]
    limSup=round(1000/fMotor);
elseif rpm18==1
    AMotor=18.907/rpm;  % [mm]
    fMotor=rpm/60;      % [Hz]
    limSup=round(1000/fMotor);
elseif rpm36==1
    AMotor=18.907/rpm;  % [mm]
    fMotor=rpm/60;      % [Hz]
    limSup=round(1000/fMotor);
elseif rpmOtro==1
    if rpm>=900
        if rpm<=5400
            AMotor=18.907/rpm;  % [mm]
            fMotor=rpm/60;      % [Hz]
            limSup=round(1000/fMotor);
        else
            AMotor=0;   % [mm]
            fMotor=0;   % [Hz]
            limSup=10;
            uiwait(msgbox('La velocidad del motor debe ser menor o igual que 5400 RPM','Error','error'));
        end
    else
        AMotor=0;
        fMotor=0;
        limSup=10;
        uiwait(msgbox('La velocidad del motor debe ser mayor o igual que 900 RPM','Error','error'));
    end
end

ruido=vecRuido(2);

[t,...
    xSenalH,vSenalH,aSenalH,...
    xSenalV,vSenalV,aSenalV,...
    xSenalA,vSenalA,aSenalA]=tDominio(AMotor,fMotor,flgApertura,ruido);

x=vecModo(1);v=vecModo(2);a=vecModo(3);
if x==1
    senalH=xSenalH;senalV=xSenalV;senalA=xSenalA;
elseif v==1
    senalH=vSenalH;senalV=vSenalV;senalA=vSenalA;
elseif a==1
    senalH=aSenalH;senalV=aSenalV;senalA=aSenalA;
end

periodos=vecRuido(1);
limEjet=periodos*limSup;

[f,P1senalH,P1senalV,P1senalA]=Fspectro(senalH,senalV,senalA);

varargout{1}=t(1:limEjet);
varargout{2}=senalH(1:limEjet);
varargout{3}=senalV(1:limEjet);
varargout{4}=senalA(1:limEjet);
varargout{5}=f;
varargout{6}=P1senalH;
varargout{7}=P1senalV;
varargout{8}=P1senalA;

end