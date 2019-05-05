function varargout=Fspectro(varargin)

senalH=varargin{1};
senalV=varargin{2};
senalA=varargin{3};

Fs=1000;
L=1500;

f=Fs*(0:L/2)/L;

YSenalH=fft(senalH);
P2senalH=abs(YSenalH/L);
P1senalH=P2senalH(1:L/2+1);
P1senalH(2:end-1)=2*P1senalH(2:end-1);
P1senalH(1)=0;
P1senalH(end)=0;

YSenalV=fft(senalV);
P2senalV=abs(YSenalV/L);
P1senalV=P2senalV(1:L/2+1);
P1senalV(2:end-1)=2*P1senalV(2:end-1);
P1senalV(1)=0;
P1senalV(end)=0;

YSenalA=fft(senalA);
P2senalA=abs(YSenalA/L);
P1senalA=P2senalA(1:L/2+1);
P1senalA(2:end-1)=2*P1senalA(2:end-1);
P1senalA(1)=0;
P1senalA(end)=0;

varargout{1}=f;
varargout{2}=P1senalH;
varargout{3}=P1senalV;
varargout{4}=P1senalA;

end