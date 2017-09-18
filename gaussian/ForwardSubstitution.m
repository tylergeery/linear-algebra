function [b_out] = ForwardSubstitution(A, b)
    [~, columns_A] = size(A)

    for c = 1:columns_A-1
        % forward substitute for right side of equation matrix
        M = eye(columns_A)
        M(c+1:end, c) = A(c+1:end, c) * -1
        b = M*b
    end

    b_out = b;
