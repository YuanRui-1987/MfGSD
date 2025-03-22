function varargout = multifractal_gui01(varargin)
% MULTIFRACTAL_GUI01 MATLAB code for multifractal_gui01.fig
%      MULTIFRACTAL_GUI01, by itself, creates a new MULTIFRACTAL_GUI01 or raises the existing
%      singleton*.
%
%      H = MULTIFRACTAL_GUI01 returns the handle to a new MULTIFRACTAL_GUI01 or the handle to
%      the existing singleton*.
%
%      MULTIFRACTAL_GUI01('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MULTIFRACTAL_GUI01.M with the given input arguments.
%
%      MULTIFRACTAL_GUI01('Property','Value',...) creates a new MULTIFRACTAL_GUI01 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before multifractal_gui01_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to multifractal_gui01_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help multifractal_gui01

% Last Modified by GUIDE v2.5 16-Jun-2024 10:42:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @multifractal_gui01_OpeningFcn, ...
                   'gui_OutputFcn',  @multifractal_gui01_OutputFcn, ...
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


% --- Executes just before multifractal_gui01 is made visible.
function multifractal_gui01_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to multifractal_gui01 (see VARARGIN)

% Choose default command line output for multifractal_gui01
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes multifractal_gui01 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = multifractal_gui01_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filen,fpath] = uigetfile('*.xlsx');
if isequal(filen,0)
   disp('User selected Cancel');
else
   disp(['User selected ', fullfile(fpath,filen)]);
end

