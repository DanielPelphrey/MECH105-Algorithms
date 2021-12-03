function [I] = Simpson(x,y);
% x = [1 2 3 4 5 6 7];
% y = [2 1 2 1 2 1 3];
% x = [1 2];
% y = [1 1];
[a,n] = size(x);
[b,m] = size(y);
if n ~=  m;
    msg = "must have same numbers of variables";
    error(msg);
end
h = (x(n)-x(1))/(n-1);
if sum(x) ~= sum(x(1):h:x(n))
    msg2 = "x must have equal spacing";
    error(msg2);
end 


if rem(n,2) ~= 0 ;
even = y(2:2:n-1);
odd = y(3:2:n-2);
I = (x(n)-x(1))*(y(1)+4*sum(even)+2*sum(odd)+y(n))/(3*(n-1));   
elseif rem(n,2) == 0  & n == 2
    msg3 = "trap";
    warning(msg3);
I = h*(y(n-1)+y(n))/2;
else
     msg3 = "trap";
    warning(msg3);
even = y(2:2:n-2);
odd = y(3:2:n-3);
I = (x(n-1)-x(1))*(y(1)+4*sum(even)+2*sum(odd)+y(n-1))/(3*(n-2))+h*(y(n-1)+y(n))/2;
end

