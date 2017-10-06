function X = GaussJordanElimination(A, B)
    % Solves the system of equations Ax = b
    % This will account for systems with multiple solution
    %
    % The number of columns return in Matrix X is dependent on the number of solutions
    % or rather, the number of columns in B
    [rows, columns] = size(A);

    % loop through square matrix
    for c = 1:columns
        % loop through to find multipliers
        for r = 1:rows
            % dont update a row based on itself
            if c ~= r
                % get multiplier
                mult = -A(r,c)/A(c,c);
                A(r, c:end) = A(r, c:end) + (mult * A(c, c:end));
                B(r, :) = B(r, :) + (mult * B(c, :));
            end
            % loop through rows
        end
    end

    % multiply by inverse to get identity matrix * X
    for i = 1:rows
        inv = 1/A(i, i);
        A(i, i) = A(i, i) * inv;
        B(i, :) = B(i, :) * inv;
    end

    % return solutions
    X = B;
