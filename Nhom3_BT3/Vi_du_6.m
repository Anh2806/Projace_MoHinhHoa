function mach_rc_euler_rk4
    % Tham so mach
    R = 1000;          % Dien tro (Ohm)
    C = 0.001;         % Dien dung (Farad)
    V_in = 5;          % Dien ap nguon (Volt)
    V0 = 0;            % Dien ap ban dau tren tu (Volt)

    % Thoi gian mo phong
    t0 = 0;
    t_cuoi = 0.1;       % 100ms
    buoc = 0.001;

    t = t0:buoc:t_cuoi;
    m = length(t);

    % Khoi tao mang ket qua
    V_euler = zeros(1, m);
    V_rk4 = zeros(1, m);
    V_giaitich = zeros(1, m);  % Nghiem dung

    % Dieu kien ban dau
    V_euler(1) = V0;
    V_rk4(1) = V0;

    % Nghiem giai tich (doi voi V_in hang so)
    for i = 1:m
        V_giaitich(i) = V_in * (1 - exp(-t(i)/(R*C)));
    end

    % Phuong phap Euler
    for i = 1:m-1
        V_euler(i+1) = V_euler(i) + buoc * ((V_in - V_euler(i)) / (R*C));
    end

    % Phuong phap RK4
    for i = 1:m-1
        f = @(V) (V_in - V)/(R*C);
        k1 = f(V_rk4(i));
        k2 = f(V_rk4(i) + buoc/2 * k1);
        k3 = f(V_rk4(i) + buoc/2 * k2);
        k4 = f(V_rk4(i) + buoc * k3);
        V_rk4(i+1) = V_rk4(i) + (buoc/6) * (k1 + 2*k2 + 2*k3 + k4);
    end

    % Ve do thi ket qua
    figure;
    plot(t, V_giaitich, 'k-', 'LineWidth', 2, 'DisplayName', 'Nghiem dung');
    hold on;
    plot(t, V_euler, 'b--', 'LineWidth', 1.5, 'DisplayName', 'Euler');
    plot(t, V_rk4, 'r-.', 'LineWidth', 1.5, 'DisplayName', 'RK4');
    grid on;
    xlabel('Thoi gian (s)');
    ylabel('Dien ap tren tu (V)');
    title('Mo phong mach RC don gian');
    legend show;
end
