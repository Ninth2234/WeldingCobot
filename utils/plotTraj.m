function h = plotTraj(se3Array, varargin)
    trVec = trvec(se3Array);
    h = plot3(trVec(:,1),trVec(:,2),trVec(:,3),varargin{:})
end