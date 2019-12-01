function Golden_ratio (a, b, eps1)
    k = 0;
    l = abs(b - a);
    t = 1.6180339887498948482;
    K = [k];
    L = [l];

    while(l > eps1)
        k = k + 1;
        K(k) = k;
        x1 = b - ((b - a)/t);
        x2=a + ((b - a)/t);
        if (f(x1) > f(x2))
            a = x1;
        else
            b = x2;
        end
        l = abs(b - a);
        L(k) = l;
    end
    
    x0 = (a + b)/2;
    stem(K, L);

    fprintf('\nРезультат:');
    fprintf('\nx* = %.7f', x0);
    fprintf('\nf(x*) = %.7f', f(x0));
    fprintf('\nКоличество итераций = %.1f', k);
    fprintf('\nКоличество вычисленных функций = %.1f', k+2);
    fprintf('\n \n');
end