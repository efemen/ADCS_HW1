function angles = F7_DCM2Euler313(DCM)
% Converts the DCM matrix to Euler angles for 3-2-1 sequence.
    t1 = atan2(DCM(1,3), DCM(2,1));
    t2 = acos(DCM(3,3));
    t3 = atan2(DCM(3,1), -DCM(3,2));
    angles = [t1 t2 t3];
end