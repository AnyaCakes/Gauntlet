function [R, Theta] = cleandata(r,theta)
    matrix = [r,theta];
    meanr = mean(r);
    R = r;
    Theta = theta;
    for n = 1:359
        m = 360 - n; 
        if r(m) > meanr + .01
            R(m) = [];
            Theta(m) = [];
        elseif r(m) == 0
            R(m) = [];
            Theta(m) = [];
        end 
    end
end