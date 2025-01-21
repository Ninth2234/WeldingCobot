function visualizeToWorld(reference_seamToPart,result_seamToPart,param,iFrame)

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

%% ref to world

plotTraj(partTraj,"--b")
plotTransforms(partTraj(i),"FrameSize",0.005)
plotTransforms(seamPose_i,"FrameSize",0.001)
plotTraj(objPlanePose,"-b")

plotTraj(objAPlanePose_i,"-r")
plotTransforms(partAPose_i,"FrameSize",0.005)
plotTransforms(partAPose_i*result_seamToPart,"FrameSize",0.003)
plotTraj(partAPose_i*result_seamToPart,"--r")
plotTraj([partTraj(i) partAPose_i],":k","LineWidth",3)
plotTraj(partAPose_i*result_seamToPart(i),"or")

tmp = laserAPose.transform([0 0 -0.03;0 0 0.03]);
plot3(tmp(:,1),tmp(:,2),tmp(:,3),":k","LineWidth",2)

end