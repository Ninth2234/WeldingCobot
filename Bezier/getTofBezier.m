function t = getTofBezier(xy,cPoint)
    tLerp = linspace(0,1,1000);
    distances = pdist2(xy,getBezier(cPoint,tLerp));
    [minVal, minIdx] = min(distances,[],2);
    t = tLerp(minIdx);
end