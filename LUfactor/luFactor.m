

%LU decomposition with pivoting
function [L, U, P] = luFactor(A);
%A = [-3 2 -1;10 -6 2; 1 1 5]

[m,b] = size(A);
if m ~=  b;
    msg = "Matrix must be square";
    error(msg)
end

%finds size of matrix ex. 3x3
n = size(A,1);

P = eye(size(A));
L = zeros(size(A));

%for loop for number of rows that need to be solved
for iter = 1:(n-1);

    %pivot A/U matrix
    %find row in A with greatest value to pivot to top
    pivLine = max(abs(A(iter:n,iter)));
    %need to make find in lower rows for later iterations
    
    %find decide what row it is in
    [row,col] = find(abs(A)==pivLine);
         
    %move row to position in A and P
    swap = [iter,row];
    A(swap,:) = A(swap([2,1]),:);
    P(swap,:) = P(swap([2,1]),:);
    
    %reposition L
    if iter > 1;
        L(swap,:) = L(swap([2,1]),:);
    end
        
    %Forward elimination loop
    for E = iter:(n-1);
        %divide a(2,1) by a(1,1)
        %L1 goes into L matrix
        L1 = A(E+1,iter)/A(iter,iter);
        %multiply L matrix value by eq 1
        AL = L1*A(iter,:);
        %subtract new eq1 from eq2
        A(E+1,:) = A(E+1,:) - AL;
        %insert L1 into L
        L(E+1,iter) = L1;
    end
end
U = A;
L = eye(n) + L;
% P
% % P*A
% % L*U
% % P*B
% % L*U
% % [l, u, p] = lu(B)

% P*A==L*U
end


%TEST CODE
% A = [10 2 -1;
%     -3 -6 2;
%     1 1 5]
