function [] = Step_vi(f)
%ColorDivOrb: assigns a color to the divergent orbits in the Julia set.
%             The coloring is assigned according to the time the orbits 
%             take to diverge (i.e. |z| > 100).
%             Two orbits, one that gets |z| ~= 100 at iteration n and 
%             another at iteration n + 1 have similar colors.
col = hot(100);

phi = inline(f);
hold on;
for j = 1:201
    y = -2 + (j-1)*0.02;
    for i = 1:201
        x = -2 +(i-1)*0.02;
        z = x + 1i*y;
        [orb, flag] = Step_v(f,z);
        if flag == 0
            k = length(orb);
            plot(orb, '.', 'MarkerSize', 10, 'Color', col(k,:));
        end
    end
end
hold off;
end

