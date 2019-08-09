function [orbit, flag] = Step_v(f,z)
phi = inline(f);
zn = phi(z);
orb = z;
kount = 1;
while kount < 100
    if abs(zn) > 100
        flag = 0;
        disp('The Julia set is Not Connected.');
        break;
    end
    orb = [orb zn];
    z = zn;
    zn = phi(z);
    kount = kount + 1;
end
if kount == 100
    flag = 1;
    disp('The Julia set is Connected.');
end
orbit = orb;
    %hold on;
    %for i = 1:kount
        %plot(real(orbit(i)), imag(orbit(i)), '--* r');
    %end
    %hold off;
end