global fullf data1 selectednum;
selectednum = 1;
fullf = fullfile(fpath,filen);
% [data1,text] = xlsread('mutifractal_data01.xlsx', 'Sheet1', 'B1:CQ2'); %��ȡxlsx�ļ�ָ������
fullf = fullfile(fpath,filen);
[data1,text] = xlsread(fullf, 'Sheet1', 'A1:CQ3'); %��ȡxlsx�ļ�ָ������
[data1,text] = xlsread(fullf, 'Sheet1'); %��ȡxlsx�ļ�ָ������
datashow = data1(1:2,:);
set(handles.uitable1,'Data',datashow')
set(handles.uitable2,'Data',text(2:end)) %���������õ�uitable�ؼ�

k = 5; % ����ȡֵ1��2��3��4��5��6��
k=str2double(get(handles.edit4,'string'));
%q = 3;
ne = 2^k;

gs = datashow(1,:)'; %������С
gp = datashow(2,:)'/100;  %��Ӧ������С��ռ������

%gs_lg = log10(gs/min(gs));
gs_lg = log10(gs/0.02); %���ݶ�����
%gs_lg = (gs_lg-min(gs_lg))/max((gs_lg-min(gs_lg)))*5;
maxs_lg = max(gs_lg);
ee = maxs_lg/ne; %���������С

dps = 0.00001; %ȡһ����Сֵ����������������Ϊ0ʱ�޷�ȡ���������
qs = 10; %qֵ��ȡֵ���ֵ����ȡֵ�����������q=-qs��qs���������
qs=str2double(get(handles.edit5,'string'));
%���㲻ͬqֵ�Ķ��ط���������ָ���Ͷ�Ӧ���ط����׺�����ֵ
global alpha_q f_alpha_q;
for q = -qs:qs
    alpha_q(q+qs+1) = s_a_q(gs_lg,gp,q,ee,ne,dps);
    f_alpha_q(q+qs+1) = f_s_a_q(gs_lg,gp,q,ee,ne,dps);
end
%���ƶ��ط���������ָ���Ͷ�Ӧ���ط����׺�����ֵɢ��ͼ
% scatter(alpha_q,f_alpha_q)
% xlabel('$\alpha$','interpreter','latex', 'FontSize', 18);
% ylabel('$f(\alpha)$','interpreter','latex', 'FontSize', 18);

[alpha_q_max,i_max] = max(alpha_q);
[alpha_q_min,i_min] = min(alpha_q);
%������ط��������׵��׿�
d_a_q = alpha_q_max - alpha_q_min;
fprintf('���ط��������׵��׿�Ϊ%6.4f\n',d_a_q)
%������ط����׵���״����ֵ
d_f_a_q = f_s_a_q(gs_lg,gp,i_max-qs-1,ee,ne,dps)-f_s_a_q(gs_lg,gp,i_min-qs-1,ee,ne,dps);
fprintf('���ط����׵���״����ֵΪ%6.4f\n',d_f_a_q)

% ���㲻ͬqֵ�Ķ��ط��ι���ά����
q = 0;
d_q0 = f_d_q(gs_lg,gp,q,ee,ne,dps);
fprintf('D(0)ֵΪ%6.4f\n',d_q0)
q = 1;
d_q1 = f_d_q(gs_lg,gp,q,ee,ne,dps);
fprintf('D(1)ֵΪ%6.4f\n',d_q1)
q = 2;
d_q2 = f_d_q(gs_lg,gp,q,ee,ne,dps);
fprintf('D(2)ֵΪ%6.4f\n',d_q2)
%set(handles.edit3,'string',num2str(d_q2,'%6.4f'));
datashow3 = {text{2},d_q0,d_q1,d_q2,d_a_q,d_f_a_q};
set(handles.uitable3,'Data',datashow3)

% ����qȡֵ��-10��10��ʱ��Dֵ��������ɢ��ͼ
global qqq dq;
qqq = -qs:qs;
for i = 1:2*qs+1
    dq(i) = f_d_q(gs_lg,gp,qqq(i),ee,ne,dps);
end
% figure,
% scatter(qqq,dq)
% xlabel('$q$','interpreter','latex', 'FontSize', 18);
% ylabel('$D(q)$','interpreter','latex', 'FontSize', 18);
set(handles.text9,'String','���ݵ���ɹ�����ִ�л�ͼ�͵������')


% function edit1_Callback(hObject, eventdata, handles)
% % hObject    handle to edit1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of edit1 as text
% %        str2double(get(hObject,'String')) returns contents of edit1 as a double
% 
% 
% % --- Executes during object creation, after setting all properties.
% function edit1_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to edit1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end
% 
% 
% 
% function edit2_Callback(hObject, eventdata, handles)
% % hObject    handle to edit2 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of edit2 as text
% %        str2double(get(hObject,'String')) returns contents of edit2 as a double
% 
% 
% % --- Executes during object creation, after setting all properties.
% function edit2_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to edit2 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end
% 
% 
% 
% function edit3_Callback(hObject, eventdata, handles)
% % hObject    handle to edit3 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of edit3 as text
% %        str2double(get(hObject,'String')) returns contents of edit3 as a double
% 
% 
% % --- Executes during object creation, after setting all properties.
% function edit3_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to edit3 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% function edit6_Callback(hObject, eventdata, handles)
% % hObject    handle to edit6 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of edit6 as text
% %        str2double(get(hObject,'String')) returns contents of edit6 as a double
% 
% 
% % --- Executes during object creation, after setting all properties.
% function edit6_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to edit6 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end
% 
% 
% 
% function edit7_Callback(hObject, eventdata, handles)
% % hObject    handle to edit7 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of edit7 as text
% %        str2double(get(hObject,'String')) returns contents of edit7 as a double
% 
% 
% % --- Executes during object creation, after setting all properties.
% function edit7_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to edit7 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global qqq dq;
axes(handles.axes2)
scatter(qqq,dq)
xlabel('$q$','interpreter','latex', 'FontSize', 18);
ylabel('$D(q)$','interpreter','latex', 'FontSize', 18);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global alpha_q f_alpha_q;
axes(handles.axes1)
scatter(alpha_q,f_alpha_q)
xlabel('$\alpha$','interpreter','latex', 'FontSize', 18);
ylabel('$f(\alpha)$','interpreter','latex', 'FontSize', 18);


% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
Data = cell(2,2);
set(hObject, 'ColumnName', {'Grain size','Proportion (%)'},'data',Data) %���������õ�uitable�ؼ�


% --- Executes during object creation, after setting all properties.
function uitable2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
Data = cell(3,1); %�½�һ��3��1�е�Ԫ������
set(hObject, 'ColumnName', {'Data Number'}, 'data',Data) %���������õ�uitable�ؼ�


% --- Executes when selected cell(s) is changed in uitable2.
function uitable2_CellSelectionCallback(hObject, event, handles)
global data1 selectednum selectedCellValue;
% hObject    handle to uitable2 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
selectedRow = event.Indices;
selectednum = selectedRow(1);
% ��ȡѡ�е�Ԫ�������
tableData = get(hObject, 'Data');
selectedCellValue = tableData{selectedRow};
datashow = [data1(1,:);data1(selectedRow(1)+1,:)];
% set(handles.uitable1,'Data',datashow')

datashow1 = datashow;
for i = 2:size(datashow1,2)
    datashow1(2,i) = datashow1(2,i-1) + datashow1(2,i);
end
axes(handles.axes3)
hold on
plot(log10(datashow1(1,:)),datashow1(2,:))
axis ([-0.5, 3.4, 0, 105]);
xlabel('Grain size ($log_{10}$)','interpreter','latex', 'FontSize', 12);
ylabel('Accumulated proportion (\%)','interpreter','latex', 'FontSize', 12);

disp(['The selected cell data is: ', selectedCellValue]);

k = 5; % ����ȡֵ1��2��3��4��5��6��
k=str2double(get(handles.edit4,'string'));
%q = 3;
ne = 2^k;

gs = datashow(1,:)'; %������С
gp = datashow(2,:)'/100;  %��Ӧ������С��ռ������

%gs_lg = log10(gs/min(gs));
gs_lg = log10(gs/0.02); %���ݶ�����
%gs_lg = (gs_lg-min(gs_lg))/max((gs_lg-min(gs_lg)))*5;
maxs_lg = max(gs_lg);
ee = maxs_lg/ne; %���������С

dps = 0.00001; %ȡһ����Сֵ����������������Ϊ0ʱ�޷�ȡ���������
qs = 10; %qֵ��ȡֵ���ֵ����ȡֵ�����������q=-qs��qs���������
qs=str2double(get(handles.edit5,'string'));
%���㲻ͬqֵ�Ķ��ط���������ָ���Ͷ�Ӧ���ط����׺�����ֵ
global alpha_q f_alpha_q;
for q = -qs:qs
    alpha_q(q+qs+1) = s_a_q(gs_lg,gp,q,ee,ne,dps);
    f_alpha_q(q+qs+1) = f_s_a_q(gs_lg,gp,q,ee,ne,dps);
end
%���ƶ��ط���������ָ���Ͷ�Ӧ���ط����׺�����ֵɢ��ͼ
% scatter(alpha_q,f_alpha_q)
% xlabel('$\alpha$','interpreter','latex', 'FontSize', 18);
% ylabel('$f(\alpha)$','interpreter','latex', 'FontSize', 18);

[alpha_q_max,i_max] = max(alpha_q);
[alpha_q_min,i_min] = min(alpha_q);
%������ط��������׵��׿�
d_a_q = alpha_q_max - alpha_q_min;
% fprintf('���ط��������׵��׿�Ϊ%6.4f\n',d_a_q)
% set(handles.edit6,'string',num2str(d_a_q,'%6.4f'));
%������ط����׵���״����ֵ
d_f_a_q = f_s_a_q(gs_lg,gp,i_max-qs-1,ee,ne,dps)-f_s_a_q(gs_lg,gp,i_min-qs-1,ee,ne,dps);
% fprintf('���ط����׵���״����ֵΪ%6.4f\n',d_f_a_q)
% set(handles.edit7,'string',num2str(d_f_a_q,'%6.4f'));

% ���㲻ͬqֵ�Ķ��ط��ι���ά����
q = 0;
d_q0 = f_d_q(gs_lg,gp,q,ee,ne,dps);
% fprintf('D(0)ֵΪ%6.4f\n',d_q0)
% set(handles.edit1,'string',num2str(d_q0,'%6.4f'));
q = 1;
d_q1 = f_d_q(gs_lg,gp,q,ee,ne,dps);
% fprintf('D(1)ֵΪ%6.4f\n',d_q1)
% set(handles.edit2,'string',num2str(d_q1,'%6.4f'));
q = 2;
d_q2 = f_d_q(gs_lg,gp,q,ee,ne,dps);
% fprintf('D(2)ֵΪ%6.4f\n',d_q2)
% set(handles.edit3,'string',num2str(d_q2,'%6.4f'));
datashow3 = {selectedCellValue,d_q0,d_q1,d_q2,d_a_q,d_f_a_q};
set(handles.uitable3,'Data',datashow3)

% ����qȡֵ��-10��10��ʱ��Dֵ
global qqq dq;
qqq = -qs:qs;
for i = 1:2*qs+1
    dq(i) = f_d_q(gs_lg,gp,qqq(i),ee,ne,dps);
end

%����ͼ
axes(handles.axes2)
scatter(qqq,dq)
xlabel('$q$','interpreter','latex', 'FontSize', 18);
ylabel('$D(q)$','interpreter','latex', 'FontSize', 18);

%����ͼ
axes(handles.axes1)
scatter(alpha_q,f_alpha_q)
xlabel('$\alpha$','interpreter','latex', 'FontSize', 18);
ylabel('$f(\alpha)$','interpreter','latex', 'FontSize', 18);

set(handles.text9,'String',['�����л���',selectedCellValue,'�������µ������'])


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function file1_Callback(hObject, eventdata, handles)
% hObject    handle to file1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function draw1_Callback(hObject, eventdata, handles)
% hObject    handle to draw1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function help1_Callback(hObject, eventdata, handles)
% hObject    handle to help1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function usehelp1_Callback(hObject, eventdata, handles)
% hObject    handle to usehelp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% ������ʹ��˵��������
about_window = dialog('Position',[300,300,300,500],'Name','ʹ��˵��');
% ��ʹ��˵�������ڵ�����
txtstring1 = 'ʹ��˵���������������1.0';
txtstring2 = '���ݱ���б�����������࣬�����Կ���һ�����ݱ���б���ʾ�˵����ÿ��������Ψһ��š�';
txtstring3 = '������С��ռ�ȷ������������ݺ�������Զ�����ÿ��������������С���������������е�ռ�ȡ�';
txtstring4 = '��ͼ���򣺰���������ͼ��壬�ֱ���ƶ��ط���������ָ���Ͷ�Ӧ���ط����׺�����ֵɢ��ͼ�Ͳ�ͬqֵ�Ķ��ط��ι���ά���ס�';
txtstring5 = '���ܰ�ť���������������м��й��ܰ�ť�������򣬰���������Ҫ��ť�����ݵ��롢�������������1���������1������2���������2���Լ�kֵ�����qֵ��������';
txtstring6 = '������ʾ�����ڲ���������������ʾ��';
about_text1 = uicontrol('Parent',about_window,'Style','text','String',txtstring1,'Position',[25,460,260,30],'FontSize',12);
about_text2 = uicontrol('Parent',about_window,'Style','text','String',txtstring2,'Position',[25,400,260,60],'FontSize',12);
about_text3 = uicontrol('Parent',about_window,'Style','text','String',txtstring3,'Position',[25,330,260,70],'FontSize',12);
about_text4 = uicontrol('Parent',about_window,'Style','text','String',txtstring4,'Position',[25,260,260,80],'FontSize',12);
about_text5 = uicontrol('Parent',about_window,'Style','text','String',txtstring5,'Position',[25,160,260,100],'FontSize',12);
about_text6 = uicontrol('Parent',about_window,'Style','text','String',txtstring6,'Position',[25,120,260,40],'FontSize',12);
% �رհ�ť
close_btn = uicontrol('Parent',about_window,'Style','pushbutton','String','�ر�','Position',[120,20,60,30],'Callback',@closeAbout);

% --------------------------------------------------------------------
function about1_Callback(hObject, eventdata, handles)
% hObject    handle to about1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% ���������ڡ�����
about_window = dialog('Position',[300,300,300,200],'Name','����');
% �����ڡ����ڵ�����
about_text = uicontrol('Parent',about_window,'Style','text','String','�����������1.0','Position',[25,80,250,60],'FontSize',12);
% �رհ�ť
close_btn = uicontrol('Parent',about_window,'Style','pushbutton','String','�ر�','Position',[120,20,60,30],'Callback',@closeAbout);

function closeAbout(~,~)
    close(gcbf); % �رյ�ǰ����


% --- Executes during object creation, after setting all properties.
function uitable3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
Data = cell(1,6); %�½�һ��3��1�е�Ԫ������
set(hObject, 'ColumnName', {'���ݱ��','D(0)ֵ','D(1)ֵ','D(2)ֵ','�������׿�','�׵���״����ֵ'},'data',Data) %���������õ�uitable�ؼ�


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fullf dq alpha_q f_alpha_q selectednum;
posi02 = ['B',num2str(selectednum+1)];
xlswrite(fullf,dq,'Dq',posi02)
posi03 = ['C',num2str(2*selectednum-1)];
xlswrite(fullf,[alpha_q;f_alpha_q],'f_alpha_q',posi03)

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global qqq dq selectedCellValue;

newFig = figure('visible','off'); %����һ�����ɼ�fig
scatter(qqq,dq)
xlabel('$q$','interpreter','latex', 'FontSize', 18);
ylabel('$D(q)$','interpreter','latex', 'FontSize', 18);
% colorbar; %�ֶ����colorbar
legend(selectedCellValue); %�ֶ����legend
[file,location] = uiputfile('*.jpg');
if isequal(file,0) || isequal(location,0)
    disp('User clicked Cancel.')
else
    saveas(newFig,[location,file]); %������fig��ͼ��
    set(handles.text9,'String',['ͼƬ�����ѱ���','�ɵ���Ӧ�ļ��н������'])
    disp(['User selected ',fullfile(location,file),...
         ' and then clicked Save.'])
end

close(newFig); %�ر���fig


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global alpha_q f_alpha_q selectedCellValue;

newFig = figure('visible','off'); %����һ�����ɼ�fig
scatter(alpha_q,f_alpha_q)
xlabel('$\alpha$','interpreter','latex', 'FontSize', 18);
ylabel('$f(\alpha)$','interpreter','latex', 'FontSize', 18);
% colorbar; %�ֶ����colorbar
legend(selectedCellValue); %�ֶ����legend
[file,location] = uiputfile('*.jpg');
if isequal(file,0) || isequal(location,0)
    disp('User clicked Cancel.')
else
    saveas(newFig,[location,file]); %������fig��ͼ��
    set(handles.text9,'String',['ͼƬ�����ѱ���','�ɵ���Ӧ�ļ��н������'])
    disp(['User selected ',fullfile(location,file),...
         ' and then clicked Save.'])
end
close(newFig); %�ر���fig


function plprocess_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filen,fpath] = uigetfile('*.xlsx');
if isequal(filen,0)
   disp('User selected Cancel');
else
   disp(['User selected ', fullfile(fpath,filen)]);
end

% [data1,text] = xlsread('mutifractal_data01.xlsx', 'Sheet1', 'B1:CQ2'); %��ȡxlsx�ļ�ָ������
fullf = fullfile(fpath,filen);
[data1,text1] = xlsread(fullf, 'Sheet1', 'A2:QQ2'); %��ȡxlsx�ļ�ָ������
[data2,text2] = xlsread(fullf, 'Sheet1', 'B2:B333'); %��ȡxlsx�ļ�ָ������
zmstr = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
datalength = size(data1,2)+1;
if datalength>26
    posix = [zmstr(fix(datalength/26)),zmstr(rem(datalength,26))];
else
    posix = zmstr(datalength);
end
datasize = size(data2,1)+1;
posi01 = ['A1:',posix,num2str(datasize)];
[data11,text11] = xlsread(fullf, 'Sheet1', posi01); %��ȡxlsx�ļ�ָ������
gs = data11(1,:)'; %������С
gp = data11(2:end,:)'/100;  %��Ӧ������С��ռ������

gs_lg = log10(gs/0.02); %���ݶ�����
maxs_lg = max(gs_lg);
k = 5;
ne = 2^k;
ee = maxs_lg/ne; %���������С

dps = 0.00001; %ȡһ����Сֵ����������������Ϊ0ʱ�޷�ȡ���������
qs = 10; %qֵ��ȡֵ���ֵ����ȡֵ�����������q=-qs��qs���������

for i = 1:size(gp,2)
    for q = -qs:qs
        alpha_q(q+qs+1,i) = s_a_q(gs_lg,gp(:,i),q,ee,ne,dps);
        f_alpha_q(q+qs+1,i) = f_s_a_q(gs_lg,gp(:,i),q,ee,ne,dps);
        dq_q(q+qs+1,i) = f_d_q(gs_lg,gp(:,i),q,ee,ne,dps);
        
    end
    [alpha_q_max,i_max] = max(alpha_q(:,i));
    [alpha_q_min,i_min] = min(alpha_q(:,i));
    %������ط��������׵��׿�
    d_a_q = alpha_q_max - alpha_q_min;
    dq_q(q+qs+2,i) = d_a_q;
    d_f_a_q = f_s_a_q(gs_lg,gp(:,i),i_max-qs-1,ee,ne,dps)-f_s_a_q(gs_lg,gp,i_min-qs-1,ee,ne,dps);
    % ���ط����׵���״����ֵ
    dq_q(q+qs+3,i) = d_f_a_q;
    dq_q(q+qs+4,i) = dq_q(0+qs+1,i);
    dq_q(q+qs+5,i) = dq_q(1+qs+1,i);
    dq_q(q+qs+6,i) = dq_q(1+qs+2,i);
end

alpha_q_r = alpha_q';
f_alpha_q_r = f_alpha_q';
f_alpha_q_all(1:2:size(alpha_q_r,1)*2,:) = f_alpha_q_r;
f_alpha_q_all(2:2:size(alpha_q_r,1)*2,:) = alpha_q_r;
dq_q_r = dq_q';
% if qs*2+7>26
%     posi02 = ['B2:',zmstr(fix(datalength/26)),zmstr(rem(datalength,26)),num2str(datasize)];
% else
%     posi02 = ['B2:',zmstr(qs*2+7),num2str(datasize)];
% end
posi02 = 'B2';
xlswrite(fullf,dq_q_r,'Dq',posi02)
posi03 = 'C1';
xlswrite(fullf,f_alpha_q_all,'f_alpha_q',posi03)
set(handles.text9,'String','����������ɣ������ѱ��浽�ļ���')
