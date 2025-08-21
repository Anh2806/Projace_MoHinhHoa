function bong_roi_ma_sat
    % Tham so
    h0 = 100;      % Do cao ban dau (m)
    v0 = 0;        % Van toc ban dau (m/s)
    g = 9.81;      % Gia toc trong truong (m/s^2)
    k = 0.1;       % He so ma sat
    m = 1;         % Khoi luong (kg)

    % Thoi gian mo phong
    t0 = 0;
    t_cuoi = 10;
    buoc = 0.01;

    t = t0:buoc:t_cuoi;
    m_len = length(t);

    % Khoi tao mang ket qua
    y_euler = zeros(1, m_len); % do cao
    v_euler = zeros(1, m_len); % van toc
    y_rk4 = zeros(1, m_len);
    v_rk4 = zeros(1, m_len);

    % Dieu kien ban dau
    y_euler(1) = h0;
    v_euler(1) = v0;
    y_rk4(1) = h0;
    v_rk4(1) = v0;

    % PHUONG PHAP EULER
    for i = 1:m_len-1
        y_euler(i+1) = y_euler(i) + buoc * v_euler(i);
        v_euler(i+1) = v_euler(i) + buoc * (-g + (k/m)*v_euler(i)^2);
    end

    % PHUONG PHAP RUNGE-KUTTA 4
    for i = 1:m_len-1
        % He phuong trinh: dy/dt = v, dv/dt = -g + (k/m)*v^2
        f1 = @(v) v;
        f2 = @(v) -g + (k/m)*v^2;

        k1y = f1(v_rk4(i));
        k1v = f2(v_rk4(i));

        k2y = f1(v_rk4(i) + buoc/2 * k1v);
        k2v = f2(v_rk4(i) + buoc/2 * k1v);

        k3y = f1(v_rk4(i) + buoc/2 * k2v);
        k3v = f2(v_rk4(i) + buoc/2 * k2v);

        k4y = f1(v_rk4(i) + buoc * k3v);
        k4v = f2(v_rk4(i) + buoc * k3v);

        y_rk4(i+1) = y_rk4(i) + (buoc/6)*(k1y + 2*k2y + 2*k3y + k4y);
        v_rk4(i+1) = v_rk4(i) + (buoc/6)*(k1v + 2*k2v + 2*k3v + k4v);
    end

    % Ve do thi
    figure;
    subplot(2,1,1);
    plot(t, y_euler, 'b-', t, y_rk4, 'r--', 'LineWidth', 1.5);
    xlabel('Thoi gian (s)');
    ylabel('Do cao (m)');
    title('Do cao theo thoi gian');
    legend('Euler', 'RK4');
    grid on;

    subplot(2,1,2);
    plot(t, v_euler, 'b-', t, v_rk4, 'r--', 'LineWidth', 1.5);
    xlabel('Thoi gian (s)');
    ylabel('Van toc (m/s)');
    title('Van toc theo thoi gian');
    legend('Euler', 'RK4');
    grid on;
end
