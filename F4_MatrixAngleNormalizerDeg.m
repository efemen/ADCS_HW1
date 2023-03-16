function e_angles_normalized = F4_MatrixAngleNormalizerDeg(e_angles)
    % Loops through the whole matrix to normalize angles.
    n = size(e_angles);
    e_angles_normalized = zeros(n(1), n(2));
    
    for i = 1:n(1)
        for j = 1:n(2)
            e_angles_normalized(i, j) = F5_AngleNormalizerDeg(e_angles(i, j));
        end
    end
end

