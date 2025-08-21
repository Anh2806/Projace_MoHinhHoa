function bai3_he_dieu_khien
    % Tham so he thong
    omega = 2 * pi;    % tan so tu do (rad/s)
    zeta = 0.1;        % he so can
    u = 1;             % tin hieu vao (hang so)
    
    % Dieu kien ban dau
    y0 = 0;            
    v0 = 0;            

    % Thoi gian mo phong
    h = 0.01;
    T = 2;             % thoi gian cuoi
    t = 0:h:T;
    N = length(t);

    % Khoi tao vector nghiem
    y_euler = zeros(1, N);
    v_euler = zeros(1, N);
    y_rk4 = zeros(1, N);
    v_rk4 = zeros(1, N);

    % Gan gia tri ban dau
    y_euler(1) = y0;
    v_euler(1) = v0;
    y_rk4(1) = y0;
    v_rk4(1) = v0;

    % Euler method
    for i = 1:N-1
        y_euler(i+1) = y_euler(i) + h * v_euler(i);
        v_euler(i+1) = v_euler(i) + h * (omega^2 * (u - y_euler(i)) - 2*zeta*omega*v_euler(i));
    end

    % RK4 method
    for i = 1:N-1
        % y' = v
        % v' = omega^2*(u - y) - 2*zeta*omega*v

        k1y = v_rk4(i);
        k1v = omega^2 * (u - y_rk4(i)) - 2*zeta*omega*v_rk4(i);

        k2y = v_rk4(i) + 0.5*h*k1v;
        k2v = omega^2 * (u - (y_rk4(i) + 0.5*h*k1y)) - 2*zeta*omega*(v_rk4(i) + 0.5*h*k1v);

        k3y = v_rk4(i) + 0.5*h*k2v;
        k3v = omega^2 * (u - (y_rk4(i) + 0.5*h*k2y)) - 2*zeta*omega*(v_rk4(i) + 0.5*h*k2v);

        k4y = v_rk4(i) + h*k3v;
        k4v = omega^2 * (u - (y_rk4(i) + h*k3y)) - 2*zeta*omega*(v_rk4(i) + h*k3v);

        y_rk4(i+1) = y_rk4(i) + (h/6)*(k1y + 2*k2y + 2*k3y + k4y);
        v_rk4(i+1) = v_rk4(i) + (h/6)*(k1v + 2*k2v + 2*k3v + k4v);
    end

% Ve do thi ket qua
figure;

% Bieu do y(t)
subplot(2,1,1);
plot(t, y_euler, 'b-o', 'LineWidth', 1.5, 'MarkerSize', 2, 'DisplayName', 'Euler y');   % xanh duong, tron
hold on;
plot(t, y_rk4, 'r--s', 'LineWidth', 1.5, 'MarkerSize', 2, 'DisplayName', 'RK4 y');      % do, dut, vuong
title('So sanh y(t)');
xlabel('t');
ylabel('y');
legend('Location', 'best');
grid on;
grid minor;

% Bieu do v(t)
subplot(2,1,2);
plot(t, v_euler, 'g-^', 'LineWidth', 1.5, 'MarkerSize', 1, 'DisplayName', 'Euler v');   % xanh la, tam giac
hold on;
plot(t, v_rk4, 'm--d', 'LineWidth', 1.5, 'MarkerSize', 1, 'DisplayName', 'RK4 v');      % tim, dut, thoi
title('So sanh v(t)');
xlabel('t');
ylabel('v');
legend('Location', 'best');
grid on;
grid minor;
end