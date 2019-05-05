function varargout = SFV_rms(varargin)
% SFV_RMS MATLAB code for SFV_rms.fig
%      SFV_RMS, by itself, creates a new SFV_RMS or raises the existing
%      singleton*.
%
%      H = SFV_RMS returns the handle to a new SFV_RMS or the handle to
%      the existing singleton*.
%
%      SFV_RMS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SFV_RMS.M with the given input arguments.
%
%      SFV_RMS('Property','Value',...) creates a new SFV_RMS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SFV_rms_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SFV_rms_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SFV_rms

% Last Modified by GUIDE v2.5 27-Apr-2019 17:57:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SFV_rms_OpeningFcn, ...
                   'gui_OutputFcn',  @SFV_rms_OutputFcn, ...
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


% --- Executes just before SFV_rms is made visible.
function SFV_rms_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SFV_rms (see VARARGIN)

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
    axes(handles.axLogorms);
    imshow(rgbImage,[]);
end

set(handles.rbtnMotor,'Value',1);set(handles.rbtnBomba,'Value',0);
set(handles.rbtnGrupo1,'Value',1,'Enable','on');
set(handles.rbtnGrupo2,'Value',0,'Enable','on');
set(handles.rbtnGrupo3,'Value',0,'Enable','off');
set(handles.rbtnGrupo4,'Value',0,'Enable','off');
set(handles.rbtnRigido,'Value',1);set(handles.rbtnFlexible,'Value',0);

xSenalHRms=rms(getappdata(0,'xSenalH'));
set(handles.etxtXh,'String',num2str(xSenalHRms));
xSenalVRms=rms(getappdata(0,'xSenalV'));
set(handles.etxtXv,'String',num2str(rms(xSenalVRms)));
xSenalARms=rms(getappdata(0,'xSenalA'));
set(handles.etxtXa,'String',num2str(xSenalARms));

vSenalHRms=rms(getappdata(0,'vSenalH'));
set(handles.etxtVh,'String',num2str(vSenalHRms));
vSenalVRms=rms(getappdata(0,'vSenalV'));
set(handles.etxtVv,'String',num2str(vSenalVRms));
vSenalARms=rms(getappdata(0,'vSenalA'));
set(handles.etxtVa,'String',num2str(vSenalARms));

aSenalHRms=rms(getappdata(0,'aSenalH'));
set(handles.etxtAh,'String',num2str(aSenalHRms));
aSenalVRms=rms(getappdata(0,'aSenalV'));
set(handles.etxtAv,'String',num2str(aSenalVRms));
aSenalARms=rms(getappdata(0,'aSenalA'));
set(handles.etxtAa,'String',num2str(aSenalARms));

handles.senalHRms=vSenalHRms;handles.senalVRms=vSenalVRms;handles.senalARms=vSenalARms;

handles.vecZona=[get(handles.rbtnMotor,'Value') get(handles.rbtnBomba,'Value')...
    get(handles.rbtnGrupo1,'Value') get(handles.rbtnGrupo2,'Value')...
    get(handles.rbtnGrupo3,'Value') get(handles.rbtnGrupo4,'Value')...
    get(handles.rbtnRigido,'Value') get(handles.rbtnFlexible,'Value')];

calculaZona(handles.vecZona,...
    vSenalHRms,vSenalVRms,vSenalARms,...
    handles.etxtZh,handles.etxtZv,handles.etxtZa);

% Choose default command line output for SFV_rms
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SFV_rms wait for user response (see UIRESUME)
% uiwait(handles.vtnRms);


% --- Outputs from this function are returned to the command line.
function varargout = SFV_rms_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function etxtXh_Callback(hObject, eventdata, handles)
% hObject    handle to etxtXh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of etxtXh as text
%        str2double(get(hObject,'String')) returns contents of etxtXh as a double


