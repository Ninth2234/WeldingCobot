function eul = dirVec2Eul(dirVec)

sizeVec = size(dirVec);

if sizeVec(1) ~= 3
    dirVec = dirVec';
end

eul = [];
for i = 1:size(dirVec,2)
    vec = dirVec(:,i);
    u = vec/norm(vec);

    if norm(u(1:2))== 0
        beta = 0;
    else
        beta = acosd(dot(u(1:2)/norm(u(1:2)),[0 1]));
    end
    if u(1)>=0
        signU1 = 1;
    else
        signU1 = -1;
    end
    R1 = se3(deg2rad(-beta*signU1),"rotz");
    
    theta = acosd(dot(u,[0 0 1]));
    R2 = se3(deg2rad(-theta),"rotx");
    
    R = tform(R1*R2);

    eul(:,end+1) = rotm2eul(R(1:3,1:3));
end
end