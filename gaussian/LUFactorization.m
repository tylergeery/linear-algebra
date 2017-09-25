function [L, U] = LUFactorization(A)
    [rows, columns] = size(A)
    L = eye([rows, columns]) % unit lower triangular
    U = zeros([rows, columns]) % upper triangular

    for r = 1:rows-1
        % set first row to U
        U(r, r:end) = A(r, r:end)

        % set L values
        L(r+1:end, r) = A(r+1:end, r) / A(r, r)

        % adjust A
        A(r+1:end, r+1:end) = A(r+1:end, r+1:end) - L(r+1:end, r) * A(r, r+1:end)
    end
