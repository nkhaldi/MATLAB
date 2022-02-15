% Метод Ньютона

function newton(Q, b, c, eps, x0)
    Xmin = -inv(Q)*b;
    dx = Xmin(1) - x0(1);
    dy = Xmin(2) - x0(2);
    x = linspace(Xmin(1) - dx,Xmin(1) + dx);
    y = linspace(Xmin(2) - dy,Xmin(2) + dy);
    [xx, yy] = meshgrid(x,y);
    qq = Q(1,1)*xx.^2 + 2*Q(1,2)*(xx.*yy) + Q(2,2)*yy.^2;
    bb = b(1)*xx + b(2)*yy;
    ff = 0.5*qq + bb + c;
    ss = [f(x0)];
    w = -(Q*x0 + b);
    X = [x0(1)];
    Y = [x0(2)];
    i = 0;
    nw = 1;
    while nw > eps
        i = i + 1;
        xsl = linsolve(Q, w);
        x0 = x0 + xsl;
        w = -(Q*x0 + b);
        nw = norm(xsl);
        ss(i+1) = f(x0);
        X(i+1) = x0(1);
        Y(i+1) = x0(2);
    end
    grid on;
    hold on;
    contour(xx, yy, ff, ss, 'showText', 'on');
    plot(X, Y);
    fprintf('\nРезультат:\n');
    fprintf('x* = (%.7f, %.7f)\n', x0(1), x0(2));
    fprintf('f* = %.7f\n', f(x0));
    fprintf('Количество итераций = %d\n', i);
end
