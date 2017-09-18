function [A_OUT] = GaussianElimination(A)
    [rows, columns] = size(A)

    for c = 2:columns
        % calculate multiplier
        A(c:end, c-1) = A(c:end, c-1) / A(c-1, c-1)

        % Update gaussian matrix with result product
        A(c:end, c:end) = A(c:end, c:end) - (A(c:end, c-1) * A(c-1, c: end))
    end

    A_OUT = A
