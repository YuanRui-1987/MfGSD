function varargout = myAPPLogin01(varargin)
% MYAPPLOGIN01 MATLAB code for myAPPLogin01.fig
%      MYAPPLOGIN01, by itself, creates a new MYAPPLOGIN01 or raises the existing
%      singleton*.
%
%      H = MYAPPLOGIN01 returns the handle to a new MYAPPLOGIN01 or the handle to
%      the existing singleton*.
%
%      MYAPPLOGIN01('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYAPPLOGIN01.M with the given input arguments.
%
%      MYAPPLOGIN01('Property','Value',...) creates a new MYAPPLOGIN01 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before myAPPLogin01_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to myAPPLogin01_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help myAPPLogin01

% Last Modified by GUIDE v2.5 16-Jul-2024 14:10:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @myAPPLogin01_OpeningFcn, ...
                   'gui_OutputFcn',  @myAPPLogin01_OutputFcn, ...
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


% --- Executes just before myAPPLogin01 is made visible.
function myAPPLogin01_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to myAPPLogin01 (see VARARGIN)

% Choose default command line output for myAPPLogin01
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes myAPPLogin01 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = myAPPLogin01_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function UsernameEditField_Callback(hObject, eventdata, handles)
% hObject    handle to UsernameEditField (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of UsernameEditField as text
%        str2double(get(hObject,'String')) returns contents of UsernameEditField as a double


% --- Executes during object creation, after setting all properties.
function UsernameEditField_CreateFcn(hObject, eventdata, handles)
% hObject    handle to UsernameEditField (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PasswordEditField_Callback(hObject, eventdata, handles)
% hObject    handle to PasswordEditField (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PasswordEditField as text
%        str2double(get(hObject,'String')) returns contents of PasswordEditField as a double


% --- Executes during object creation, after setting all properties.
function PasswordEditField_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PasswordEditField (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Loginpushbutton.
function Loginpushbutton_Callback(hObject, eventdata, handles)
% hObject    �� Loginpushbutton �ؼ��ľ�������ڷ��ʿؼ������Ժͷ���
% eventdata  ���� - ���� MATLAB �汾�ж���
% handles    ����������û����ݵĽṹ�壬���ڷ��ʻص������ⲿ����ı���

% �� GUI ����л�ȡ�û�������������
% ��ȡ�û���������ֵ
username = handles.UsernameEditField.Value;  
% ��ȡ����������ֵ
password = handles.PasswordEditField.Value;  

% ������ȷ���û���Ϊ'user'������Ϊ'password'
% ���������û����������Ƿ���ȷ
if strcmp(username, 'user') && strcmp(password, 'password')
    % ����û�����������ȷ����ʾ��¼�ɹ�����ʾ
    % ����һ���µ�ͼ�δ���
    fig = uifigure;  
    % ��ʾ�ɹ�����ʾ��Ϣ
    uialert(fig, 'Login Successful��', 'Successful');  
else
    % ����û��������������ʾ������ʾ
    % ����һ���µ�ͼ�δ���
    fig = uifigure;  
     % ��ʾ�������ʾ��Ϣ
    uialert(fig, 'Username or Password Incorrect', 'Incorrect'); 
end

% --- Executes on button press in Registerpushbutton.
function Registerpushbutton_Callback(hObject, eventdata, handles)
% hObject    �� Registerpushbutton �ؼ��ľ�������ڷ��ʿؼ������Ժͷ���
% eventdata  ���� - ���� MATLAB �汾�ж���
% handles    ����������û����ݵĽṹ�壬���ڷ��ʻص������ⲿ����ı���

% ��������Ի������ʾ��Ϣ�ͱ���
prompt = {'Enter Username:','Enter Password:', 'Confirm Password:'};
dlgtitle = 'Register';
% ����Ի���ĳߴ�
dims = [1 35];
% ��������Ի��򣬻�ȡ�û������ע����Ϣ
answer = inputdlg(prompt, dlgtitle, dims);

% ����û�����ˡ�ȡ�������� answer Ϊ��
if ~isempty(answer)
    % �û���
    username = answer{1};  
    % ����
    password = answer{2};  
    % ȷ������
    confirmPassword = answer{3};  

    % �����������������Ƿ�һ��
    if ~strcmp(password, confirmPassword)
        fig = uifigure;
        uialert(fig, 'The password and confirmation password do not match!', 'Failed');
        return;
    end

    % ���ú����������ǿ��
    if ~isValidPassword(password)
        fig = uifigure;
        uialert(fig, 'The password must contain at least one number, one uppercase letter, and one lowercase letter!', 'Failed');
        return;
    end

    % ���������ͨ������ʾע��ɹ�����ʾ
    fig = uifigure;
    uialert(fig, 'Registration Successful!', 'Successful');
else
    % ����û�����ˡ�ȡ��������ʾע��ʧ�ܵ���ʾ
    fig = uifigure;
    uialert(fig, 'Registration Failed', 'Failed');
end

% ������ isValidPassword �����Ķ��壬���ڼ�������Ƿ����Ҫ��
function valid = isValidPassword(password)
% ����Ƿ����ٰ���һ����д��ĸ
hasUpperCase = ~isempty(regexp(password, '[A-Z]', 'once'));  
% ����Ƿ����ٰ���һ��Сд��ĸ
hasLowerCase = ~isempty(regexp(password, '[a-z]', 'once'));  
% ����Ƿ����ٰ���һ������
hasDigit = ~isempty(regexp(password, '[0-9]', 'once'));  
% ���������Ƿ���Ч
valid = hasUpperCase && hasLowerCase && hasDigit;  

% --- Executes on button press in Resetpushbutton.
function Resetpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Resetpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'Enter Username��'};
dlgtitle = 'Forgot Password';
dims = [1 35];
answer = inputdlg(prompt, dlgtitle, dims);

% ��������������һ�������߼������緢������������ʼ�
if ~isempty(answer)
    fig = uifigure;
    uialert(fig, 'A password reset link has been sent to your email.��', 'Successful');
else
    fig = uifigure;
    uialert(fig, 'Password Recovery Failed', 'Failed');
end
