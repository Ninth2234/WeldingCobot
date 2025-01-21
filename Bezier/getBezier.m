function bzPoints = getBezier(cPoint,tSpace)
    bzPoints = bezierInterp(cPoint(1,:),cPoint(2,:),cPoint(3,:),cPoint(4,:),tSpace);
end