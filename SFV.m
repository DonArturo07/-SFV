function varargout = SFV(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SFV_OpeningFcn, ...
                   'gui_OutputFcn',  @SFV_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before SFV is made visible.
function SFV_OpeningFcn(hObject, eventdata, handles, varargin)
%{
axes(handles.axLogo);
imshow('C:\Program Files\MATLAB\R2018a\bin\logo_Kontrolar.jpg')
%}

folder=pwd;
baseFileName='logo_Kontrolar.jpg';
fullFileName=fullfile(folder,baseFileName);
if ~exist(fullFileName,'file')
    fullFileName=baseFileName;
    if ~exist(fullFileName,'file')
        errorMessage=sprintf('Error: %s NO EXISTE',fullFileName);
        uiwait(warndlg(errorMessage));
    end
else
    rgbImage=imread(fullFileName);
    axes(handles.axLogo);
    imshow(rgbImage,[]);
end

rpm=1200;
set(handles.rbtn12,'Value',1);set(handles.rbtn18,'Value',0);set(handles.rbtn36,'Value',0);set(handles.rbtnOtro,'Value',0);handles.rpm=rpm;
set(handles.sldPeriodos,'Value',10);set(handles.sldRuido,'Value',0);
set(handles.rbtnX,'Value',1);set(handles.rbtnV,'Value',0);set(handles.rbtnA,'Value',0);
flgApertura=0;
set(handles.etxtOtro,'String','900');set(handles.etxtOtro,'Enable','off');

handles.vecRpm=[get(handles.rbtn12,'Value') get(handles.rbtn18,'Value')...
    get(handles.rbtn36,'Value') get(handles.rbtnOtro,'Value') rpm];
handles.vecRuido=[get(handles.sldPeriodos,'Value') get(handles.sldRuido,'Value')];
handles.vecModo=[get(handles.rbtnX,'Value') get(handles.rbtnV,'Value')...
    get(handles.rbtnA,'Value')];
handles.flgFallas=flgApertura;

[t,senalH,senalV,senalA,f,P1senalH,P1senalV,P1senalA]=calculaSimulacion(handles.vecRpm,...
    handles.vecRuido,handles.vecModo,flgApertura);

graficaSimulacion(t,senalH,senalV,senalA,...
    f,P1senalH,P1senalV,P1senalA,...
    handles.axHt,handles.axHf,handles.axVt,handles.axVf,...
    handles.axAt,handles.axAf,handles.vecModo);

handles.output = hObject;
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = SFV_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes on button press in btnRms.
function btnRms_Callback(hObject, eventdata, handles)

SFV_rms;

% --- Executes on button press in btnFallas.
function btnFallas_Callback(hObject, eventdata, handles)

flgApertura=1;
handles.flgFallas=flgApertura;
SFV_fallas;

guidata(hObject, handles);

% --- Executes on slider movement.
function sldPeriodos_Callback(hObject, eventdata, handles)
% hObject    handle to sldPeriodos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

rpm=handles.rpm;
handles.vecRpm=[get(handles.rbtn12,'Value') get(handles.rbtn18,'Value')...
    get(handles.rbtn36,'Value') get(handles.rbtnOtro,'Value') rpm];
handles.vecRuido=[get(hObject,'Value') get(handles.sldRuido,'Value')];
handles.vecModo=[get(handles.rbtnX,'Value') get(handles.rbtnV,'Value')...
    get(handles.rbtnA,'Value')];
flgApertura=handles.flgFallas;

set(handles.etxtPeriodos,'String',num2str(get(hObject,'Value')));

[t,senalH,senalV,senalA,f,P1senalH,P1senalV,P1senalA]=calculaSimulacion(handles.vecRpm,...
    handles.vecRuido,handles.vecModo,flgApertura);

graficaSimulacion(t,senalH,senalV,senalA,...
    f,P1senalH,P1senalV,P1senalA,...
    handles.axHt,handles.axHf,handles.axVt,handles.axVf,...
    handles.axAt,handles.axAf,handles.vecModo);

guidata(hObject, handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sldPeriodos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sldPeriodos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function etxtPeriodos_Callback(hObject, eventdata, handles)
% hObject    handle to etxtPeriodos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of etxtPeriodos as text
%        str2double(get(hObject,'String')) returns contents of etxtPeriodos as a double


% --- Executes during object creation, after setting all properties.
function etxtPeriodos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to etxtPeriodos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sldRuido_Callback(hObject, eventdata, handles)
% hObject    handle to sldRuido (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

rpm=handles.rpm;
handles.vecRpm=[get(handles.rbtn12,'Value') get(handles.rbtn18,'Value')...
    get(handles.rbtn36,'Value') get(handles.rbtnOtro,'Value') rpm];
handles.vecRuido=[get(handles.sldPeriodos,'Value') get(hObject,'Value')];
handles.vecModo=[get(handles.rbtnX,'Value') get(handles.rbtnV,'Value')...
    get(handles.rbtnA,'Value')];
flgApertura=handles.flgFallas;

set(handles.etxtRuido,'String',num2str(get(hObject,'Value')));

[t,senalH,senalV,senalA,f,P1senalH,P1senalV,P1senalA]=calculaSimulacion(handles.vecRpm,...
    handles.vecRuido,handles.vecModo,flgApertura);

graficaSimulacion(t,senalH,senalV,senalA,...
    f,P1senalH,P1senalV,P1senalA,...
    handles.axHt,handles.axHf,handles.axVt,handles.axVf,...
    handles.axAt,handles.axAf,handles.vecModo);

guidata(hObject, handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sldRuido_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sldRuido (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function etxtRuido_Callback(hObject, eventdata, handles)
% hObject    handle to etxtRuido (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of etxtRuido as text
%        str2double(get(hObject,'String')) returns contents of etxtRuido as a double


% --- Executes during object creation, after setting all properties.
function etxtRuido_CreateFcn(hObject, eventdata, handles)
% hObject    handle to etxtRuido (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function etxtOtro_Callback(hObject, eventdata, handles)
% hObject    handle to etxtOtro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

rpm=str2double(get(hObject,'String'));handles.rpm=rpm;
handles.vecRpm=[0 0 0 get(handles.rbtnOtro,'Value') rpm];
handles.vecRuido=[get(handles.sldPeriodos,'Value') get(handles.sldRuido,'Value')];
handles.vecModo=[get(handles.rbtnX,'Value') get(handles.rbtnV,'Value') get(handles.rbtnA,'Value')];
flgApertura=handles.flgFallas;

[t,senalH,senalV,senalA,f,P1senalH,P1senalV,P1senalA]=calculaSimulacion(handles.vecRpm,...
    handles.vecRuido,handles.vecModo,flgApertura);

graficaSimulacion(t,senalH,senalV,senalA,...
    f,P1senalH,P1senalV,P1senalA,...
    handles.axHt,handles.axHf,handles.axVt,handles.axVf,...
    handles.axAt,handles.axAf,handles.vecModo);

guidata(hObject, handles);

% Hints: get(hObject,'String') returns contents of etxtOtro as text
%        str2double(get(hObject,'String')) returns contents of etxtOtro as a double


% --- Executes during object creation, after setting all properties.
function etxtOtro_CreateFcn(hObject, eventdata, handles)
% hObject    handle to etxtOtro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in rbtn12.
function rbtn12_Callback(hObject, eventdata, handles)

rpm=1200;handles.rpm=rpm;
handles.vecRpm=[get(hObject,'Value') 0 0 0 rpm];set(handles.etxtOtro,'Enable','off');
handles.vecRuido=[get(handles.sldPeriodos,'Value') get(handles.sldRuido,'Value')];
handles.vecModo=[get(handles.rbtnX,'Value') get(handles.rbtnV,'Value') get(handles.rbtnA,'Value')];
flgApertura=handles.flgFallas;

[t,senalH,senalV,senalA,f,P1senalH,P1senalV,P1senalA]=calculaSimulacion(handles.vecRpm,...
    handles.vecRuido,handles.vecModo,flgApertura);

graficaSimulacion(t,senalH,senalV,senalA,...
    f,P1senalH,P1senalV,P1senalA,...
    handles.axHt,handles.axHf,handles.axVt,handles.axVf,...
    handles.axAt,handles.axAf,handles.vecModo);

guidata(hObject, handles);


function rbtn18_Callback(hObject, eventdata, handles)

rpm=1800;handles.rpm=rpm;
handles.vecRpm=[0 get(hObject,'Value') 0 0 rpm];set(handles.etxtOtro,'Enable','off');
handles.vecRuido=[get(handles.sldPeriodos,'Value') get(handles.sldRuido,'Value')];
handles.vecModo=[get(handles.rbtnX,'Value') get(handles.rbtnV,'Value') get(handles.rbtnA,'Value')];
flgApertura=handles.flgFallas;

[t,senalH,senalV,senalA,f,P1senalH,P1senalV,P1senalA]=calculaSimulacion(handles.vecRpm,...
    handles.vecRuido,handles.vecModo,flgApertura);

graficaSimulacion(t,senalH,senalV,senalA,...
    f,P1senalH,P1senalV,P1senalA,...
    handles.axHt,handles.axHf,handles.axVt,handles.axVf,...
    handles.axAt,handles.axAf,handles.vecModo);

guidata(hObject, handles);


% --- Executes on button press in rbtn36.
function rbtn36_Callback(hObject, eventdata, handles)

rpm=3600;handles.rpm=rpm;
handles.vecRpm=[0 0 get(hObject,'Value') 0 rpm];set(handles.etxtOtro,'Enable','off');
handles.vecRuido=[get(handles.sldPeriodos,'Value') get(handles.sldRuido,'Value')];
handles.vecModo=[get(handles.rbtnX,'Value') get(handles.rbtnV,'Value') get(handles.rbtnA,'Value')];
flgApertura=handles.flgFallas;

[t,senalH,senalV,senalA,f,P1senalH,P1senalV,P1senalA]=calculaSimulacion(handles.vecRpm,...
    handles.vecRuido,handles.vecModo,flgApertura);

graficaSimulacion(t,senalH,senalV,senalA,...
    f,P1senalH,P1senalV,P1senalA,...
    handles.axHt,handles.axHf,handles.axVt,handles.axVf,...
    handles.axAt,handles.axAf,handles.vecModo);

guidata(hObject, handles);


% --- Executes on button press in rbtnOtro.
function rbtnOtro_Callback(hObject, eventdata, handles)

set(handles.etxtOtro,'Enable','on');
rpm=str2double(get(handles.etxtOtro,'String'));handles.rpm=rpm;
handles.vecRpm=[0 0 0 get(hObject,'Value') rpm];
handles.vecRuido=[get(handles.sldPeriodos,'Value') get(handles.sldRuido,'Value')];
handles.vecModo=[get(handles.rbtnX,'Value') get(handles.rbtnV,'Value') get(handles.rbtnA,'Value')];
flgApertura=handles.flgFallas;

[t,senalH,senalV,senalA,f,P1senalH,P1senalV,P1senalA]=calculaSimulacion(handles.vecRpm,...
    handles.vecRuido,handles.vecModo,flgApertura);

graficaSimulacion(t,senalH,senalV,senalA,...
    f,P1senalH,P1senalV,P1senalA,...
    handles.axHt,handles.axHf,handles.axVt,handles.axVf,...
    handles.axAt,handles.axAf,handles.vecModo);

guidata(hObject, handles);


% --- Executes on button press in rbtnX.
function rbtnX_Callback(hObject, eventdata, handles)
% hObject    handle to rbtnX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

rpm=handles.rpm;
handles.vecRpm=[get(handles.rbtn12,'Value') get(handles.rbtn18,'Value')...
    get(handles.rbtn36,'Value') get(handles.rbtnOtro,'Value') rpm];
handles.vecRuido=[get(handles.sldPeriodos,'Value') get(handles.sldRuido,'Value')];
handles.vecModo=[get(hObject,'Value') 0 0];
flgApertura=handles.flgFallas;

[t,senalH,senalV,senalA,f,P1senalH,P1senalV,P1senalA]=calculaSimulacion(handles.vecRpm,...
    handles.vecRuido,handles.vecModo,flgApertura);

graficaSimulacion(t,senalH,senalV,senalA,...
    f,P1senalH,P1senalV,P1senalA,...
    handles.axHt,handles.axHf,handles.axVt,handles.axVf,...
    handles.axAt,handles.axAf,handles.vecModo);

guidata(hObject, handles);

% Hint: get(hObject,'Value') returns toggle state of rbtnX


% --- Executes on button press in rbtnV.
function rbtnV_Callback(hObject, eventdata, handles)
% hObject    handle to rbtnV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

rpm=handles.rpm;
handles.vecRpm=[get(handles.rbtn12,'Value') get(handles.rbtn18,'Value')...
    get(handles.rbtn36,'Value') get(handles.rbtnOtro,'Value') rpm];
handles.vecRuido=[get(handles.sldPeriodos,'Value') get(handles.sldRuido,'Value')];
handles.vecModo=[0 get(hObject,'Value') 0];
flgApertura=handles.flgFallas;

[t,senalH,senalV,senalA,f,P1senalH,P1senalV,P1senalA]=calculaSimulacion(handles.vecRpm,...
    handles.vecRuido,handles.vecModo,flgApertura);

graficaSimulacion(t,senalH,senalV,senalA,...
    f,P1senalH,P1senalV,P1senalA,...
    handles.axHt,handles.axHf,handles.axVt,handles.axVf,...
    handles.axAt,handles.axAf,handles.vecModo);

guidata(hObject, handles);

% Hint: get(hObject,'Value') returns toggle state of rbtnV


% --- Executes on button press in rbtnA.
function rbtnA_Callback(hObject, eventdata, handles)
% hObject    handle to rbtnA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

rpm=handles.rpm;
handles.vecRpm=[get(handles.rbtn12,'Value') get(handles.rbtn18,'Value')...
    get(handles.rbtn36,'Value') get(handles.rbtnOtro,'Value') rpm];
handles.vecRuido=[get(handles.sldPeriodos,'Value') get(handles.sldRuido,'Value')];
handles.vecModo=[0 0 get(hObject,'Value')];
flgApertura=handles.flgFallas;

[t,senalH,senalV,senalA,f,P1senalH,P1senalV,P1senalA]=calculaSimulacion(handles.vecRpm,...
    handles.vecRuido,handles.vecModo,flgApertura);

graficaSimulacion(t,senalH,senalV,senalA,...
    f,P1senalH,P1senalV,P1senalA,...
    handles.axHt,handles.axHf,handles.axVt,handles.axVf,...
    handles.axAt,handles.axAf,handles.vecModo);

guidata(hObject, handles);

% Hint: get(hObject,'Value') returns toggle state of rbtnA
