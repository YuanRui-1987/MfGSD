clear
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