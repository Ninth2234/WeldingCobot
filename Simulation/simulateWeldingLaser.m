function resultSeamToErrorPart = simulateWeldingLaser(referencePath,param)
    laserOffset = param.laserOffset;
    partOffset = param.partOffset;

    laserPose = laserOffset;
    partTraj = referencePath.inv;
    partPose = partTraj*partOffset;
    
    laserToPart = partPose.inv*laserPose;
    resultSeamToErrorPart = findIntersectnLinePlane(laserToPart,3,se3([0 0 0],"trvec"),3);
end