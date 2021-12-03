function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%function that finds roots of a function using false position method

if nargin<3,error('at least 3 input arguments required'),end
test = func(xl,varargin{:}) * func(xu,varargin{:});
%this checks for sign change on interval ie root
if test>0,error('no sign change'),end
if nargin<4|isempty(es), es = 0.0001;end
%set default es
if nargin<5|isempty(maxit), maxit = 200;end
iter = 0; xr = xl; ea = 100;
while (1)
 xrold = xr;
 xr = xu - (func(xu).*(xl-xu))./(func(xl)-func(xu))
 iter = iter + 1;
  %updare iteration
  if xr ~= 0
  ea = abs((xr - xrold)/xr) * 100;
  end
  %test if error is low enough to stop
  test = func(xl,varargin{:}) * func(xr,varargin{:});
  %check for sign change again
  if test < 0
    xu = xr;
  elseif test > 0
    xl = xr;
  else
    ea = 0;
  end
  if ea <= es | iter >= maxit,break,end
end
root = xr; fx = func(xr, varargin{:});
%testFunc = @(x) x.^3;
%x_left = -1;
%x_right = 1;
%[root, fx, ea, iter] = bisect(testFunc, x_left, x_right)