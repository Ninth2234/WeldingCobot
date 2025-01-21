function plotOrientation(se3Array, nDimOfDirection, vectorLength, varargin)
    trVec = trvec(se3Array);
    rotm = se3Array.so3.rotm;
    dirVec = squeeze(rotm(:,nDimOfDirection,:))';
    trVec2 = trVec+dirVec*vectorLength;
    for i = 1:length(se3Array)
        plot3([trVec(i,1), trVec2(i,1)], ...
              [trVec(i,2), trVec2(i,2)], ...
              [trVec(i,3), trVec2(i,3)], varargin{:}); % Customize color/style if needed
    end
end
