% Filled Julia Set Implementation

function [] = Step_i(f, fixpt1, fixpt2)

phi = inline(f);

colormap([1 0 0; 1 1 1]); % Points numbered 1 (inside) will be colored red;
                          %  those numbered 2 (outside) will be white.
M = 2 * ones(301, 301);   % Initialize array of point colors to 2 (white).

for j = 1 : 301
    y = -1.5 + (j - 1) * 0.01;
    for i = 1 : 301
        x = -1.5 + (i - 1) * 0.01;
        z = x + 1i * y;   % 1i is the MATLAB symbol for sqrt(-1);
        zk = z;
        iflag1 = 0;       % iflag1, iflag2 count the number of iterations;
        iflag2 = 0;       %  when a root is within 1.e-6 of a fixed point.
        kount = 0;        % kount is the total number of iterations.
        
        while kount < 100 && abs(zk) < 2 && iflag1 < 5 && iflag2 < 5
            kount = kount + 1;
            zk = phi(zk);
            
            err1 = abs(zk - fixpt1); % Test for convergence to fixpt1
            if err1 < 1.e-6, iflag1 = iflag1 + 1; else, iflag1 = 0; end
            
            err2 = abs(zk - fixpt2); % Test for convergence to fixpt2
            if err2 < 1.e-6, iflag2 = iflag2 + 1; else, iflag2 = 0; end  
        end
        
        if iflag1 >= 5 || iflag2 >= 5 || kount >= 100 % If orbit is bounded
            M(j, i) = 1;                              %  point color to 1.
        end
    end
end

image([-2, 2], [-2, 2], M),
axis xy
