function [X,Y] = pol2cart(r_clean,theta_clean)
    % converts a radius and angle to x and y cartesian
    X = r_clean.*cosd(theta_clean);
    Y = r_clean.*sind(theta_clean);
end