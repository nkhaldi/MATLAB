function Dichotomy(a, b, eps1, d)
    l = abs(b - a);
    k = 0;
    K = [k];
    L = [l];

    if (d > eps1/2)
        d = eps1/2;
    end
   
    while(l > eps1)
        k = k + 1;
        K(k) = k;
        x1 = (a + b)/2 - d;
        x2=(a + b)/2 + d;
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
    fprintf('\nf(x*) = %.57f', f(x0));
    fprintf('\nКоличество итераций = %.1f', k);
    fprintf('\nКоличество вычисленных функций = %.1f', 2*k);
    fprintf('\n \n');
end