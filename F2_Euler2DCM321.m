function DCM = F2_Euler2DCM321(yaw, pitch, roll)
% Converts the Euler angles in rad to DCM in 3-2-1 (yaw, pitch, roll) sequence.
    M1 = [1 0 0; 0 cos(roll) sin(roll); 0 -sin(roll) cos(roll)];
    M2 = [cos(pitch) 0 -sin(pitch); 0 1 0; sin(pitch) 0 cos(pitch)];
    M3 = [cos(yaw) sin(yaw) 0; -sin(yaw) cos(yaw) 0; 0 0 1];
    DCM = M1 * M2 * M3;
end