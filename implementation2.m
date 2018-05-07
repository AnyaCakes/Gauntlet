load playpensample.mat
d = .1;
n = 100; 
[r,theta] = cleandata(r,theta);
[test_r, test_theta] = splitDataSet(r,theta)

[line,inliers,outliers] = robustLineFit(r,theta,d,n);
plot(line(:,1),line(:,2),'b:');hold on;
[X,Y] = cleanpol2cart(r,theta);
plot(X, Y,'.k', 'MarkerSize',2);
%  [line3,inliers2,outliers2] = lessRobustLineFit(X,Y,d,n);
% plot(line(:,1),line(:,2),'y');
% plot(X, Y,'om');
index = 1;
num_outliers = length(outliers(:,1));
while num_outliers > 0
    [line,inliers,outliers] = lessRobustLineFit(outliers(:,1),outliers(:,2),d,n);
    num_outliers = length(outliers(:,1));
    plot(line(:,1),line(:,2),'b:');
    plot(inliers(:,1),inliers(:,2),'om');
    plot(outliers(:,1),outliers(:,2),'ok');
    pause
    index = index+1;
end

title('RANSAC Line Fitting'); 
legend('RANSAC line', 'LIDAR Data', 'RANSAC line','inliers', 'outliers')