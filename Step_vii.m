function [] = Step_vii(f, df, r1, r2, r3, maxItr, tol)
%Newton method on the complex plane
func = inline(f);
defunc = inline(df);

colormap([1 0 0; 0 1 0; 0 0 1; 1 1 1]);
M = 4 * ones(201,351);

for j = 1:201
    y = -1 + (j-1)*.01;
    for i = 1:351
        x = -2.5 + (i-1)*.01;
        z = x + y * 1i;
        itr = 0;
        while itr < maxItr
            z = z - func(z)/defunc(z);
            if abs(z-r1) < tol
                M(j,i) = 1;
                break;
            end
            if abs(z-r2) < tol
                M(j,i) = 2;
                break;
            end
            if abs(z-r3) < tol
                M(j,i) = 3;
                break;
            end
            itr = itr + 1;
        end
    end
end
image([-2.5 1], [-1 1], M);
axis xy;
disp('Red region corresponds to initial values that will converge to the root 1.');
disp('Green region corresponds to initial values that will converge to the root -0.5+sqrt(3)/(2*1i).');
disp('Blue region corresponds to initial values that will converge to the root -0.5-sqrt(3)/(2*1i).');
end



