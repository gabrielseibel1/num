function a = non_lin_adjust(x, y, yTransform, varargin)
// Adjusts functions to points {x,y} minimizing squared error

    //size of the system
    n = size(x, 1)

    //save number of provided functions
    nFuncs = argn(2) - 3

    //make V
    V = zeros(n,nFuncs)
    for i = 1:n
        for j = 1:nFuncs
            V(i,j) = varargin(j)(x(i))
        end
    end

    //solve sys Ma=w for a (M = V'V, w = V'y --> a = (V'V)-1 V'y)
    a = inv(V'*V)*V'*yTransform(y)
    
endfunction