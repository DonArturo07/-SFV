function varargout=tDominio(varargin)

Fs=1000;T=1/Fs;L=1500;
t=(0:L-1)*T;  % VECTOR DE TIEMPO EN ms
AMotor=varargin{1};fMotor=varargin{2};wMotor=2*pi*fMotor;fiMotor=0;
flgApertura=varargin{3};ruido=varargin{4};

xMotor=AMotor*sin(wMotor*t+fiMotor);            % DESPLAZAMIENTO DE LA VIBRACIÓN DEL MOTOR SIN FALLAS
vMotor=AMotor*wMotor*cos(wMotor*t+fiMotor);     % VELOCIDAD DE LA VIBRACIÓN DEL MOTOR SIN FALLAS
aMotor=-AMotor*wMotor^2*sin(wMotor*t+fiMotor);  % ACELERACIÓN DE LA VIBRACIÓN DEL MOTOR SIN FALLAS

vecFallas=zeros([1 9]);
if flgApertura==1
    vecFallas=getappdata(0,'vecFallas');
    if isempty(vecFallas)
        vecFallas=zeros([1 9]);
    end
end

desest=vecFallas(1);desdin=vecFallas(2);
despar=vecFallas(3);desang=vecFallas(4);
desgra=vecFallas(5);desrot=vecFallas(6);desaco=vecFallas(7);
rotexc=vecFallas(8);ejedob=vecFallas(9);

[xDesEst,vDesEst,aDesEst]=destatico(desest,t,AMotor,fMotor,fiMotor);
[xDesDin,vDesDin,aDesDin]=ddinamico(desdin,t,AMotor,fMotor,fiMotor);
[xDesPar,vDesPar,aDesPar]=paralelismo(despar,t,AMotor,fMotor,fiMotor);
[xDesAng,vDesAng,aDesAng]=angularidad(desang,t,AMotor,fMotor,fiMotor);
[xDesGra,vDesGra,aDesGra]=dgravitacional(desgra,t,AMotor,fMotor,fiMotor);
[xDesRot,vDesRot,aDesRot]=drotacional(desrot,t,AMotor,fMotor,fiMotor);
[xDesAco,vDesAco,aDesAco]=dacople(desaco,t,AMotor,fMotor,fiMotor);
[xRotExc,vRotExc,aRotExc]=rexcentrico(rotexc,t,AMotor,fMotor,fiMotor);
[xEjeDob,vEjeDob,aEjeDob]=edoblado(ejedob,t,AMotor,fMotor,fiMotor);

if ruido<=50
    nRuidoX=ruido*AMotor*265*rand(size(t))/(128*100);
    nRuidoV=ruido*AMotor*wMotor*265*rand(size(t))/(128*100);
    nRuidoA=-ruido*AMotor*wMotor^2*265*rand(size(t))/(128*100);
else
    nRuidoX=5*ruido*AMotor*265*rand(size(t))/(128*100);
    nRuidoV=5*ruido*AMotor*wMotor*265*rand(size(t))/(128*100);
    nRuidoA=-5*ruido*AMotor*wMotor^2*265*rand(size(t))/(128*100);
end

xSenalH=xMotor+xDesEst+xDesDin+xDesPar+xDesGra+xDesRot+xDesAco+xRotExc+nRuidoX;
setappdata(0,'xSenalH',xSenalH);
vSenalH=vMotor+vDesEst+vDesDin+vDesPar+vDesGra+vDesRot+vDesAco+vRotExc+nRuidoV;
setappdata(0,'vSenalH',vSenalH);
aSenalH=aMotor+aDesEst+aDesDin+aDesPar+aDesGra+aDesRot+aDesAco+aRotExc+nRuidoA;
setappdata(0,'aSenalH',aSenalH);

xSenalV=xMotor+xDesEst+xDesDin+xDesPar+xDesGra+xDesRot+xDesAco+xRotExc+nRuidoX;
setappdata(0,'xSenalV',xSenalV);
vSenalV=vMotor+vDesEst+vDesDin+vDesPar+vDesGra+vDesRot+vDesAco+vRotExc+nRuidoV;
setappdata(0,'vSenalV',vSenalV);
aSenalV=aMotor+aDesEst+aDesDin+aDesPar+aDesGra+aDesRot+aDesAco+aRotExc+nRuidoA;
setappdata(0,'aSenalV',aSenalV);

xSenalA=xMotor+xDesAng+xEjeDob+nRuidoX;
setappdata(0,'xSenalA',xSenalA);
vSenalA=vMotor+vDesAng+vEjeDob+nRuidoV;
setappdata(0,'vSenalA',vSenalA);
aSenalA=aMotor+aDesAng+aEjeDob+nRuidoA;
setappdata(0,'aSenalA',aSenalA);

varargout{1}=t;
varargout{2}=xSenalH;varargout{3}=vSenalH;varargout{4}=aSenalH;
varargout{5}=xSenalV;varargout{6}=vSenalV;varargout{7}=aSenalV;
varargout{8}=xSenalA;varargout{9}=vSenalA;varargout{10}=aSenalA;

end