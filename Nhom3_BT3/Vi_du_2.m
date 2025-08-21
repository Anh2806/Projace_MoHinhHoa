function harmonic_oscillator
    % Cac thong so
    k = 1;      % He so lo xo
    t0 = 0;     % Thoi diem ban dau
    tend = 10;  % Thoi diem ket thuc
    h = 0.1;    % Buoc nhay
    x0 = 1;     % Vi tri ban dau
    v0 = 0;     % Van toc ban dau
    
    % Tao mang thoi gian
    t = t0:h:tend;
    n = length(t);
    
    % Khoi tao ket qua
    x_euler = zeros(1, n);
    v_euler = zeros(1, n);
    x_rk4 = zeros(1, n);
    v_rk4 = zeros(1, n);
    
    % Gia tri ban dau
    x_euler(1) = x0;
    v_euler(1) = v0;
    x_rk4(1) = x0;
    v_rk4(1) = v0;
    
    % Tinh toan
    for i = 1:n-1
        %Euler
        x_euler(i+1) = x_euler(i) + h * v_euler(i);
        v_euler(i+1) = v_euler(i) - h * k * x_euler(i);
        
        % RK4
        k1x = v_rk4(i);
        k1v = -k*x_rk4(i);
        
        k2x = v_rk4(i) + h*k1v/2;
        k2v = -k*(x_rk4(i) + h*k1x/2);
        
        k3x = v_rk4(i) + h*k2v/2;
        k3v = -k*(x_rk4(i) + h*k2x/2);
        
        k4x = v_rk4(i) + h*k3v;
        k4v = -k*(x_rk4(i) + h*k3x);
        
        x_rk4(i+1) = x_rk4(i) + h * (k1x + 2*k2x + 2*k3x + k4x)/6;
        v_rk4(i+1) = v_rk4(i) + h * (k1v + 2*k2v + 2*k3v + k4v)/6;
    end
    
    % Plot
    subplot(2, 1, 1);
    plot(t, x_euler, 'b--', t, x_rk4, 'r-');
    legend('Euler', 'RK4');
    xlabel('Thoi gian');
    ylabel('Vi tri');
    title('So sanh vi tri theo thoi gian');
    grid on
    
    subplot(2, 1, 2);
    plot(t, v_euler, 'b--', t, v_rk4, 'r-');
    legend('Euler', 'RK4');
    xlabel('Thoi gian');
    ylabel('Van toc');
    title('So sanh van toc theo thoi gian');
    grid on
end