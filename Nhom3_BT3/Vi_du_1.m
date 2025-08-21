function compare_euler_rk4_simple
    % khai bao tham so
    x0 = 0;        % Gia tri ban dau cua x 
    y0 = 1;        % gia tri y, y(0) = 1
    h = 0.1;       % step
    Xend = 2;      % diem cuoi

    %tao vector x
    x = x0:h:Xend;
    m = length(x);

    % khoi tao mang luu gia tri
    y_euler = zeros(1, m);
    y_rk4 = zeros(1, m);
    y_ref = zeros(1, m); % nghiem tham chieu

    % set gia tri ban ??u
    y_euler(1) = y0;
    y_rk4(1) = y0;

    % nghiem tham chieu: y(x) = -x^2 + 1
    for i = 1:m
        y_ref(i) = -x(i)^2 + 1;
    end

    % phuong phap euler
    for i = 1:m-1
        y_euler(i+1) = y_euler(i) + h * (-2 * x(i)); % dy/dx = -2x
    end

    % Phuong phap RK4
    for i = 1:m-1
        k1 = -2 * x(i);
        k2 = -2 * (x(i) + h/2);
        k3 = -2 * (x(i) + h/2);
        k4 = -2 * (x(i) + h);
        y_rk4(i+1) = y_rk4(i) + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
    end

    % Ve do thi so sanh
    figure;
    plot(x, y_ref, 'ko', 'LineWidth', 2, 'DisplayName', 'Duong tham chieu'); % mau den, dau tron
    hold on;
    plot(x, y_euler, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Euler');        % xanh duong, duong lien
    plot(x, y_rk4, 'r--', 'LineWidth', 1.5, 'DisplayName', 'RK4');           % do, duong dut
    grid on;
    legend;
    xlabel('x');
    ylabel('y');
    title('so sanh phuong phap euler va rk4');
    grid on;
    grid minor;
end