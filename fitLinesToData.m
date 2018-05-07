function fitLinesToData(d, n, filename)
    load(filename);
    [r,theta] = cleandata(r,theta);
    [line, ~, outliers] = robustLineFit(r,theta,d,n);
    plot(line(:,1),line(:,2),'b:'); 
    hold on;
    [X,Y] = cleanpol2cart(r,theta);
    plot(X,Y,'.k','MarkerSize',2);
    index = 1;
    num_outliers = length(outliers(:,1));
    while num_outliers > 0 
        [line,inliers,outliers] = lessRobustLineFit(outliers(:,1),outliers(:,2),d,n);
        num_outliers = length(outliers(:,1));
        plot(line(:,1),line(:,2),'b:');
%         plot(inliers(:,1),inliers(:,2),'om');
%         plot(outliers(:,1),outliers(:,2),'ok');
        pause
        index = index+1;
    title('RANSAC Line Fitting');
end