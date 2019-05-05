function varargout = SFV_fallas(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SFV_fallas_OpeningFcn, ...
                   'gui_OutputFcn',  @SFV_fallas_OutputFcn, ...
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

function SFV_fallas_OpeningFcn(hObject, eventdata, handles, varargin)

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
    axes(handles.axLogofallas);
    imshow(rgbImage,[]);
end

handles.output = hObject;
guidata(hObject, handles);

function varargout = SFV_fallas_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;

% *************************************************************************

% -------------------------------------------------------------------------
%                                  CHECK BOX

function chbxDesEst_Callback(hObject, eventdata, handles)

handles.vecFallas=[get(hObject,'Value') get(handles.chbxDesDin,'Value')...
    get(handles.chbxDesPar,'Value') get(handles.chbxDesAng,'Value')...
    get(handles.chbxDesGra,'Value') get(handles.chbxDesRot,'Value') get(handles.chbxDesAco,'Value')...
    get(handles.chbxRotExc,'Value') get(handles.chbxEjeDob,'Value')];

setappdata(0,'vecFallas',handles.vecFallas);

guidata(hObject, handles);

function chbxDesDin_Callback(hObject, eventdata, handles)

handles.vecFallas=[get(handles.chbxDesEst,'Value') get(hObject,'Value')...
    get(handles.chbxDesPar,'Value') get(handles.chbxDesAng,'Value')...
    get(handles.chbxDesGra,'Value') get(handles.chbxDesRot,'Value') get(handles.chbxDesAco,'Value')...
    get(handles.chbxRotExc,'Value') get(handles.chbxEjeDob,'Value')];

setappdata(0,'vecFallas',handles.vecFallas);

guidata(hObject, handles);

function chbxDesPar_Callback(hObject, eventdata, handles)

handles.vecFallas=[get(handles.chbxDesEst,'Value') get(handles.chbxDesDin,'Value')...
    get(hObject,'Value') get(handles.chbxDesAng,'Value')...
    get(handles.chbxDesGra,'Value') get(handles.chbxDesRot,'Value') get(handles.chbxDesAco,'Value')...
    get(handles.chbxRotExc,'Value') get(handles.chbxEjeDob,'Value')];

setappdata(0,'vecFallas',handles.vecFallas);

guidata(hObject, handles);

function chbxDesAng_Callback(hObject, eventdata, handles)

handles.vecFallas=[get(handles.chbxDesEst,'Value') get(handles.chbxDesDin,'Value')...
    get(handles.chbxDesPar,'Value') get(hObject,'Value')...
    get(handles.chbxDesGra,'Value') get(handles.chbxDesRot,'Value') get(handles.chbxDesAco,'Value')...
    get(handles.chbxRotExc,'Value') get(handles.chbxEjeDob,'Value')];

setappdata(0,'vecFallas',handles.vecFallas);

guidata(hObject, handles);

function chbxDesGra_Callback(hObject, eventdata, handles)

handles.vecFallas=[get(handles.chbxDesEst,'Value') get(handles.chbxDesDin,'Value')...
    get(handles.chbxDesPar,'Value') get(handles.chbxDesAng,'Value')...
    get(hObject,'Value') get(handles.chbxDesRot,'Value') get(handles.chbxDesAco,'Value')...
    get(handles.chbxRotExc,'Value') get(handles.chbxEjeDob,'Value')];

setappdata(0,'vecFallas',handles.vecFallas);

guidata(hObject, handles);

function chbxDesRot_Callback(hObject, eventdata, handles)

handles.vecFallas=[get(handles.chbxDesEst,'Value') get(handles.chbxDesDin,'Value')...
    get(handles.chbxDesPar,'Value') get(handles.chbxDesAng,'Value')...
    get(handles.chbxDesGra,'Value') get(hObject,'Value') get(handles.chbxDesAco,'Value')...
    get(handles.chbxRotExc,'Value') get(handles.chbxEjeDob,'Value')];

setappdata(0,'vecFallas',handles.vecFallas);

guidata(hObject, handles);

function chbxDesAco_Callback(hObject, eventdata, handles)

handles.vecFallas=[get(handles.chbxDesEst,'Value') get(handles.chbxDesDin,'Value')...
    get(handles.chbxDesPar,'Value') get(handles.chbxDesAng,'Value')...
    get(handles.chbxDesGra,'Value') get(handles.chbxDesRot,'Value') get(hObject,'Value')...
    get(handles.chbxRotExc,'Value') get(handles.chbxEjeDob,'Value')];

setappdata(0,'vecFallas',handles.vecFallas);

guidata(hObject, handles);

function chbxRotExc_Callback(hObject, eventdata, handles)

handles.vecFallas=[get(handles.chbxDesEst,'Value') get(handles.chbxDesDin,'Value')...
    get(handles.chbxDesPar,'Value') get(handles.chbxDesAng,'Value')...
    get(handles.chbxDesGra,'Value') get(handles.chbxDesRot,'Value') get(handles.chbxDesAco,'Value')...
    get(hObject,'Value') get(handles.chbxEjeDob,'Value')];

setappdata(0,'vecFallas',handles.vecFallas);

guidata(hObject, handles);

function chbxEjeDob_Callback(hObject, eventdata, handles)

handles.vecFallas=[get(handles.chbxDesEst,'Value') get(handles.chbxDesDin,'Value')...
    get(handles.chbxDesPar,'Value') get(handles.chbxDesAng,'Value')...
    get(handles.chbxDesGra,'Value') get(handles.chbxDesRot,'Value') get(handles.chbxDesAco,'Value')...
    get(handles.chbxRotExc,'Value') get(hObject,'Value')];

setappdata(0,'vecFallas',handles.vecFallas);

guidata(hObject, handles);
