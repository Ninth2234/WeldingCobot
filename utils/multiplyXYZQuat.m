function result = multiplyXYZQuat(xyzquat1, xyzquat2)
    % Convert xyzquat to SE(3) transformation matrices
    se3_1 = se3(xyzquat1, "xyzquat");
    se3_2 = se3(xyzquat2, "xyzquat");
    
    % Multiply the SE(3) transformation matrices
    se3_result = se3_1 * se3_2;
    
    % Convert the resulting SE(3) matrix back to xyzquat
    result = xyzquat(se3_result);
end
