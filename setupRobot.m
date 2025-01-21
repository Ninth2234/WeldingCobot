function robot = setupRobot(robotInput, partFileName, partTransform)
    
    robot = robotInput;
    % Create and add the jig
    jig = rigidBody("jig");
    jig.Joint = rigidBodyJoint('jigRigidTf', 'fixed');
    jig.Joint.setFixedTransform(se3(so3(-pi/2, "rotz"))); % Adjust as needed
    jig.addVisual("mesh", partFileName);
    robot.addBody(jig, "tool0");

    % Create and add the part
    part = rigidBody("part");
    part.Joint = rigidBodyJoint('partRigidTf', 'fixed');
    part.Joint.setFixedTransform(se3(partTransform, "trvec"));
    robot.addBody(part, "jig");

    robot.DataFormat = "row";
end
