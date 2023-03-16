function normalizedAngle = F5_AngleNormalizerDeg(angle)
% Normalizes an angle to a range of [-180, 180]
    if angle <= 180 && angle >= -180
        normalizedAngle = angle;
    end

    if angle > 180
        int_multiples = floor(angle / 360);
        normalizedAngle = angle - 360 * int_multiples;
        if normalizedAngle > 180
            normalizedAngle = normalizedAngle - 360;
        end
    elseif angle < -180
        int_multiples = floor(angle / 360);
        normalizedAngle = angle - 360 * int_multiples;
        if normalizedAngle > 180
            normalizedAngle = normalizedAngle - 360;
        end
    end
end