% --- Executes during object creation, after setting all properties.
function etxtXh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to etxtXh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function etxtVh_Callback(hObject, eventdata, handles)
% hObject    handle to etxtVh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of etxtVh as text
%        str2double(get(hObject,'String')) returns contents of etxtVh as a double


% --- Executes during object creation, after setting all properties.
function etxtVh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to etxtVh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function etxtAh_Callback(hObject, eventdata, handles)
% hObject    handle to etxtAh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of etxtAh as text
%        str2double(get(hObject,'String')) returns contents of etxtAh as a double


% --- Executes during object creation, after setting all properties.
function etxtAh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to etxtAh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function etxtXv_Callback(hObject, eventdata, handles)
% hObject    handle to etxtXv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of etxtXv as text
%        str2double(get(hObject,'String')) returns contents of etxtXv as a double


% --- Executes during object creation, after setting all properties.
function etxtXv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to etxtXv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function etxtVv_Callback(hObject, eventdata, handles)
% hObject    handle to etxtVv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of etxtVv as text
%        str2double(get(hObject,'String')) returns contents of etxtVv as a double


% --- Executes during object creation, after setting all properties.
function etxtVv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to etxtVv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function etxtAv_Callback(hObject, eventdata, handles)
% hObject    handle to etxtAv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of etxtAv as text
%        str2double(get(hObject,'String')) returns contents of etxtAv as a double


% --- Executes during object creation, after setting all properties.
function etxtAv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to etxtAv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function etxtXa_Callback(hObject, eventdata, handles)
% hObject    handle to etxtXa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of etxtXa as text
%        str2double(get(hObject,'String')) returns contents of etxtXa as a double


% --- Executes during object creation, after setting all properties.
function etxtXa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to etxtXa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function etxtVa_Callback(hObject, eventdata, handles)
% hObject    handle to etxtVa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of etxtVa as text
%        str2double(get(hObject,'String')) returns contents of etxtVa as a double


% --- Executes during object creation, after setting all properties.
function etxtVa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to etxtVa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function etxtAa_Callback(hObject, eventdata, handles)
% hObject    handle to etxtAa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of etxtAa as text
%        str2double(get(hObject,'String')) returns contents of etxtAa as a double


% --- Executes during object creation, after setting all properties.
function etxtAa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to etxtAa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnSeveridad.
function btnSeveridad_Callback(hObject, eventdata, handles)

cartaSeveridad;

% hObject    handle to btnSeveridad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function etxtZh_Callback(hObject, eventdata, handles)
% hObject    handle to etxtZh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of etxtZh as text
%        str2double(get(hObject,'String')) returns contents of etxtZh as a double


% --- Executes during object creation, after setting all properties.
function etxtZh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to etxtZh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function etxtZv_Callback(hObject, eventdata, handles)
% hObject    handle to etxtZv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of etxtZv as text
%        str2double(get(hObject,'String')) returns contents of etxtZv as a double


% --- Executes during object creation, after setting all properties.
function etxtZv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to etxtZv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function etxtZa_Callback(hObject, eventdata, handles)
% hObject    handle to etxtZa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of etxtZa as text
%        str2double(get(hObject,'String')) returns contents of etxtZa as a double


% --- Executes during object creation, after setting all properties.
function etxtZa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to etxtZa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in rbtnMotor.
function rbtnMotor_Callback(hObject, eventdata, handles)
% hObject    handle to rbtnMotor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.rbtnBomba,'Value',0)
set(handles.rbtnGrupo1,'Value',1,'Enable','on');
set(handles.rbtnGrupo2,'Value',0,'Enable','on');
set(handles.rbtnGrupo3,'Value',0,'Enable','off');
set(handles.rbtnGrupo4,'Value',0,'Enable','off');

vSenalHRms=handles.senalHRms;vSenalVRms=handles.senalVRms;vSenalARms=handles.senalARms;

