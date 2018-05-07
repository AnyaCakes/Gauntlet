
%edit your ranges to display here.  important to not include the actual
%location of your object in this grid of points or it will give you
%infinities
[x,y]=meshgrid(-20.5:1:20.5,-20.5:1:20.5);
[xlim,ylim] = size(x);
V = zeros(xlim, ylim);
r = .11;
for i=1:xlim
    for j=1:ylim
%this is the equation and integral with ranges for a specific object:  you
%should be able to figure out what this is and edit appropriately to get
%what you want
dV = @(theta)  log(sqrt((x(i,j)-r*cosd(theta)-1).^2 + (y(i,j)-sind(theta)).^2)).*r;
V(i,j) = integral(dV,0,360);
    end
end

hold off
contour(x,y,V)
[Ex,Ey] = gradient(V);
hold on
quiver(x,y,-Ex,-Ey)
axis 'equal'




