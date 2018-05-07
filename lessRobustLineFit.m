function [best_line,inliers,outliers] = lessRobustLineFit(X,Y,d,n)
    matrix = [X,Y];
    
    minx = min(matrix(:,1));
    miny = min(matrix(:,2));
    maxx = max(matrix(:,1));
    maxy = max(matrix(:,2));
    size = max([maxx-minx,maxy-miny]);
    t = linspace(-size/6,size/6,100)';

    max_count = 0;
    best_line = 0;
    for m = 1:n
            while 1 
            rand1 = randi(length(X));
            rand2 = randi(length(X));
            if rand2 ~= rand1
                break
            end
        end
        rand1 = [matrix(rand1,1), matrix(rand1,2)];
        rand2 = [matrix(rand2,1), matrix(rand2,2)];
        lhat = (rand2-rand1) / norm(rand2-rand1);
        line = rand1 + t.*lhat;
    %     figure; clf;
    %     plot(line(:,1),line(:,2),'k');hold on;
    %     plot(rand1(1), rand1(2),'om');
    %     plot(rand2(1), rand2(2),'om');

        xvals = matrix(:,1);
        yvals = matrix(:,2);
        count = 0;
        for k = 1:length(xvals)
            test = [xvals(k),yvals(k)];
            a = distance(rand1,test);
            dtest = a - (a.*lhat).*lhat;
            if norm(dtest) <= d
                count = count + 1;
%                 inliers(count,:) = test;
                inliers_index(count,:) = k;
            end
        end
        inliers = matrix(inliers_index,:);
        outliers = matrix;
        outliers(inliers_index,:) = [];
        if count > max_count
            max_count = count;
            best_line = line;
        end
    end
end