handles.vecZona=[get(hObject,'Value') get(handles.rbtnBomba,'Value')...
    get(handles.rbtnGrupo1,'Value') get(handles.rbtnGrupo2,'Value')...
    get(handles.rbtnGrupo3,'Value') get(handles.rbtnGrupo4,'Value')...
    get(handles.rbtnRigido,'Value') get(handles.rbtnFlexible,'Value')];

calculaZona(handles.vecZona,...
    vSenalHRms,vSenalVRms,vSenalARms,...
    handles.etxtZh,handles.etxtZv,handles.etxtZa);

% Choose default command line output for SFV_rms
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Hint: get(hObject,'Value') returns toggle state of rbtnMotor


% --- Executes on button press in rbtnBomba.
function rbtnBomba_Callback(hObject, eventdata, handles)
% hObject    handle to rbtnBomba (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.rbtnMotor,'Value',0)
set(handles.rbtnGrupo1,'Value',0,'Enable','off');
set(handles.rbtnGrupo2,'Value',0,'Enable','off');
set(handles.rbtnGrupo3,'Value',1,'Enable','on');
set(handles.rbtnGrupo4,'Value',0,'Enable','on');

vSenalHRms=handles.senalHRms;vSenalVRms=handles.senalVRms;vSenalARms=handles.senalARms;

handles.vecZona=[get(handles.rbtnMotor,'Value') get(hObject,'Value')...
    get(handles.rbtnGrupo1,'Value') get(handles.rbtnGrupo2,'Value')...
    get(handles.rbtnGrupo3,'Value') get(handles.rbtnGrupo4,'Value')...
    get(handles.rbtnRigido,'Value') get(handles.rbtnFlexible,'Value')];

calculaZona(handles.vecZona,...
    vSenalHRms,vSenalVRms,vSenalARms,...
    handles.etxtZh,handles.etxtZv,handles.etxtZa);

% Choose default command line output for SFV_rms
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Hint: get(hObject,'Value') returns toggle state of rbtnBomba


% --- Executes on button press in rbtnGrupo1.
function rbtnGrupo1_Callback(hObject, eventdata, handles)
% hObject    handle to rbtnGrupo1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

vSenalHRms=handles.senalHRms;vSenalVRms=handles.senalVRms;vSenalARms=handles.senalARms;

handles.vecZona=[get(handles.rbtnMotor,'Value') get(handles.rbtnBomba,'Value')...
    get(hObject,'Value') get(handles.rbtnGrupo2,'Value')...
    get(handles.rbtnGrupo3,'Value') get(handles.rbtnGrupo4,'Value')...
    get(handles.rbtnRigido,'Value') get(handles.rbtnFlexible,'Value')];

calculaZona(handles.vecZona,...
    vSenalHRms,vSenalVRms,vSenalARms,...
    handles.etxtZh,handles.etxtZv,handles.etxtZa);

% Choose default command line output for SFV_rms
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Hint: get(hObject,'Value') returns toggle state of rbtnGrupo1


% --- Executes on button press in rbtnGrupo2.
function rbtnGrupo2_Callback(hObject, eventdata, handles)
% hObject    handle to rbtnGrupo2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

vSenalHRms=handles.senalHRms;vSenalVRms=handles.senalVRms;vSenalARms=handles.senalARms;

handles.vecZona=[get(handles.rbtnMotor,'Value') get(handles.rbtnBomba,'Value')...
    get(handles.rbtnGrupo1,'Value') get(hObject,'Value')...
    get(handles.rbtnGrupo3,'Value') get(handles.rbtnGrupo4,'Value')...
    get(handles.rbtnRigido,'Value') get(handles.rbtnFlexible,'Value')];

calculaZona(handles.vecZona,...
    vSenalHRms,vSenalVRms,vSenalARms,...
    handles.etxtZh,handles.etxtZv,handles.etxtZa);

% Choose default command line output for SFV_rms
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Hint: get(hObject,'Value') returns toggle state of rbtnGrupo2


