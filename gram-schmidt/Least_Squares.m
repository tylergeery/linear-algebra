% This script solves the equation Ax=b for a passed A and b.
% This will use least squares method to solve for the "best" x
function [x] = Least_Squares(A, b)
    % Get Q & R to solve Rx = Q'b
    [Q, R] = QR_Factorization(A);

    x = inv(R) * Q' * b;
end
