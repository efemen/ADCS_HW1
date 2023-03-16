function [yaw, pitch, roll] = F1_DCM2Euler321(DCM)
% Converts the DCM matrix to Euler angles for 3-2-1 sequence.
    yaw = atan(DCM(1,2) / DCM(1,1));
    pitch = -asin(DCM(1,3));
    roll = atan(DCM(2,3) / DCM(3,3));
end

