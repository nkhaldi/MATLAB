% Метод золотого сечения

function golden_ratio (a, b, eps)
    t = 1.6180339887498948482;    
    k = 0;
    l = abs(b-a);
    K = [k];
    L = [l];
    while l > eps
        x1 = b - ((b - a) / t);
        x2 = a + ((b - a) / t);
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
    fprintf('Количество вычисленных функций = %d\n', k+2);
end
