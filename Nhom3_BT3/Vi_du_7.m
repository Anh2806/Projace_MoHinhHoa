function logistic_model_euler_rk4
    % Tham so
    r = 0.5;         % toc do tang truong
    K = 1000;        % suc chua moi truong
    N0 = 10;         % dan so ban dau

    % Thoi gian mo phong
    t0 = 0;
    t_end = 20;
    h = 0.1;
    t = t0:h:t_end;
    m = length(t);

    % Khoi tao mang ket qua
    N_euler = zeros(1, m);
    N_rk4 = zeros(1, m);
    N_euler(1) = N0;
    N_rk4(1) = N0;

    % Phuong trinh logistic: dN/dt = r*N*(1 - N/K)

    % Euler
    for i = 1:m-1
        N = N_euler(i);
        N_euler(i+1) = N + h * (r * N * (1 - N / K));
    end

    % RK4
    for i = 1:m-1
        f = @(N) r * N * (1 - N / K);
        k1 = f(N_rk4(i));
        k2 = f(N_rk4(i) + h/2 * k1);
        k3 = f(N_rk4(i) + h/2 * k2);
        k4 = f(N_rk4(i) + h * k3);
        N_rk4(i+1) = N_rk4(i) + h/6 * (k1 + 2*k2 + 2*k3 + k4);
    end

    % Ve do thi
    figure;
    plot(t, N_euler, 'b--', 'LineWidth', 1.5, 'DisplayName', 'Euler');
    hold on;
    plot(t, N_rk4, 'r-', 'LineWidth', 1.5, 'DisplayName', 'RK4');
    grid on;
    xlabel('Thoi gian');
    ylabel('Dan so N');
    title('Mo phong mo hinh tang truong logistic');
    legend show;
end
