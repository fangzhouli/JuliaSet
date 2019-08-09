% Inverse Iteration method.
function [] = Step_iii(c)

colormap([1 0 0; 1 1 1]);

M = 2 * ones(401, 401);

for j = 1 : 401
    y = -2 + (j - 1) * 0.01;
    for i = 1 : 401
        x = -2 + (i - 1) * 0.01;
        z = x + y * 1i;
        
        zk = z;
        itr = 1;
        rdm = randi(2, 50, 1);
        while itr <= 50
            if rdm(itr) == 2
                rdm(itr) = -1;
            end
            zk = rdm(itr) * sqrt(zk - c);
            itr = itr + 1;
        end
        xi = floor((real(zk) + 2) / 0.01) + 1;
        yi = floor((imag(zk) + 2) / 0.01) + 1;
        if xi > 0 && yi > 0
            M(yi, xi) = 1;
        end
    end
end

image([-2, 2], [-2, 2], M),
axis xy
