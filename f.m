function y = f(x)
    r1= exp((x.^4+2.*x.^3-5.*x+6)./5);
    r2=(1./((-15).*x.^3+10.*x+5.*sqrt(10)));
    y= r1+r2-3;
end
