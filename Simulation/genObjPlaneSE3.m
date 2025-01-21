function objPlaneToPart = genObjPlaneSE3(plateWidth,plateHeight)

objPlaneRefPts = [
    -plateWidth plateHeight 0 
    -plateWidth -plateHeight 0 
    plateWidth -plateHeight 0 
    plateWidth plateHeight 0 
    -plateWidth plateHeight 0 
];
objPlaneToPart = se3(objPlaneRefPts,"trvec");
end

