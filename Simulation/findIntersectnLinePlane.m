function se3Array = findIntersectnLinePlane(se3LineArray,nDimOfDirectionLine,se3Plane,nDimOfDirectionPlane)
% findIntersectnLinePlane - Computes intersection points between 3D lines and a plane
%
% Inputs:
%   se3LineArray - Array of SE(3) objects representing lines with transformation (tform) and rotation (so3)
%   nDimOfDirectionLine - Index for the direction vector of the lines in the transformation matrix (1, 2, or 3)
%   se3Plane - SE(3) object representing the plane, containing its transformation matrix
%   nDimOfDirectionPlane - Index of the plane's normal vector in the transformation matrix (1, 2, or 3)
%
% Outputs:
%   se3Array - Array of SE(3) objects where translation is the intersection point and rotation is from the line
%
% Description:
%   This function finds the intersection points of given lines with a plane. It uses parametric line equations
%   and the plane equation to calculate the intersections, returning them as SE(3) objects.
%
% Example:
%   se3Array = findIntersectnLinePlane(se3LineArray, 3, se3Plane, 1);
planeTf = se3Plane.tform;

lineTform = se3LineArray.tform;
lineRotm = se3LineArray.so3;

linePts = squeeze(lineTform(:,4,:));
lineDir = squeeze(lineTform(:,nDimOfDirectionLine,:));

planeEq = [planeTf(1:3,nDimOfDirectionPlane)' -planeTf(1:3,nDimOfDirectionPlane)'*planeTf(1:3,4)];

t = (-planeEq*linePts)./(planeEq*lineDir);

intersectPts = linePts+lineDir.*t;

se3Array = se3(lineRotm,hom2cart(intersectPts'));
end