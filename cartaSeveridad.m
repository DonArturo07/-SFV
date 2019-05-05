function varargout = cartaSeveridad(varargin)
% CARTASEVERIDAD MATLAB code for cartaSeveridad.fig
%      CARTASEVERIDAD, by itself, creates a new CARTASEVERIDAD or raises the existing
%      singleton*.
%
%      H = CARTASEVERIDAD returns the handle to a new CARTASEVERIDAD or the handle to
%      the existing singleton*.
%
%      CARTASEVERIDAD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CARTASEVERIDAD.M with the given input arguments.
%
%      CARTASEVERIDAD('Property','Value',...) creates a new CARTASEVERIDAD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cartaSeveridad_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cartaSeveridad_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cartaSeveridad

% Last Modified by GUIDE v2.5 27-Apr-2019 15:42:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cartaSeveridad_OpeningFcn, ...
                   'gui_OutputFcn',  @cartaSeveridad_OutputFcn, ...
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


% --- Executes just before cartaSeveridad is made visible.
function cartaSeveridad_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cartaSeveridad (see VARARGIN)

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
    axes(handles.axLogoCarta);
    imshow(rgbImage,[]);
end

folder=pwd;
baseFileName='Severidad_Carta.jpg';
fullFileName=fullfile(folder,baseFileName);
if ~exist(fullFileName,'file')
    fullFileName=baseFileName;
    if ~exist(fullFileName,'file')
        errorMessage=sprintf('Error: %s NO EXISTE',fullFileName);
        uiwait(warndlg(errorMessage));
    end
else
    rgbImage=imread(fullFileName);
    axes(handles.axSeveridad);
    imshow(rgbImage,[]);
end

% Choose default command line output for cartaSeveridad
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes cartaSeveridad wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = cartaSeveridad_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
