clc;
clear;
p0 = 0;
p1 = 1;
p2 = 2;
TOL = 10^-8;
N0 = 9;
format long;
f = @ (x) 2*x^4-3*x^2+3*x-4;
%f = @ (x) 8*x^3-3*x^2+x-2;
%f = @ (x) 5*x^3+2*x-8;
h1 = p1 - p0;
h2 = p2 - p1;
DELTA1 = (f(p1) - f(p0))/h1;
DELTA2 = (f(p2) - f(p1))/h2;
d = (DELTA2 - DELTA1)/(h2 + h1);
i=1;
while i <= N0
      tic
      b = DELTA2 + h2*d;
      D = (b * b - 4 * f(p2) * d)^(1/2);
      if abs(b-D) < abs(b+D)
          E = b + D;
      else
          E = b - D;
      end
      h = -2 * f(p2) / E;
      p = p2 + h;
      fprintf('\nConvergence rate = %11.100f\n\n',abs(h));
      disp(i)
      toc
      if abs(h) < TOL
          p
          disp(p);
          break
      end
      p0 = p1;
      p1 = p2;
      p2 = p;
      h1 = p1 - p0;
      h2 = p2 - p1;
      DELTA1 = (f(p1) - f(p0))/h1;
      DELTA2 = (f(p2) - f(p1))/h2;
      d = (DELTA2 - DELTA1)/(h2 + h1);
      i = i + 1;
end

if i > N0
      fprintf('The method failed after N0 iterations,N0= %d \n',N0);
end