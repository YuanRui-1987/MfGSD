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
% hObject    是 Loginpushbutton 控件的句柄，用于访问控件的属性和方法
% eventdata  保留 - 将来 MATLAB 版本中定义
% handles    包含句柄和用户数据的结构体，用于访问回调函数外部定义的变量

% 从 GUI 组件中获取用户名和密码输入
% 获取用户名输入框的值
username = handles.UsernameEditField.Value;  
% 获取密码输入框的值
password = handles.PasswordEditField.Value;  

% 假设正确的用户名为'user'，密码为'password'
% 检查输入的用户名和密码是否正确
if strcmp(username, 'user') && strcmp(password, 'password')
    % 如果用户名和密码正确，显示登录成功的提示
    % 创建一个新的图形窗口
    fig = uifigure;  
    % 显示成功的提示信息
    uialert(fig, 'Login Successful！', 'Successful');  
else
    % 如果用户名或密码错误，显示错误提示
    % 创建一个新的图形窗口
    fig = uifigure;  
     % 显示错误的提示信息
    uialert(fig, 'Username or Password Incorrect', 'Incorrect'); 
end

% --- Executes on button press in Registerpushbutton.
function Registerpushbutton_Callback(hObject, eventdata, handles)
% hObject    是 Registerpushbutton 控件的句柄，用于访问控件的属性和方法
% eventdata  保留 - 将来 MATLAB 版本中定义
% handles    包含句柄和用户数据的结构体，用于访问回调函数外部定义的变量

% 定义输入对话框的提示信息和标题
prompt = {'Enter Username:','Enter Password:', 'Confirm Password:'};
dlgtitle = 'Register';
% 定义对话框的尺寸
dims = [1 35];
% 弹出输入对话框，获取用户输入的注册信息
answer = inputdlg(prompt, dlgtitle, dims);

% 如果用户点击了“取消”，则 answer 为空
if ~isempty(answer)
    % 用户名
    username = answer{1};  
    % 密码
    password = answer{2};  
    % 确认密码
    confirmPassword = answer{3};  

    % 检查两次输入的密码是否一致
    if ~strcmp(password, confirmPassword)
        fig = uifigure;
        uialert(fig, 'The password and confirmation password do not match!', 'Failed');
        return;
    end

    % 调用函数检查密码强度
    if ~isValidPassword(password)
        fig = uifigure;
        uialert(fig, 'The password must contain at least one number, one uppercase letter, and one lowercase letter!', 'Failed');
        return;
    end

    % 如果密码检查通过，显示注册成功的提示
    fig = uifigure;
    uialert(fig, 'Registration Successful!', 'Successful');
else
    % 如果用户点击了“取消”，显示注册失败的提示
    fig = uifigure;
    uialert(fig, 'Registration Failed', 'Failed');
end

% 以下是 isValidPassword 函数的定义，用于检查密码是否符合要求
function valid = isValidPassword(password)
% 检查是否至少包含一个大写字母
hasUpperCase = ~isempty(regexp(password, '[A-Z]', 'once'));  
% 检查是否至少包含一个小写字母
hasLowerCase = ~isempty(regexp(password, '[a-z]', 'once'));  
% 检查是否至少包含一个数字
hasDigit = ~isempty(regexp(password, '[0-9]', 'once'));  
% 返回密码是否有效
valid = hasUpperCase && hasLowerCase && hasDigit;  

% --- Executes on button press in Resetpushbutton.
function Resetpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Resetpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'Enter Username：'};
dlgtitle = 'Forgot Password';
dims = [1 35];
answer = inputdlg(prompt, dlgtitle, dims);

% 可以在这里添加找回密码的逻辑，例如发送重置密码的邮件
if ~isempty(answer)
    fig = uifigure;
    uialert(fig, 'A password reset link has been sent to your email.！', 'Successful');
else
    fig = uifigure;
    uialert(fig, 'Password Recovery Failed', 'Failed');
end
