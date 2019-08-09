function D = Step_iv(c)

M = 2 * ones(401, 401);
L = 200;
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

r = zeros(1, 8);
N = zeros(1, 8);
itr = 1;
while itr <= 8
    r(itr) = floor(L);
    num = floor(length(M) / L);
    for n = 0 : num - 1
        for m = 0 : num - 1
            found = 0;
            for j = m * floor(L) + 1 : (m + 1) * floor(L)
                for i = n * floor(L) + 1 : (n + 1) * floor(L)
                    if M(i, j) == 1
                        found = 1;
                        N(itr) = N(itr) + 1;
                        break;
                    end
                end
                if found == 1
                    break;
                end
            end
        end
    end
    L = L / 2;
    itr = itr + 1;
end
df = -diff(log(N))./diff(log(r));
disp(['Fractal dimension, Df = ' num2str(mean(df(1:7)))]);
loglog(r, N, 'bo-');
xlabel('r');
ylabel('N');
