function mainApp
    % ����������
    hFig = uifigure('Name', 'Login', 'Position', [100, 100, 300, 200]);

    % �����û��������
    txtUsername = uieditfield(hFig, 'Text', 'Position', [100, 160, 150, 22]);

    % �����û����Աߵ���ʾ��ǩ
    uilabel(hFig, 'Text', 'Username', 'Position', [20, 163, 80, 18]);

    % �������������
    txtPassword = uieditfield(hFig, 'InputType', 'password', 'Position', [100, 130, 150, 22]);

    % ���������Աߵ���ʾ��ǩ
    uilabel(hFig, 'Text', 'Password', 'Position', [20, 133, 80, 18]);

    % ������¼��ť
    btnLogin = uibutton(hFig, 'push', 'Text', 'Login', 'Position', [100, 100, 80, 22], 'ButtonPushedFcn', @loginButtonPushed);

    % ���������һ�����
    lnkPasswordRecovery = uilink(hFig, 'Text', 'Forgot Password?', 'Position', [110, 70, 80, 20], 'ButtonPushedFcn', @passwordRecoveryLinkClicked);
end

% ��¼��ť�Ļص�����
function loginButtonPushed(src, event)
    username = uigetvalue(src.Parent, 'txtUsername');
    password = uigetvalue(src.Parent, 'txtPassword');

    % �������������֤�߼�
    if verifyPassword(username, password)
        uialert(src.Parent, 'Login Successful', 'Success');
    else
        uialert(src.Parent, 'Invalid username or password', 'Error');
    end
end

% �����һ����ӵĻص�����
function passwordRecoveryLinkClicked(src, event)
    uialert(src.Parent, 'Please contact support for password recovery.', 'Password Recovery');
end

% ������֤����
function isValid = verifyPassword(username, password)
    % ����Ӧ�����ʵ�ʵ���֤�߼�������ֻ��һ��ʾ��
    isValid = strcmp(username, 'admin') && strcmp(password, 'password123');
end