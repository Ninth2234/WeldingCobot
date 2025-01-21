function randomArray = genRand(arraySize,minmaxArray)
    randomArray = rand(arraySize)*(max(minmaxArray)-min(minmaxArray))+min(minmaxArray);
end

