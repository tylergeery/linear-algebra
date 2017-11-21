% This will perform a QR factorization ~ A= QR
% following the Gram-Schmidt process
function [Q, R] = QR_Factorization(A)
    [row, col] = size(A);
    Q = zeros(row, col);
    R = zeros(col, col);

    for i = 1:row-1
        % calculate all r for column
        for j = 1:i-1
            R(j,i) = Q(:, j)' * A(:,i);
        end

        % get orthogonal vector for ai
        ai_orth = A(:,i);

        if i > 1
           ai_orth = ai_orth - R(1:i-1,i) * Q(:,1:i-1);
        end

        % get Euclidean distance of ai_orth
        R(i,i) = sqrt(ai_orth' * ai_orth);

        % Get Qi, the orthogonal basis vector in relation to q0..qi-1 
        Q(:,i) = ai_orth/R(i,i);
    end
end
