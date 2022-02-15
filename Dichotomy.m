function dichotomy (a, b, eps)
    d = eps / 10;    
    k = 0;
    l = abs(b - a);
    K = [k];
    L = [l];

    while l > eps
        x1 = (a+b)/2 - d;
        x2 = (a+b)/2 + d;
        if f(x1) > f(x2)
            a = x1;
        else
            b = x2;
        end

        k = k + 1;
        l = abs(b - a);
        K(k+1) = k;
        L(k+1) = l;
    end
    
    x0 = (a+b)/2;
    stem(K, L);
    
    fprintf('\nРезультат:\n');
    fprintf('x* = %.7f\n', x0);
    fprintf('f* = %.7f\n', f(x0));
    fprintf('Количество итераций = %d\n', k);
    fprintf('Количество вычисленных функций = %d\n', 2*k);
end
