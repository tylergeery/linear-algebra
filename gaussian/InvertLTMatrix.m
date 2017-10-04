function A_inverted = InvertLTMatrix(L)
    % Takes a lower triangular matrix (without zeros on the diagonal)
    % Inverts the matrix and returns the inverse
    %
    % Recursive function that starts at bottom right of matrix
    [rows, columns] = size(L);
    A_inverted = zeros([rows, columns])

    % find the inverse of scalar in bottom right of matrix
    A_inverted(rows, columns) = 1/L(rows, columns);

    % check if we need to continue recursive call
    if rows > 1
        % get inverted matrix
        A_inverted(1:rows-1, 1:columns-1) = InvertLTMatrix(L(1:rows-1, 1:columns-1));

        % update bottom row using previously inverted matrix
        A_inverted(rows, 1:columns-1) = (-1 * L(rows, 1:columns-1) * A_inverted(1:rows-1, 1:columns-1))/L(rows, columns);
    end
