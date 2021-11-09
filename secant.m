clc;
clear;
f = @ (x) 2*x^4-3*x^2+3*x-4;
%f = @ (x) 8*x^3-3*x^2+x-2;
%f = @ (x) 5*x^3+2*x-8;
p0 = 1;
p1 = 2;
N0 = 100;
TOL = 10^-8;
i = 1;
f0 = f(p0);
f1 = f(p1);
format long;
while i <= N0
    tic
    p = p1-f1*(p1-p0)/(f1-f0);
    fp = f(p);
    toc
    disp(i)
     fprintf('\nConvergence rate = %11.20f\n\n',abs(p-p1));
    if abs(p-p1) < TOL
       fprintf('\nApproximate solution p = %11.8f\n\n',p);
       break;
    else
       i = i+1;
       p0 = p1;
       f0 = f1;
       p1 = p;
       f1 = fp;
    end
end
toc


