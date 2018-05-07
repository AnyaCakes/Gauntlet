function [X,Y] = cleanpol2cart(r,theta)
    % converts a radius and angle to x and y cartesian, ignoring any zero
    % values
    r_clean = r;
    theta_clean = theta;
    for i = 0:length(r)-1
        j = length(r)-i;
        if r_clean(j) == 0
            r_clean(j) = [];
            theta_clean(j) = [];
        end
    end
    X = r_clean.*cosd(theta_clean);
    Y = r_clean.*sind(theta_clean);
end