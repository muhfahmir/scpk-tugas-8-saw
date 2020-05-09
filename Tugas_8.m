function varargout = Tugas_8(varargin)
% TUGAS_8 MATLAB code for Tugas_8.fig
%      TUGAS_8, by itself, creates a new TUGAS_8 or raises the existing
%      singleton*.
%
%      H = TUGAS_8 returns the handle to a new TUGAS_8 or the handle to
%      the existing singleton*.
%
%      TUGAS_8('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUGAS_8.M with the given input arguments.
%
%      TUGAS_8('Property','Value',...) creates a new TUGAS_8 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Tugas_8_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Tugas_8_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Tugas_8

% Last Modified by GUIDE v2.5 09-May-2020 16:30:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Tugas_8_OpeningFcn, ...
                   'gui_OutputFcn',  @Tugas_8_OutputFcn, ...
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


% --- Executes just before Tugas_8 is made visible.
function Tugas_8_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Tugas_8 (see VARARGIN)

% Choose default command line output for Tugas_8
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Tugas_8 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Tugas_8_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnTampilkan.
	
% hObject    handle to btnTampilkan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnTampilkan.
function btnTampilkan_Callback(hObject, eventdata, handles)
% hObject    handle to btnTampilkan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename = 'DataAlternatif.xlsx';
sheet = 1;
range = 'G5:K11';
dataku = xlsread(filename,sheet,range);%pembacaan isi excel
range = 'E5:E11';
dataku2 = xlsread(filename,sheet,range);%pembacaan isi excel
range = 'F5:F11';
[~,text] = xlsread(filename,sheet,range);%pembacaan isi excel
range = 'E5:K11';
[~,~,ReadData] = xlsread(filename,sheet,range);%pembacaan isi excel
 k = [0,1,1,1,1]; % 1 = benefit ,0 = cost
 w=[0.3,0.3,0.15,0.15,0.1];
 [m n]=size (dataku);
 R=zeros (m,n);
 Y=zeros (m,n);
 for j=1:n
     if k(j)==1 
         R(:,j)=dataku(:,j)./max(dataku(:,j));
     else
         R(:,j)=min(dataku(:,j))./dataku(:,j);
     end
 end
 for i=1:m
     V(i)= sum(w.*R(i,:));
 end
 for i=1:m
     if max(V)==V(i)
         data1 = dataku2(i);
         data2 = text(i);
         data3 = V(i);
     end 
 end
 char = int2str(data1);%merubah int to string
 hasil= transpose(V);%membuat menjadi baris
 xlswrite('HasilAkhir.xlsx', hasil);%isi excel
 ReadData2 = xlsread('HasilAkhir.xlsx');%pembacaan isi excel
 %isi rekomendasi
 set(handles.editNim,'string',char); 
 set(handles.editNama,'string',data2);
 set(handles.editHasil,'string',data3);
 set(handles.uitable1,'Data',ReadData);
 set(handles.uitable2,'Data',ReadData2);
 

 
