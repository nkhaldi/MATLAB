% Метод квадратичной аппроксимации

function quadr_approx (a, b, eps)
    t = (a + b) / 2;
    k = 0;
    l = abs(b - a);
    K = [k];
    L = [l];
    while l > eps
        fa = f(a);
        fb = f(b);
        ft = f(t);
        t1 = (fa*(t.^2-b.^2) + fb*(a.^2-t.^2)) + ft*(b.^2-a.^2);
        t2 = 2*(fa*(t-b) + fb*(a-t) + ft*(b-a));
        tm = t1 / t2;
        if tm >= t
            a = t;
            t = tm;
        else
            b = t;
            t = tm;
        end
        k = k + 1;
        l = abs(b - a);
        K(k+1) = k;
        L(k+1) = l;
    end
    x0 = (a + b) / 2;
    stem(K, L);
    fprintf('\nРезультат:\n');
    fprintf('x* = %.7f\n', x0);
    fprintf('f* = %.7f\n', f(x0));
    fprintf('Количество итераций = %d\n', k);
    fprintf('Количество вычисленных функций = %d\n', 3*k);
end