% --- Executes on button press in rbtnGrupo3.
function rbtnGrupo3_Callback(hObject, eventdata, handles)
% hObject    handle to rbtnGrupo3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

vSenalHRms=handles.senalHRms;vSenalVRms=handles.senalVRms;vSenalARms=handles.senalARms;

handles.vecZona=[get(handles.rbtnMotor,'Value') get(handles.rbtnBomba,'Value')...
    get(handles.rbtnGrupo1,'Value') get(handles.rbtnGrupo2,'Value')...
    get(hObject,'Value') get(handles.rbtnGrupo4,'Value')...
    get(handles.rbtnRigido,'Value') get(handles.rbtnFlexible,'Value')];

calculaZona(handles.vecZona,...
    vSenalHRms,vSenalVRms,vSenalARms,...
    handles.etxtZh,handles.etxtZv,handles.etxtZa);

% Choose default command line output for SFV_rms
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Hint: get(hObject,'Value') returns toggle state of rbtnGrupo3


% --- Executes on button press in rbtnGrupo4.
function rbtnGrupo4_Callback(hObject, eventdata, handles)
% hObject    handle to rbtnGrupo4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

vSenalHRms=handles.senalHRms;vSenalVRms=handles.senalVRms;vSenalARms=handles.senalARms;

handles.vecZona=[get(handles.rbtnMotor,'Value') get(handles.rbtnBomba,'Value')...
    get(handles.rbtnGrupo1,'Value') get(handles.rbtnGrupo2,'Value')...
    get(handles.rbtnGrupo3,'Value') get(hObject,'Value')...
    get(handles.rbtnRigido,'Value') get(handles.rbtnFlexible,'Value')];

calculaZona(handles.vecZona,...
    vSenalHRms,vSenalVRms,vSenalARms,...
    handles.etxtZh,handles.etxtZv,handles.etxtZa);

% Choose default command line output for SFV_rms
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Hint: get(hObject,'Value') returns toggle state of rbtnGrupo4


% --- Executes on button press in rbtnRigido.
function rbtnRigido_Callback(hObject, eventdata, handles)
% hObject    handle to rbtnRigido (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

vSenalHRms=handles.senalHRms;vSenalVRms=handles.senalVRms;vSenalARms=handles.senalARms;

handles.vecZona=[get(handles.rbtnMotor,'Value') get(handles.rbtnBomba,'Value')...
    get(handles.rbtnGrupo1,'Value') get(handles.rbtnGrupo2,'Value')...
    get(handles.rbtnGrupo3,'Value') get(handles.rbtnGrupo4,'Value')...
    get(hObject,'Value') get(handles.rbtnFlexible,'Value')];

calculaZona(handles.vecZona,...
    vSenalHRms,vSenalVRms,vSenalARms,...
    handles.etxtZh,handles.etxtZv,handles.etxtZa);

% Choose default command line output for SFV_rms
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Hint: get(hObject,'Value') returns toggle state of rbtnRigido


% --- Executes on button press in rbtnFlexible.
function rbtnFlexible_Callback(hObject, eventdata, handles)
% hObject    handle to rbtnFlexible (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

vSenalHRms=handles.senalHRms;vSenalVRms=handles.senalVRms;vSenalARms=handles.senalARms;

handles.vecZona=[get(handles.rbtnMotor,'Value') get(handles.rbtnBomba,'Value')...
    get(handles.rbtnGrupo1,'Value') get(handles.rbtnGrupo2,'Value')...
    get(handles.rbtnGrupo3,'Value') get(handles.rbtnGrupo4,'Value')...
    get(handles.rbtnRigido,'Value') get(hObject,'Value')];

calculaZona(handles.vecZona,...
    vSenalHRms,vSenalVRms,vSenalARms,...
    handles.etxtZh,handles.etxtZv,handles.etxtZa);

% Choose default command line output for SFV_rms
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Hint: get(hObject,'Value') returns toggle state of rbtnFlexible
