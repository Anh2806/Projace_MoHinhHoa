function lam_nguoi_ca_phe_euler_rk4
    % Tham so mo hinh
    T0 = 90;      % Nhiet do ban dau cua ca phe (do C)
    Ta = 25;      % Nhiet do moi truong (do C)
    k = 0.1;      % He so truyen nhiet

    % Thoi gian mo phong
    t0 = 0;       % Thoi diem bat dau
    t_cuoi = 60;  % Thoi diem ket thuc (phut)
    buoc = 1;     % Buoc nhay thoi gian

    t = t0:buoc:t_cuoi;
    m = length(t);

    % Khoi tao cac mang ket qua
    T_euler = zeros(1, m);
    T_rk4 = zeros(1, m);
    T_dung = zeros(1, m); % Nghiem dung (giai tich)

    % Dieu kien ban dau
    T_euler(1) = T0;
    T_rk4(1) = T0;

    % Tinh nghiem dung
    for i = 1:m
        T_dung(i) = Ta + (T0 - Ta) * exp(-k * t(i));
    end

    % Phuong phap Euler
    for i = 1:m-1
        T_euler(i+1) = T_euler(i) + buoc * (-k * (T_euler(i) - Ta));
    end

    % Phuong phap Runge-Kutta bac 4
    for i = 1:m-1
        f = @(T) -k * (T - Ta);
        k1 = f(T_rk4(i));
        k2 = f(T_rk4(i) + buoc/2 * k1);
        k3 = f(T_rk4(i) + buoc/2 * k2);
        k4 = f(T_rk4(i) + buoc * k3);
        T_rk4(i+1) = T_rk4(i) + buoc/6 * (k1 + 2*k2 + 2*k3 + k4);
    end

    % Ve do thi
    figure;
    plot(t, T_dung, 'k-', 'LineWidth', 2, 'DisplayName', 'Nghiem dung');
    hold on;
    plot(t, T_euler, 'b--o', 'LineWidth', 1.5, 'DisplayName', 'Euler');
    plot(t, T_rk4, 'r--s', 'LineWidth', 1.5, 'DisplayName', 'RK4');
    grid on;
    xlabel('Thoi gian (phut)');
    ylabel('Nhiet do (do C)');
    title('Mo phong su giam nhiet do cua coc ca phe');
    legend show;
end
