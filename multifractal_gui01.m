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

% Last Modified by GUIDE v2.5 16-Jul-2024 16:21:16

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
% function multifractal_gui01_OpeningFcn(hObject, eventdata, handles, varargin)
% % This function has no output args, see OutputFcn.
% % hObject    handle to figure
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% % varargin   command line arguments to multifractal_gui01 (see VARARGIN)
% 
% % Choose default command line output for multifractal_gui01
% handles.output = hObject;
% 
% % Update handles structure
% guidata(hObject, handles);
% 
% axes(handles.axes3)
% hold on
% axis ([-0.5, 3.4, 0, 4+0.2]);
% xfontsize3 = 12;
% yfontsize3 = 12;
% xlabel('Grain size ($log_{10}$)','interpreter','latex', 'FontSize', xfontsize3);
% ylabel('Frequency (\%)','interpreter','latex', 'FontSize', yfontsize3);
% hold off
% %绘制图
% axes(handles.axes2)
% hold on
% axis ([-10, 10, 1, 6]);
% xfontsize2 = 12;
% yfontsize2 = 12;
% xlabel('$q$','interpreter','latex', 'FontSize', xfontsize2);
% ylabel('$D(q)$','interpreter','latex', 'FontSize', yfontsize2);
% hold off
% %绘制图
% axes(handles.axes1)
% hold on
% axis ([0, 6.5, 0.5, 2]);
% xfontsize1 = 12;
% yfontsize1 = 12;
% xlabel('$\alpha$','interpreter','latex', 'FontSize', xfontsize1);
% ylabel('$f(\alpha)$','interpreter','latex', 'FontSize', yfontsize1);
% hold off
function multifractal_gui01_OpeningFcn(hObject, eventdata, handles, varargin)
% hObject    是当前图形窗口的句柄
% eventdata  保留，用于将来 MATLAB 版本的事件数据
% handles    包含 GUI 组件句柄的结构体
% varargin   包含传递给 GUI 窗口的命令行参数

% 选择 GUI 窗口的默认输出句柄
handles.output = hObject;

% 更新 handles 结构体，该结构体用于在 GUI 回调函数之间共享数据
guidata(hObject, handles);

% 设置 axes3 为当前坐标轴，并绘制图形
axes(handles.axes3); 
% 保持当前图形，以便在同一坐标轴上绘制新图形
hold on;  
% 设置坐标轴范围
axis([-0.5, 3.4, 0, 4+0.2]);  
xfontsize3 = 12;
yfontsize3 = 12;
% 设置 x 轴标签
xlabel('Grain size ($log_{10}$)','interpreter','latex', 'FontSize', xfontsize3);  
% 设置 y 轴标签
ylabel('Frequency (\%)','interpreter','latex', 'FontSize', yfontsize3);  
% 释放图形，以便后续的绘图不会覆盖当前图形
hold off;  

% 设置 axes2 为当前坐标轴，并绘制图形
axes(handles.axes2);
% 保持当前图形
hold on;  
% 设置坐标轴范围
axis([-10, 10, 1, 6]);  
xfontsize2 = 12;
yfontsize2 = 12;
% 设置 x 轴标签
xlabel('$q$','interpreter','latex', 'FontSize', xfontsize2);  
% 设置 y 轴标签
ylabel('$D(q)$','interpreter','latex', 'FontSize', yfontsize2);  
% 释放图形
hold off;  

% 设置 axes1 为当前坐标轴，并绘制图形
% 选择名为 axes1 的坐标轴
axes(handles.axes1);  
% 保持当前图形
hold on;  
% 设置坐标轴范围
axis([0, 6.5, 0.5, 2]);  
xfontsize1 = 12;
yfontsize1 = 12;
% 设置 x 轴标签
xlabel('$\alpha$','interpreter','latex', 'FontSize', xfontsize1);  
% 设置 y 轴标签
ylabel('$f(\alpha)$','interpreter','latex', 'FontSize', yfontsize1);  
% 释放图形
hold off;  

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

