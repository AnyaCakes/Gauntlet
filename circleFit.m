function [X,Y,R] = circleFit(x1, y1, x2, y2, x3, y3)
    A = x1*(y2 - y3)-y1*(x2 - x3) + x2*y3 - x3*y2
    B = (x1^2 + y1^2)*(y3-y2) + (x2^2+y2^2)*(y1-y3)+(x3^2+y3^2)*(y2-y1)
    C = (x1^2 + y1^2)*(x2-x3)+(x2^2+y2^2)*(x3-x1)+(x3^2+y3^2)*(x1-x2)
    D = (x1^2+y1^2)*(x3*y2-x2*y3)+(x2^2+y2^2)*(x1*y3-x3*y1)+(x3^2+y3^2)*(x2*y1-x1*y2)
    X = -B/(2*A)
    Y = -C/(2*A)
    R = sqrt(abs((B^2+C^2-4*A*D)/(4*A^2)))
end