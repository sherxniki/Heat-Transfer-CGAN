for k=1:7500
    % Define constants and boundary temperatures
    a = randi([10 100]); % randomly generate values between 10 and 100
    b = randi([10 100]);
    c = randi([10 100]);
    d = randi([10 100]);
    T = 50; % temperature inside the square
    L = 50; % length of the square
    dx = 1; % grid spacing
    dy = 1;
    nx = L/dx;
    ny = L/dy;
    % Initialize temperature matrix
    T_matrix = T * ones(nx, ny);
    % Set boundary conditions
    T_matrix(:, 1) = a;
    T_matrix(:, end) = c;
    T_matrix(1, :) = d;
    T_matrix(end, :) = b;
    % Plot input image with boundary temperature conditions
    input_image = figure(1);
    imagesc(T_matrix);
    axis off;
    %colorbar;
    %title(sprintf('Boundary temperatures: a=%d, b=%d, c=%d, d=%d', a, b, c, d));
    %xlabel('X');
    %ylabel('Y');
    %axis equal tight;
    name = strcat('ti/it', num2str(k));
    saveas(input_image,[name,'.jpg']);
    % Calculate steady-state solution using finite difference method
    for iter = 1:100
        for i = 2:nx-1
            for j = 2:ny-1
                T_matrix(i,j) = (T_matrix(i+1,j) + T_matrix(i-1,j) + T_matrix(i,j+1) + T_matrix(i,j-1))/4;
            end
        end
    end
    % Plot output image with steady-state solution
    output_image = figure(2);
    imagesc(T_matrix);
    axis off;
    %colorbar;
    %title(sprintf('Steady-state solution: a=%d, b=%d, c=%d, d=%d', a, b, c, d));
    %xlabel('X');
    %ylabel('Y');
    %axis equal tight;
    name = strcat('to/ot', num2str(k));
    saveas(output_image,[name,'.jpg']);
    
    % a b c d parameters stored
    
    figure(3);
    colorbar
    axis off;
    title(sprintf('Steady-state solution: a=%d, b=%d, c=%d, d=%d', a, b, c, d));
    name = strcat('pm/p', num2str(k));
    saveas(figure(3),[name,'.jpg']);
    
end
