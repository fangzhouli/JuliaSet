function [] = Step_viii(num_itr)
%Mandelbrot set fractal and color the points c that diverge
%fractal x y range

MAX_ITERATION = num_itr;

x = linspace(-2.5, 1.5, 2000);
y = linspace(-1.5, 1.5, 2000);

zval = zeros(2000, 2000);

for m = 1:2000
    realc = x(m);
    for n = 1:2000
        imagc = y(n);
        xn = 0;
        yn = 0;
        k = 1;
        while (k <= MAX_ITERATION) && ((xn^2 + yn^2) < 4)
            xnew = xn^2-yn^2+realc;
            ynew = 2*xn*yn+imagc;
            xn = xnew;
            yn = ynew;
            k = k + 1;
        end
        zval(n, m) = k;
    end
end

colormap(flipud(hot(MAX_ITERATION)));
image(x,y,zval);
end