global fullf data1 selectednum maxff selectedCellValues datashows;
datashows = [];
selectedCellValues = [];
% 记录最大频数
maxff = 0; 
selectednum = 1;
fullf = fullfile(fpath,filen);
%读取xlsx文件指定数据
% [data1,text] = xlsread('mutifractal_data01.xlsx', 'Sheet1', 'B1:CQ2'); 
fullf = fullfile(fpath,filen);
%读取xlsx文件指定数据
[data1,text] = xlsread(fullf, 'Sheet1', 'A1:CQ3'); 
%读取xlsx文件指定数据
[data1,text] = xlsread(fullf, 'Sheet1'); 
datashow = data1(1:2,:);
% set(handles.uitable1,'Data',datashow')
%将数据设置到uitable控件
set(handles.uitable2,'Data',text(2:end)) 

% 可以取值1，2，3，4，5，6。
k = 5; 
k=str2double(get(handles.edit4,'string'));
%q = 3;
ne = 2^k;
%粒径大小
gs = datashow(1,:)'; 
%对应粒径大小的占比数据
gp = datashow(2,:)'/100;  

% 数据对数化
%gs_lg = log10(gs/min(gs));
gs_lg = log10(gs/0.02);
%gs_lg = (gs_lg-min(gs_lg))/max((gs_lg-min(gs_lg)))*5;
maxs_lg = max(gs_lg);
%划分区间大小
ee = maxs_lg/ne; 

%取一个极小值，解决部分区间概率为0时无法取对数的情况
dps = 0.00001; 
%q值的取值最大值，该取值代表后续计算q=-qs：qs的所有情况
qs = 10; 
qs=str2double(get(handles.edit5,'string'));
%计算不同q值的多重分形奇异性指数和对应多重分形谱函数的值
global alpha_q f_alpha_q;
for q = -qs:qs
    alpha_q(q+qs+1) = s_a_q(gs_lg,gp,q,ee,ne,dps);
    f_alpha_q(q+qs+1) = f_s_a_q(gs_lg,gp,q,ee,ne,dps);
end
%绘制多重分形奇异性指数和对应多重分形谱函数的值散点图
% scatter(alpha_q,f_alpha_q)
% xlabel('$\alpha$','interpreter','latex', 'FontSize', 18);
% ylabel('$f(\alpha)$','interpreter','latex', 'FontSize', 18);
% 计算多重分形奇异谱的谱宽和形状特征值
[alpha_q_max,i_max] = max(alpha_q);
[alpha_q_min,i_min] = min(alpha_q);
%计算多重分形奇异谱的谱宽
d_a_q = alpha_q_max - alpha_q_min;
fprintf('多重分形奇异谱的谱宽为%6.4f\n',d_a_q)
%计算多重分形谱的形状特征值
d_f_a_q = f_s_a_q(gs_lg,gp,i_max-qs-1,ee,ne,dps)-f_s_a_q(gs_lg,gp,i_min-qs-1,ee,ne,dps);
fprintf('多重分形谱的形状特征值为%6.4f\n',d_f_a_q)

% 计算不同q值的多重分形广义维数谱
q = 0;
d_q0 = f_d_q(gs_lg,gp,q,ee,ne,dps);
fprintf('D(0)值为%6.4f\n',d_q0)
q = 1;
d_q1 = f_d_q(gs_lg,gp,q,ee,ne,dps);
fprintf('D(1)值为%6.4f\n',d_q1)
q = 2;
d_q2 = f_d_q(gs_lg,gp,q,ee,ne,dps);
fprintf('D(2)值为%6.4f\n',d_q2)
%set(handles.edit3,'string',num2str(d_q2,'%6.4f'));
% 更新显示的数据
datashow3 = {text{2},d_q0,d_q1,d_q2,d_a_q,d_f_a_q};
% 将更新后的数据设置到uitable3控件（此行被注释掉了）
% set(handles.uitable3,'Data',datashow3)

% 计算q取值【-10，10】时的D值，并绘制散点图
global qqq dq;
qqq = -qs:qs;
for i = 1:2*qs+1
    dq(i) = f_d_q(gs_lg,gp,qqq(i),ee,ne,dps);
end

% 更新文本控件，提示用户数据导入成功
set(handles.text9,'String','Data import successful, you can proceed with plotting and exporting the results.')


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
% function pushbutton2_Callback(hObject, eventdata, handles)
% % hObject    handle to pushbutton2 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% global qqq dq;
% axes(handles.axes2)
% scatter(qqq,dq)
% xfontsize2 = 12;
% yfontsize2 = 12;
% xlabel('$q$','interpreter','latex', 'FontSize', xfontsize2);
% ylabel('$D(q)$','interpreter','latex', 'FontSize', yfontsize2);
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    是 pushbutton2 控件的句柄，用于访问控件的属性和方法
% eventdata  保留 - 将来 MATLAB 版本中定义
% handles    包含句柄和用户数据的结构体，用于访问回调函数外部定义的变量

% 全局变量声明，这些变量在回调函数外部定义，并在此处使用
global qqq dq;

% 设置图形的坐标轴为handles.axes2中指定的坐标轴
axes(handles.axes2);

% 在坐标轴上绘制 qqq 和 dq 数据的散点图
scatter(qqq, dq);

% 设置 x 轴标签的字体大小
xfontsize2 = 12;

% 设置 y 轴标签的字体大小
yfontsize2 = 12;

% 设置 x 轴标签，使用 LaTeX 语法，并设置字体大小
% LaTeX 语法允许在标签中包含数学符号和格式化
xlabel('$q$','interpreter','latex', 'FontSize', xfontsize2);

% 设置 y 轴标签，使用 LaTeX 语法，并设置字体大小
ylabel('$D(q)$','interpreter','latex', 'FontSize', yfontsize2);

% --- Executes on button press in pushbutton3.
% function pushbutton3_Callback(hObject, eventdata, handles)
% % hObject    handle to pushbutton3 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% global alpha_q f_alpha_q;
% axes(handles.axes1)
% scatter(alpha_q,f_alpha_q)
% xfontsize1 = 12;
% yfontsize1 = 12;
% xlabel('$\alpha$','interpreter','latex', 'FontSize', xfontsize1);
% ylabel('$f(\alpha)$','interpreter','latex', 'FontSize', yfontsize1);
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    是 pushbutton3 控件的句柄，用于访问控件的属性和方法
% eventdata  保留 - 将来 MATLAB 版本中定义
% handles    包含句柄和用户数据的结构体，用于访问回调函数外部定义的变量

% 全局变量声明，这些变量在回调函数外部定义，并在此处使用
global alpha_q f_alpha_q;

% 设置图形的坐标轴为handles.axes1中指定的坐标轴
axes(handles.axes1);

% 在坐标轴上绘制 alpha_q 和 f_alpha_q 数据的散点图
scatter(alpha_q, f_alpha_q);

% 设置 x 轴标签的字体大小
xfontsize1 = 12;

% 设置 y 轴标签的字体大小
yfontsize1 = 12;

% 设置 x 轴标签，使用 LaTeX 语法，并设置字体大小
xlabel('$\alpha$','interpreter','latex', 'FontSize', xfontsize1);

% 设置 y 轴标签，使用 LaTeX 语法，并设置字体大小
ylabel('$f(\alpha)$','interpreter','latex', 'FontSize', yfontsize1);

% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
Data = cell(2,2);
%将数据设置到uitable控件
set(hObject, 'ColumnName', {'Grain size','Proportion (%)'},'data',Data) 


% --- Executes during object creation, after setting all properties.
function uitable2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
Data = cell(3,1); %新建一个3行1列的元胞数组
%将数据设置到uitable控件
set(hObject, 'ColumnName', {'Data Number'}, 'data',Data) 


% --- Executes when selected cell(s) is changed in uitable2.
% function uitable2_CellSelectionCallback(hObject, event, handles)
% global data1 selectednum selectedCellValue selectedCellValues maxff datashow1 datashows;
% % hObject    handle to uitable2 (see GCBO)
% % eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
% %	Indices: row and column indices of the cell(s) currently selecteds
% % handles    structure with handles and user data (see GUIDATA)
% selectedRow = event.Indices;
% selectednum = selectedRow(1);
% % 获取选中单元格的数据
% tableData = get(hObject, 'Data');
% selectedCellValue = tableData{selectedRow};
% if isempty(selectedCellValues)
%     selectedCellValues = string(selectedCellValue);
% else
%     selectedCellValues = [selectedCellValues; string(selectedCellValue)];
% end
% datashow = [data1(1,:);data1(selectedRow(1)+1,:)];
% % set(handles.uitable1,'Data',datashow')
% 
% datashow1 = datashow;
% maxff = max(maxff, max(datashow1(2,:)));
% % for i = 2:size(datashow1,2)
% %     datashow1(2,i) = datashow1(2,i-1) + datashow1(2,i);
% % end
% axes(handles.axes3)
% hold on
% plot(log10(datashow1(1,:)),datashow1(2,:))
% axis ([-0.5, 3.4, 0, maxff+0.2]);
% xfontsize3 = 12;
% yfontsize3 = 12;
% xlabel('Grain size ($log_{10}$)','interpreter','latex', 'FontSize', xfontsize3);
% ylabel('Frequency (\%)','interpreter','latex', 'FontSize', yfontsize3);
% legend(selectedCellValues,'Location', 'best'); %手动添加legend
% hold off
% disp(['The selected cell data is: ', selectedCellValue]);
% 
% k = 5; % 可以取值1，2，3，4，5，6。
% k=str2double(get(handles.edit4,'string'));
% %q = 3;
% ne = 2^k;
% 
% gs = datashow(1,:)'; %粒径大小
% gp = datashow(2,:)'/100;  %对应粒径大小的占比数据
% 
% %gs_lg = log10(gs/min(gs));
% gs_lg = log10(gs/0.02); %数据对数化
% %gs_lg = (gs_lg-min(gs_lg))/max((gs_lg-min(gs_lg)))*5;
% maxs_lg = max(gs_lg);
% ee = maxs_lg/ne; %划分区间大小
% 
% dps = 0.00001; %取一个极小值，解决部分区间概率为0时无法取对数的情况
% qs = 10; %q值的取值最大值，该取值代表后续计算q=-qs：qs的所有情况
% qs=str2double(get(handles.edit5,'string'));
% %计算不同q值的多重分形奇异性指数和对应多重分形谱函数的值
% global alpha_q f_alpha_q;
% for q = -qs:qs
%     alpha_q(q+qs+1) = s_a_q(gs_lg,gp,q,ee,ne,dps);
%     f_alpha_q(q+qs+1) = f_s_a_q(gs_lg,gp,q,ee,ne,dps);
% end
% %绘制多重分形奇异性指数和对应多重分形谱函数的值散点图
% % scatter(alpha_q,f_alpha_q)
% % xlabel('$\alpha$','interpreter','latex', 'FontSize', 18);
% % ylabel('$f(\alpha)$','interpreter','latex', 'FontSize', 18);
% 
% [alpha_q_max,i_max] = max(alpha_q);
% [alpha_q_min,i_min] = min(alpha_q);
% %计算多重分形奇异谱的谱宽
% d_a_q = alpha_q_max - alpha_q_min;
% % fprintf('多重分形奇异谱的谱宽为%6.4f\n',d_a_q)
% % set(handles.edit6,'string',num2str(d_a_q,'%6.4f'));
% %计算多重分形谱的形状特征值
% d_f_a_q = f_s_a_q(gs_lg,gp,i_max-qs-1,ee,ne,dps)-f_s_a_q(gs_lg,gp,i_min-qs-1,ee,ne,dps);
% % fprintf('多重分形谱的形状特征值为%6.4f\n',d_f_a_q)
% % set(handles.edit7,'string',num2str(d_f_a_q,'%6.4f'));
% 
% % 计算不同q值的多重分形广义维数谱
% q = 0;
% d_q0 = f_d_q(gs_lg,gp,q,ee,ne,dps);
% % fprintf('D(0)值为%6.4f\n',d_q0)
% % set(handles.edit1,'string',num2str(d_q0,'%6.4f'));
% q = 1;
% d_q1 = f_d_q(gs_lg,gp,q,ee,ne,dps);
% % fprintf('D(1)值为%6.4f\n',d_q1)
% % set(handles.edit2,'string',num2str(d_q1,'%6.4f'));
% q = 2;
% d_q2 = f_d_q(gs_lg,gp,q,ee,ne,dps);
% % fprintf('D(2)值为%6.4f\n',d_q2)
% % set(handles.edit3,'string',num2str(d_q2,'%6.4f'));
% datashow3 = {selectedCellValue,d_q0,d_q1,d_q2,d_a_q,d_f_a_q};
% if isempty(datashows)
%     datashows = datashow3;
% else
%     datashows = [datashows;datashow3];
% end
% set(handles.uitable3,'Data',datashows)
% 
% % 计算q取值【-10，10】时的D值
% global qqq dq;
% qqq = -qs:qs;
% for i = 1:2*qs+1
%     dq(i) = f_d_q(gs_lg,gp,qqq(i),ee,ne,dps);
% end
% 
% %绘制图
% axes(handles.axes2)
% hold on
% scatter(qqq,dq)
% xfontsize2 = 12;
% yfontsize2 = 12;
% xlabel('$q$','interpreter','latex', 'FontSize', xfontsize2);
% ylabel('$D(q)$','interpreter','latex', 'FontSize', yfontsize2);
% legend(selectedCellValues,'Location', 'best'); %手动添加legend
% hold off
% %绘制图
% axes(handles.axes1)
% hold on
% scatter(alpha_q,f_alpha_q)
% xfontsize1 = 12;
% yfontsize1 = 12;
% xlabel('$\alpha$','interpreter','latex', 'FontSize', xfontsize1);
% ylabel('$f(\alpha)$','interpreter','latex', 'FontSize', yfontsize1);
% legend(selectedCellValues,'Location', 'best'); %手动添加legend
% hold off
% 
% set(handles.text9,'String',['Switch the data to',selectedCellValue,'，and the results can be re-exported.'])
function uitable2_CellSelectionCallback(hObject, event, handles)
% hObject    是 uitable2 控件的句柄，用于访问控件的属性和方法
% eventdata  结构体，包含选中单元格的信息，如行和列索引
% handles    包含句柄和用户数据的结构体，用于访问回调函数外部定义的变量

% 全局变量声明，这些变量在回调函数外部定义，并在此处使用
global data1 selectednum selectedCellValue selectedCellValues maxff datashow1 datashows;

% 获取选中单元格的索引
selectedRow = event.Indices;
selectednum = selectedRow(1);

% 获取选中单元格的数据
tableData = get(hObject, 'Data');
selectedCellValue = tableData{selectedRow};

% 将选中的数据转换为字符串，并存储在全局变量中
% 如果selectedCellValues为空，则初始化为选中数据的字符串
% 否则，将新选中的数据添加到selectedCellValues中
if isempty(selectedCellValues)
    selectedCellValues = string(selectedCellValue);
else
    selectedCellValues = [selectedCellValues; string(selectedCellValue)];
end

% 更新显示的数据，将选中的数据行与第一行数据合并
datashow = [data1(1, :); data1(selectedRow(1) + 1, :)];
% 将更新后的数据展示在uitable1控件中（此行被注释掉了）
% set(handles.uitable1, 'Data', datashow)

datashow1 = datashow;
% 更新最大频率值，确保坐标轴的y轴范围包含所有数据
maxff = max(maxff, max(datashow1(2, :)));

% 设置图形的坐标轴，绘制选中数据行的粒径大小分布图
axes(handles.axes3)
hold on
plot(log10(datashow1(1, :)), datashow1(2, :))
% 设置坐标轴的范围
axis ([-0.5, 3.4, 0, maxff + 0.2]);
% 设置x轴和y轴标签的字体大小
xfontsize3 = 12;
yfontsize3 = 12;
xlabel('Grain size ($log_{10}$)','interpreter','latex', 'FontSize', xfontsize3);
ylabel('Frequency (\%)','interpreter','latex', 'FontSize', yfontsize3);
% 添加图例，显示选中的数据
legend(selectedCellValues, 'Interpreter', 'none', 'Location', 'best');
hold off

% 显示选中单元格的数据
disp(['The selected cell data is: ', selectedCellValue]);

% 获取用户输入的k值，用于计算多重分形参数
% 默认值
k = 5; 
k = str2double(get(handles.edit4, 'string'));
% 计算多重分形参数
ne = 2^k;

% 提取粒径大小和占比数据
% 粒径大小
gs = datashow(1, :)'; 
% 对应粒径大小的占比数据
gp = datashow(2, :)' / 100;  

% 数据对数化
gs_lg = log10(gs / 0.02);
maxs_lg = max(gs_lg);
% 划分区间大小
ee = maxs_lg / ne; 

% 取一个极小值，解决部分区间概率为0时无法取对数的情况
dps = 0.00001;
% q值的取值最大值
qs = 10; 
qs = str2double(get(handles.edit5, 'string'));

% 计算不同q值的多重分形奇异性指数和对应多重分形谱函数的值
global alpha_q f_alpha_q;
for q = -qs:qs
    alpha_q(q + qs + 1) = s_a_q(gs_lg, gp, q, ee, ne, dps);
    f_alpha_q(q + qs + 1) = f_s_a_q(gs_lg, gp, q, ee, ne, dps);
end

% 计算多重分形奇异谱的谱宽和形状特征值
[alpha_q_max, i_max] = max(alpha_q);
[alpha_q_min, i_min] = min(alpha_q);
d_a_q = alpha_q_max - alpha_q_min;
% 计算出d_f_a_q
d_f_a_q = f_s_a_q(gs_lg, gp, i_max - qs - 1, ee, ne, dps) - f_s_a_q(gs_lg, gp, i_min - qs - 1, ee, ne, dps);

% 计算不同q值的多重分形广义维数谱
q = 0;
d_q0 = f_d_q(gs_lg, gp, q, ee, ne, dps);
q = 1;
d_q1 = f_d_q(gs_lg, gp, q, ee, ne, dps);
q = 2;
d_q2 = f_d_q(gs_lg, gp, q, ee, ne, dps);

% 更新显示的数据
datashow3 = {selectedCellValue, d_q0, d_q1, d_q2, d_a_q, d_f_a_q};
if isempty(datashows)
    datashows = datashow3;
else
    datashows = [datashows; datashow3];
end
% 将数据显示在表格中
set(handles.uitable3, 'Data', datashows)

% 计算q取值【-10，10】时的D值
global qqq dq;
qqq = -qs:qs;
for i = 1:2 * qs + 1
    dq(i) = f_d_q(gs_lg, gp, qqq(i), ee, ne, dps);
end

% 绘制q-D(q)图
axes(handles.axes2)
hold on
scatter(qqq, dq)
% 设置坐标标签的字体大小
xfontsize2 = 12;
yfontsize2 = 12;
% 设置坐标标签
xlabel('$q$','interpreter','latex', 'FontSize', xfontsize2);
ylabel('$D(q)$','interpreter','latex', 'FontSize', yfontsize2);
legend(selectedCellValues, 'Interpreter', 'none', 'Location', 'northeast');
hold off

% 绘制alpha-f(alpha)图
axes(handles.axes1)
hold on
scatter(alpha_q, f_alpha_q)
% 设置坐标标签的字体大小
xfontsize1 = 12;
yfontsize1 = 12;
% 设置坐标标签
xlabel('$\alpha$','interpreter','latex', 'FontSize', xfontsize1);
ylabel('$f(\alpha)$','interpreter','latex', 'FontSize', yfontsize1);
legend(selectedCellValues, 'Interpreter', 'none', 'Location', 'southeast');
% legend(selectedCellValues, 'Interpreter', 'none', 'Location', 'best');
hold off

% 更新文本控件，提示用户数据已切换
set(handles.text9, 'String', ['Switch the data to ', selectedCellValue, '，and the results can be re-exported.'])

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
% 创建“使用说明”窗口
about_window = dialog('Position',[300,300,600,500],'Name','User Manual');
% “使用说明”窗口的内容
% txtstring1 = '使用说明：粒径分析软件1.0';
% txtstring2 = '数据编号列表：在主界面左侧，您可以看到一个数据编号列表，显示了导入的每个样本的唯一编号。';
% txtstring3 = '粒径大小及占比分析：导入数据后，软件会自动计算每个样本的粒径大小及其在整体样本中的占比。';
% txtstring4 = '绘图区域：包含两个绘图面板，分别绘制多重分形奇异性指数和对应多重分形谱函数的值散点图和不同q值的多重分形广义维数谱。';
% txtstring5 = '功能按钮操作区域：主界面中间有功能按钮操作区域，包含以下主要按钮：数据导入、结果导出、绘制1、保存绘制1、绘制2、保存绘制2，以及k值、最大q值参数输入';
% txtstring6 = '操作提示区域：在操作后会给出操作提示。';
% 文本赋值
txtstring1 = 'User Manual: Sediment Particle Size Distribution Multifractal';
txtstring11 = 'Analysis System V1.0';
txtstring2 = 'Data Number List: On the left side of the main interface, you can see a list of data numbers, which display the unique identification number for each imported sample.';
txtstring3 = 'Particle Size and Proportion Analysis: After importing the data, the software will automatically calculate the particle size of each sample and its proportion within the overall sample set.';
txtstring4 = 'Plotting Area: It contains two plotting panels, one for drawing the scatter plot of the multifractal singularity index and the corresponding multifractal spectrum function values, and the other for the multifractal generalized dimension spectrum at different q-values.';
txtstring5 = 'Functional Button Operation Area: In the middle of the main interface, there is a functional button operation area, which includes the following main buttons: Data Import, Results Export, Plot 1, Save Plot 1, Plot 2, Save Plot 2, Plot 3, Save Plot 3, as well as input fields for the k value and the maximum q value parameters.';
txtstring6 = 'Operation Prompt Area: It provides operation prompts after performing actions.';
% 设置文本标签位置
about_text1 = uicontrol('Parent',about_window,'Style','text','String',txtstring1,'Position',[25,460,560,30],'FontSize',16);
about_text11 = uicontrol('Parent',about_window,'Style','text','String',txtstring11,'Position',[55,435,560,30],'FontSize',16);
about_text2 = uicontrol('Parent',about_window,'Style','text','String',txtstring2,'Position',[25,370,560,60],'FontSize',12);
about_text3 = uicontrol('Parent',about_window,'Style','text','String',txtstring3,'Position',[25,300,560,70],'FontSize',12);
about_text4 = uicontrol('Parent',about_window,'Style','text','String',txtstring4,'Position',[25,230,560,80],'FontSize',12);
about_text5 = uicontrol('Parent',about_window,'Style','text','String',txtstring5,'Position',[25,130,560,100],'FontSize',12);
about_text6 = uicontrol('Parent',about_window,'Style','text','String',txtstring6,'Position',[25,110,560,40],'FontSize',12);
% 关闭按钮
close_btn = uicontrol('Parent',about_window,'Style','pushbutton','String','Close','Position',[120,20,360,30],'Callback',@closeAbout);

% --------------------------------------------------------------------
function about1_Callback(hObject, eventdata, handles)
% hObject    handle to about1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 创建“关于”窗口
% about_window = dialog('Position',[300,300,300,200],'Name','关于');
% % “关于”窗口的内容
% about_text = uicontrol('Parent',about_window,'Style','text','String','粒径分析软件1.0','Position',[25,80,250,60],'FontSize',12);
% % 关闭按钮
% close_btn = uicontrol('Parent',about_window,'Style','pushbutton','String','关闭','Position',[120,20,60,30],'Callback',@closeAbout);
% 创建一个新的窗口
    aboutWindow = uifigure('Name', 'About', 'Position', [100, 100, 400, 200]);
    % 添加装饰框
    uilabel(aboutWindow, 'Text', '--------------------------------------------------------------------------', 'Position', [40, 180, 310, 22]);
    uilabel(aboutWindow, 'Text', '|                                                                                       |', 'Position', [40, 170, 310, 22]);
    uilabel(aboutWindow, 'Text', '|                                                                                       |', 'Position', [40, 155, 310, 22]);
    uilabel(aboutWindow, 'Text', '|                                                                                       |', 'Position', [40, 140, 310, 22]);
    uilabel(aboutWindow, 'Text', '|                                                                                       |', 'Position', [40, 125, 310, 22]);
    uilabel(aboutWindow, 'Text', '|                                                                                       |', 'Position', [40, 110, 310, 22]);
    uilabel(aboutWindow, 'Text', '|                                                                                       |', 'Position', [40, 95, 310, 22]);
    uilabel(aboutWindow, 'Text', '|                                                                                       |', 'Position', [40, 80, 310, 22]);
    uilabel(aboutWindow, 'Text', '|                                                                                       |', 'Position', [40, 65, 310, 22]);
    uilabel(aboutWindow, 'Text', '--------------------------------------------------------------------------', 'Position', [40, 50, 310, 22]);
    % 添加一个文本标签，显示软件的基本信息
    uilabel(aboutWindow, 'Text', 'Sediment Particle Size Distribution Multifractal', 'Position', [50, 170, 300, 22]);
    uilabel(aboutWindow, 'Text', 'Analysis System', 'Position', [50, 150, 300, 22]);
    % 显示版本信息
    versionLabel = uilabel(aboutWindow, 'Text', 'Version 1.0', 'Position', [50, 120, 200, 22]);
    % 显示开发者信息
    developerLabel = uilabel(aboutWindow, 'Text', 'Developed by Rui Yuan', 'Position', [50, 90, 200, 22]);
    % 显示版权信息
    copyrightLabel = uilabel(aboutWindow, 'Text', 'Copyright ? 2024 Yangtze University', 'Position', [50, 60, 200, 22]);
    % 添加一个关闭按钮
    closeButton = uibutton(aboutWindow, 'Push', 'Text', 'Close', 'Position', [100, 20, 180, 22], 'ButtonPushedFcn', @(btn, event) close(aboutWindow));

function closeAbout(~,~)
    % 关闭当前窗口
    close(gcbf); 


% --- Executes during object creation, after setting all properties.
% function uitable3_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to uitable3 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% Data = cell(1,6); %新建一个3行1列的元胞数组
% set(hObject, 'ColumnName', {'数据编号','D(0)值','D(1)值','D(2)值','奇异谱谱宽','谱的形状特征值'},'data',Data) %将数据设置到uitable控件
function uitable3_CreateFcn(hObject, eventdata, handles)
% hObject    是 uitable3 控件的句柄（由回调函数的参数提供）
% eventdata  保留 - 将来 MATLAB 版本中定义
% handles    在所有 CreateFcns 被调用之后才会创建句柄

% 新建一个 1 行 6 列的元胞数组，用于存储表格的初始数据
Data = cell(1,6); 

% 设置 uitable 控件的属性
% 'ColumnName' 属性用于定义表格的列名
% 'data' 属性用于设置表格的数据
set(hObject, 'ColumnName', {'数据编号','D(0)值','D(1)值','D(2)值','奇异谱谱宽','谱的形状特征值'}, 'data', Data)

% --- Executes on button press in pushbutton4.
% function pushbutton4_Callback(hObject, eventdata, handles)
% % hObject    handle to pushbutton4 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% global fullf dq alpha_q f_alpha_q selectednum;
% posi02 = ['B',num2str(selectednum+1)];
% xlswrite(fullf,dq,'Dq',posi02)
% posi03 = ['C',num2str(2*selectednum-1)];
% xlswrite(fullf,[alpha_q;f_alpha_q],'f_alpha_q',posi03)
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    是 pushbutton4 控件的句柄（由回调函数的参数提供）
% eventdata  保留 - 将来 MATLAB 版本中定义
% handles    包含句柄和用户数据的结构体（由回调函数的参数提供）

% 全局变量声明，这些变量在回调函数外部定义，并在此处使用
global fullf dq alpha_q f_alpha_q selectednum;

% 构造列标识符字符串，用于写入 dq 数据
% 假设 selectednum 是用户选择的编号，列标识符从 B 开始
posi02 = ['B', num2str(selectednum + 1)];
% 将 dq 数据写入指定的列，'Dq' 是工作表的名称
xlswrite(fullf, dq, 'Dq', posi02)

% 构造列标识符字符串，用于写入 [alpha_q; f_alpha_q] 数据
% 假设 selectednum 是用户选择的编号，列标识符从 C 开始
posi03 = ['C', num2str(2 * selectednum - 1)];
% 将 [alpha_q; f_alpha_q] 数据写入指定的列，'f_alpha_q' 是工作表的名称
xlswrite(fullf, [alpha_q; f_alpha_q], 'f_alpha_q', posi03)

% --- Executes on button press in pushbutton5.
% function pushbutton5_Callback(hObject, eventdata, handles)
% % hObject    handle to pushbutton5 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% global qqq dq selectedCellValue;
% 
% newFig = figure('visible','off'); %生成一个不可见fig
% scatter(qqq,dq)
% xfontsize1 = 12;
% yfontsize1 = 12;
% xlabel('$q$','interpreter','latex', 'FontSize', xfontsize1);
% ylabel('$D(q)$','interpreter','latex', 'FontSize', yfontsize1);
% % colorbar; %手动添加colorbar
% legend(selectedCellValue); %手动添加legend
% [file,location] = uiputfile('*.jpg');
% if isequal(file,0) || isequal(location,0)
%     disp('User clicked Cancel.')
% else
%     saveas(newFig,[location,file]); %保存新fig的图像
%     set(handles.text9,'String',['The image has been saved',', and you can browse it in the corresponding folder.'])
%     disp(['User selected ',fullfile(location,file),...
%          ' and then clicked Save.'])
% end
% 
% close(newFig); %关闭新fig
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    是 pushbutton5 控件的句柄（由回调函数的参数提供）
% eventdata  保留 - 将来 MATLAB 版本中定义
% handles    包含句柄和用户数据的结构体（由回调函数的参数提供）

% 全局变量声明，这些变量在回调函数外部定义，并在此处使用
global qqq dq selectedCellValue;

% 生成一个不可见的图形窗口（fig）
newFig = figure('visible','off'); 

% 在新图形窗口中绘制 qqq 和 dq 数据的散点图
scatter(qqq, dq);

% 设置 x 轴标签的字体大小
xfontsize1 = 12;

% 设置 y 轴标签的字体大小
yfontsize1 = 12;

% 设置 x 轴标签，使用 LaTeX 语法，并设置字体大小
xlabel('$q$','interpreter','latex', 'FontSize', xfontsize1);

% 设置 y 轴标签，使用 LaTeX 语法，并设置字体大小
ylabel('$D(q)$','interpreter','latex', 'FontSize', yfontsize1);

% 注释掉的 colorbar 代码，如果需要显示颜色条，可以取消注释
% colorbar;

% 添加图例，图例的文本来自全局变量 selectedCellValue
legend(selectedCellValue); 

% 使用 uiputfile 函数弹出文件保存对话框，让用户选择保存图片的位置和文件名
[file, location] = uiputfile('*.jpg');

% 检查用户是否点击了“取消”
if isequal(file, 0) || isequal(location, 0)
    disp('User clicked Cancel.');
else
    % 用户选择了文件名和位置，保存图形为图片
    saveas(newFig, [location, file]); 
    
    % 更新 UI 中的文本控件，通知用户图片已保存
    set(handles.text9, 'String', ['The image has been saved', ', and you can browse it in the corresponding folder.']);
    
    % 显示保存的文件完整路径
    disp(['User selected ', fullfile(location, file), ' and then clicked Save.'])
end

% 关闭新创建的图形窗口
close(newFig); 

% --- Executes on button press in pushbutton6.
% function pushbutton6_Callback(hObject, eventdata, handles)
% % hObject    handle to pushbutton6 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% global alpha_q f_alpha_q selectedCellValue;
% 
% newFig = figure('visible','off'); %生成一个不可见fig
% scatter(alpha_q,f_alpha_q)
% xfontsize1 = 12;
% yfontsize1 = 12;
% xlabel('$\alpha$','interpreter','latex', 'FontSize', xfontsize1);
% ylabel('$f(\alpha)$','interpreter','latex', 'FontSize', yfontsize1);
% % colorbar; %手动添加colorbar
% legend(selectedCellValue); %手动添加legend
% [file,location] = uiputfile('*.jpg');
% if isequal(file,0) || isequal(location,0)
%     disp('User clicked Cancel.')
% else
%     saveas(newFig,[location,file]); %保存新fig的图像
%     set(handles.text9,'String',['The image has been saved',', and you can browse it in the corresponding folder.'])
%     disp(['User selected ',fullfile(location,file),...
%          ' and then clicked Save.'])
% end
% close(newFig); %关闭新fig
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    是 pushbutton6 控件的句柄（由回调函数的参数提供）
% eventdata  保留 - 将来 MATLAB 版本中定义
% handles    包含句柄和用户数据的结构体（由回调函数的参数提供）

% 全局变量声明，这些变量在回调函数外部定义，并在此处使用
global alpha_q f_alpha_q selectedCellValue;

% 生成一个不可见的图形窗口（fig）
newFig = figure('visible','off'); 

% 在新图形窗口中绘制 alpha_q 和 f_alpha_q 数据
scatter(alpha_q, f_alpha_q);

% 设置 x 轴标签的字体大小
xfontsize1 = 12;

% 设置 y 轴标签的字体大小
yfontsize1 = 12;

% 设置 x 轴标签，使用 LaTeX 语法，并设置字体大小
xlabel('$\alpha$','interpreter','latex', 'FontSize', xfontsize1);

% 设置 y 轴标签，使用 LaTeX 语法，并设置字体大小
ylabel('$f(\alpha)$','interpreter','latex', 'FontSize', yfontsize1);

% 注释掉的 colorbar 代码，如果需要显示颜色条，可以取消注释
% colorbar;

% 添加图例，图例的文本来自全局变量 selectedCellValue
legend(selectedCellValue); 

% 使用 uiputfile 函数弹出文件保存对话框，让用户选择保存图片的位置和文件名
[file, location] = uiputfile('*.jpg');

% 检查用户是否点击了“取消”
if isequal(file, 0) || isequal(location, 0)
    disp('User clicked Cancel.');
else
    % 用户选择了文件名和位置，保存图形为图片
    saveas(newFig, [location, file]); 
    
    % 更新 UI 中的文本控件，通知用户图片已保存
    set(handles.text9, 'String', ['The image has been saved', ', and you can browse it in the corresponding folder.']);
    
    % 显示保存的文件完整路径
    disp(['User selected ', fullfile(location, file), ' and then clicked Save.'])
end

% 关闭新创建的图形窗口
close(newFig); 

% function plprocess_Callback(hObject, eventdata, handles)
% % hObject    handle to pushbutton6 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% [filen,fpath] = uigetfile('*.xlsx');
% if isequal(filen,0)
%    disp('User selected Cancel');
% else
%    disp(['User selected ', fullfile(fpath,filen)]);
% end
% 
% % [data1,text] = xlsread('mutifractal_data01.xlsx', 'Sheet1', 'B1:CQ2'); %读取xlsx文件指定数据
% fullf = fullfile(fpath,filen);
% [data1,text1] = xlsread(fullf, 'Sheet1', 'A2:QQ2'); %读取xlsx文件指定数据
% [data2,text2] = xlsread(fullf, 'Sheet1', 'B2:B333'); %读取xlsx文件指定数据
% zmstr = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
% datalength = size(data1,2)+1;
% if datalength>26
%     posix = [zmstr(fix(datalength/26)),zmstr(rem(datalength,26))];
% else
%     posix = zmstr(datalength);
% end
% datasize = size(data2,1)+1;
% posi01 = ['A1:',posix,num2str(datasize)];
% [data11,text11] = xlsread(fullf, 'Sheet1', posi01); %读取xlsx文件指定数据
% gs = data11(1,:)'; %粒径大小
% gp = data11(2:end,:)'/100;  %对应粒径大小的占比数据
% 
% gs_lg = log10(gs/0.02); %数据对数化
% maxs_lg = max(gs_lg);
% k = 5;
% ne = 2^k;
% ee = maxs_lg/ne; %划分区间大小
% 
% dps = 0.00001; %取一个极小值，解决部分区间概率为0时无法取对数的情况
% qs = 10; %q值的取值最大值，该取值代表后续计算q=-qs：qs的所有情况
% 
% for i = 1:size(gp,2)
%     for q = -qs:qs
%         alpha_q(q+qs+1,i) = s_a_q(gs_lg,gp(:,i),q,ee,ne,dps);
%         f_alpha_q(q+qs+1,i) = f_s_a_q(gs_lg,gp(:,i),q,ee,ne,dps);
%         dq_q(q+qs+1,i) = f_d_q(gs_lg,gp(:,i),q,ee,ne,dps);
%         
%     end
%     [alpha_q_max,i_max] = max(alpha_q(:,i));
%     [alpha_q_min,i_min] = min(alpha_q(:,i));
%     %计算多重分形奇异谱的谱宽
%     d_a_q = alpha_q_max - alpha_q_min;
%     dq_q(q+qs+2,i) = d_a_q;
%     d_f_a_q = f_s_a_q(gs_lg,gp(:,i),i_max-qs-1,ee,ne,dps)-f_s_a_q(gs_lg,gp,i_min-qs-1,ee,ne,dps);
%     % 多重分形谱的形状特征值
%     dq_q(q+qs+3,i) = d_f_a_q;
%     dq_q(q+qs+4,i) = dq_q(0+qs+1,i);
%     dq_q(q+qs+5,i) = dq_q(1+qs+1,i);
%     dq_q(q+qs+6,i) = dq_q(1+qs+2,i);
% end
% 
% alpha_q_r = alpha_q';
% f_alpha_q_r = f_alpha_q';
% f_alpha_q_all(1:2:size(alpha_q_r,1)*2,:) = f_alpha_q_r;
% f_alpha_q_all(2:2:size(alpha_q_r,1)*2,:) = alpha_q_r;
% dq_q_r = dq_q';
% % if qs*2+7>26
% %     posi02 = ['B2:',zmstr(fix(datalength/26)),zmstr(rem(datalength,26)),num2str(datasize)];
% % else
% %     posi02 = ['B2:',zmstr(qs*2+7),num2str(datasize)];
% % end
% posi02 = 'B2';
% xlswrite(fullf,dq_q_r,'Dq',posi02)
% posi03 = 'C1';
% xlswrite(fullf,f_alpha_q_all,'f_alpha_q',posi03)
% set(handles.text9,'String','Batch processing is complete, and the data has been saved to the file.')
function plprocess_Callback(hObject, eventdata, handles)
% hObject    是 pushbutton6 控件的句柄（由回调函数的参数提供）
% eventdata  保留 - 将来 MATLAB 版本中定义
% handles    包含句柄和用户数据的结构体（由回调函数的参数提供）

% 使用 uigetfile 弹出文件选择对话框，选择 xlsx 文件
[filen,fpath] = uigetfile('*.xlsx');

% 检查用户是否点击了“取消”
if isequal(filen,0)
    disp('User selected Cancel');
else
    % 显示用户选择的文件路径和文件名
    disp(['User selected ', fullfile(fpath,filen)]);
    
    % 读取 xlsx 文件中的数据
    fullf = fullfile(fpath,filen);
    [data1,text1] = xlsread(fullf, 'Sheet1', 'A2:QQ2'); % 读取 xlsx 文件指定数据
    [data2,text2] = xlsread(fullf, 'Sheet1', 'B2:B333'); % 读取 xlsx 文件指定数据
    
    % 计算数据列的字母索引
    zmstr = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    datalength = size(data1,2)+1;
    if datalength>26
        posix = [zmstr(fix(datalength/26)),zmstr(rem(datalength,26))];
    else
        posix = zmstr(datalength);
    end
    
    % 计算数据行数
    datasize = size(data2,1)+1;
    posi01 = ['A1:',posix,num2str(datasize)]; % 构造读取数据的区域字符串
    [data11,text11] = xlsread(fullf, 'Sheet1', posi01); % 读取 xlsx 文件指定数据
    
    % 提取粒径大小和占比数据
    gs = data11(1,:)'; % 粒径大小
    gp = data11(2:end,:)'/100;  % 对应粒径大小的占比数据
    
    % 数据对数化
    gs_lg = log10(gs/0.02);
    maxs_lg = max(gs_lg);
    
    % 设置参数
    k = 5;
    ne = 2^k;
    ee = maxs_lg/ne; % 划分区间大小
    
    % 取一个极小值，解决部分区间概率为0时无法取对数的情况
    dps = 0.00001; 
    qs = 10; % q值的取值最大值
    
    % 初始化多重分形参数矩阵
    for i = 1:size(gp,2)
        for q = -qs:qs
            alpha_q(q+qs+1,i) = s_a_q(gs_lg,gp(:,i),q,ee,ne,dps);
            f_alpha_q(q+qs+1,i) = f_s_a_q(gs_lg,gp(:,i),q,ee,ne,dps);
            dq_q(q+qs+1,i) = f_d_q(gs_lg,gp(:,i),q,ee,ne,dps);
        end
        
        [alpha_q_max,i_max] = max(alpha_q(:,i));
        [alpha_q_min,i_min] = min(alpha_q(:,i));
        % 计算多重分形奇异谱的谱宽
        d_a_q = alpha_q_max - alpha_q_min;
        dq_q(q+qs+2,i) = d_a_q;
        
        % 计算多重分形谱的形状特征值
        d_f_a_q = f_s_a_q(gs_lg,gp(:,i),i_max-qs-1,ee,ne,dps)-f_s_a_q(gs_lg,gp(:,i),i_min-qs-1,ee,ne,dps);
        dq_q(q+qs+3,i) = d_f_a_q;
        dq_q(q+qs+4,i) = dq_q(0+qs+1,i);
        dq_q(q+qs+5,i) = dq_q(1+qs+1,i);
        dq_q(q+qs+6,i) = dq_q(1+qs+2,i);
    end
    
    % 转置矩阵
    alpha_q_r = alpha_q';
    f_alpha_q_r = f_alpha_q';
    f_alpha_q_all(1:2:size(alpha_q_r,1)*2,:) = f_alpha_q_r;
    f_alpha_q_all(2:2:size(alpha_q_r,1)*2,:) = alpha_q_r;
    dq_q_r = dq_q';
    
    % 写入数据到 xlsx 文件
    posi02 = 'B2'; % 指定写入数据的起始位置
    xlswrite(fullf,dq_q_r,'Dq',posi02)
    posi03 = 'C1'; % 指定写入数据的起始位置
    xlswrite(fullf,f_alpha_q_all,'f_alpha_q',posi03)
    
    % 更新 UI 中的文本控件，通知用户数据处理完成
    set(handles.text9,'String','Batch processing is complete, and the data has been saved to the file.');
end

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 清空绘制1
global selectedCellValues datashows;
datashows = [];
selectedCellValues = [];
cla(handles.axes1); 
% 清空绘制2
cla(handles.axes2); 
% 清空绘制3
cla(handles.axes3); 
% 清空表格数据
set(handles.uitable3,'Data',datashows)


% % --- Executes on button press in pushbutton8.
% function pushbutton8_Callback(hObject, eventdata, handles)
% % hObject    handle to pushbutton8 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% global maxff datashow1;
% axes(handles.axes3)
% hold on
% plot(log10(datashow1(1,:)),datashow1(2,:))
% axis ([-0.5, 3.4, 0, maxff+0.2]);
% xfontsize3 = 12;
% yfontsize3 = 12;
% xlabel('Grain size ($log_{10}$)','interpreter','latex', 'FontSize', xfontsize3);
% ylabel('Frequency (\%)','interpreter','latex', 'FontSize', yfontsize3);
% hold off

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    是 pushbutton8 控件的句柄（由回调函数的参数提供）
% eventdata  保留 - 将来 MATLAB 版本中定义
% handles    包含句柄和用户数据的结构体（由回调函数的参数提供）

% 全局变量声明，这些变量在回调函数外部定义，并在此处使用
global maxff datashow1;

% 获取 GUI 中名为 axes3 的 axes 控件
axes(handles.axes3)

% 保持当前图形，以便在同一坐标轴上绘制新的数据
hold on

% 绘制数据，datashow1 是一个包含数据的数组，其中第一列是 log10 变换后的粒径，第二列是频率
plot(log10(datashow1(1,:)), datashow1(2,:))

% 设置坐标轴的范围
axis ([-0.5, 3.4, 0, maxff+0.2]);

% 设置 x 轴标签的字体大小
xfontsize3 = 12;

% 设置 y 轴标签的字体大小
yfontsize3 = 12;

% 设置 x 轴标签，使用 LaTeX 语法，并设置字体大小
xlabel('Grain size ($log_{10}$)','interpreter','latex', 'FontSize', xfontsize3);

% 设置 y 轴标签，使用 LaTeX 语法，并设置字体大小
ylabel('Frequency (\%)','interpreter','latex', 'FontSize', yfontsize3);

% 释放图形，以便后续的绘图不会覆盖当前的图形
hold off

% % --- Executes on button press in pushbutton9.
% function pushbutton9_Callback(hObject, eventdata, handles)
% % hObject    handle to pushbutton9 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% global maxff datashow1 selectedCellValue;
% 
% newFig = figure('visible','off'); %生成一个不可见fig
% plot(log10(datashow1(1,:)),datashow1(2,:))
% axis ([-0.5, 3.4, 0, maxff+0.2]);
% xfontsize3 = 12;
% yfontsize3 = 12;
% xlabel('Grain size ($log_{10}$)','interpreter','latex', 'FontSize', xfontsize3);
% ylabel('Frequency (\%)','interpreter','latex', 'FontSize', yfontsize3);
% % colorbar; %手动添加colorbar
% legend(selectedCellValue); %手动添加legend
% [file,location] = uiputfile('*.jpg');
% if isequal(file,0) || isequal(location,0)
%     disp('User clicked Cancel.')
% else
%     saveas(newFig,[location,file]); %保存新fig的图像
%     set(handles.text9,'String',['The image has been saved',', and you can browse it in the corresponding folder.'])
%     disp(['User selected ',fullfile(location,file),...
%          ' and then clicked Save.'])
% end
% 
% close(newFig); %关闭新fig

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    是 pushbutton9 控件的句柄（由回调函数的参数提供）
% eventdata  保留 - 将来 MATLAB 版本中定义
% handles    包含句柄和用户数据的结构体（由回调函数的参数提供）

% 全局变量声明，这些变量在回调函数外部定义，并在此处使用
global maxff datashow1 selectedCellValue;

% 生成一个不可见的图形窗口（fig）
newFig = figure('visible','off'); 

% 在新图形窗口中绘制数据
% datashow1 是一个包含数据的数组，其中第一列是 log10 变换后的粒径，第二列是频率
plot(log10(datashow1(1,:)), datashow1(2,:));

% 设置坐标轴的范围
axis ([-0.5, 3.4, 0, maxff+0.2]);

% 设置 x 轴标签的字体大小
xfontsize3 = 12;

% 设置 y 轴标签的字体大小
yfontsize3 = 12;

% 设置 x 轴标签，使用 LaTeX 语法，并设置字体大小
xlabel('Grain size ($log_{10}$)','interpreter','latex', 'FontSize', xfontsize3);

% 设置 y 轴标签，使用 LaTeX 语法，并设置字体大小
ylabel('Frequency (\%)','interpreter','latex', 'FontSize', yfontsize3);

% 注释掉的 colorbar 代码，如果需要显示颜色条，可以取消注释
% colorbar;

% 添加图例，图例的文本来自全局变量 selectedCellValue
legend(selectedCellValue); 

% 使用 uiputfile 函数弹出文件保存对话框，让用户选择保存图片的位置和文件名
[file,location] = uiputfile('*.jpg');

% 检查用户是否点击了“取消”
if isequal(file,0) || isequal(location,0)
    disp('User clicked Cancel.')
else
    % 用户选择了文件名和位置，保存图形为图片
    saveas(newFig,[location,file]); 
    
    % 更新 UI 中的文本控件，通知用户图片已保存
    set(handles.text9,'String',['The image has been saved',', and you can browse it in the corresponding folder.'])
    
    % 显示保存的文件完整路径
    disp(['User selected ',fullfile(location,file),...
         ' and then clicked Save.'])
end

% 关闭新创建的图形窗口
close(newFig); 
