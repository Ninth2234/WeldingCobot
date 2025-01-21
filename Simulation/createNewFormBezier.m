function new = createNewFormBezier(newBz,source,tLerp)
    breakIdx = source.breakIdx;
    uM = source.u;
    bM = source.b;

    u = [];
    ub = [];
    for i = 1:length(source.b)
        t = getTofBezier(uM(breakIdx(i):breakIdx(i+1),:),source.b{i});
        u = u(1:end-1,:);
        u = [u; getBezier(newBz{i},t)];
        ub = [ub; getBezier(newBz{i},tLerp)];
    end
    modelxyzquat = source.T.xyzquat;
    targetxyzquat = [u modelxyzquat(:,3:end)];
    new = struct();
    new.u = u;
    new.b = newBz;
    new.ub = ub;
    new.T = se3(targetxyzquat,"xyzquat");
    new.breakIdx = breakIdx;
end