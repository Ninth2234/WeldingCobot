function controlPoints = fitBezier(setOfPoint,varargin)

[p0mat,p1mat,p2mat,p3mat,fbi]=bzapproxu(setOfPoint,varargin{:});  
controlPoints =  [p0mat(1,:);p1mat(1,:);p2mat(1,:);p3mat(1,:)];
end