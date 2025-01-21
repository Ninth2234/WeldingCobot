function visualizeToPart(reference_seamToPart,result_seamToPart,param,iFrame)

i = iFrame;

seamToPart = reference_seamToPart;
laserOffset = param.laserOffset;
partOffset = param.partOffset;
objPlaneToPart = genObjPlaneSE3(0.015,0.03);

laserPose = se3([0 0 0],"trvec"); %% reference laser pose on origin
partTraj = laserPose*seamToPart.inv;


partPose = partTraj;
partPose_i = partTraj(i);
seamPose_i = partPose_i*seamToPart; 
objPlanePose = partPose_i*objPlaneToPart;

laserAPose = laserPose*laserOffset;
partAPose = partPose*partOffset;
partAPose_i = partAPose(i);
objAPlanePose_i = partAPose_i*objPlaneToPart;
laserAToPartA = partAPose.inv*laserAPose;

%% ref to Part

refFrame = partPose_i;
plotTransforms(refFrame.inv*laserPose,"FrameSize",0.03)
plotTransforms(refFrame.inv*partPose_i,"FrameSize",0.01)
plotTraj(refFrame.inv*seamPose_i)

plotTraj(refFrame.inv*objPlanePose,"b")
plotTraj(refFrame.inv*objAPlanePose_i,"-r")

plotTransforms(refFrame.inv*partAPose_i,"FrameSize",0.01)
plotOrientation(refFrame.inv*partAPose_i*laserAToPartA,3,0.01,"-r")
plotOrientation(refFrame.inv*partAPose_i*laserAToPartA,3,-0.01,"-r")
plotTraj(refFrame.inv*partAPose_i*result_seamToPart,"o--r")
end