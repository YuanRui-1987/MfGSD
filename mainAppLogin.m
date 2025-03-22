function mainApp
    % 创建主窗口
    hFig = uifigure('Name', 'Login', 'Position', [100, 100, 300, 200]);

    % 创建用户名输入框
    txtUsername = uieditfield(hFig, 'Text', 'Position', [100, 160, 150, 22]);

    % 创建用户名旁边的提示标签
    uilabel(hFig, 'Text', 'Username', 'Position', [20, 163, 80, 18]);

    % 创建密码输入框
    txtPassword = uieditfield(hFig, 'InputType', 'password', 'Position', [100, 130, 150, 22]);

    % 创建密码旁边的提示标签
    uilabel(hFig, 'Text', 'Password', 'Position', [20, 133, 80, 18]);

    % 创建登录按钮
    btnLogin = uibutton(hFig, 'push', 'Text', 'Login', 'Position', [100, 100, 80, 22], 'ButtonPushedFcn', @loginButtonPushed);

    % 创建密码找回链接
    lnkPasswordRecovery = uilink(hFig, 'Text', 'Forgot Password?', 'Position', [110, 70, 80, 20], 'ButtonPushedFcn', @passwordRecoveryLinkClicked);
end

% 登录按钮的回调函数
function loginButtonPushed(src, event)
    username = uigetvalue(src.Parent, 'txtUsername');
    password = uigetvalue(src.Parent, 'txtPassword');

    % 这里添加密码验证逻辑
    if verifyPassword(username, password)
        uialert(src.Parent, 'Login Successful', 'Success');
    else
        uialert(src.Parent, 'Invalid username or password', 'Error');
    end
end

% 密码找回链接的回调函数
function passwordRecoveryLinkClicked(src, event)
    uialert(src.Parent, 'Please contact support for password recovery.', 'Password Recovery');
end

% 密码验证函数
function isValid = verifyPassword(username, password)
    % 这里应该添加实际的验证逻辑，这里只是一个示例
    isValid = strcmp(username, 'admin') && strcmp(password, 'password123');
end