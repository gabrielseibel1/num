function a = lin_adjust(x, y, varargin)
// Adjusts functions to points {x,y} minimizing squared error

    //size of the system
    n = size(x, 1)

    //save number of provided functions
    nFuncs = argn(2) - 2

    //make V
    V = zeros(n,nFuncs)
    for i = 1:n
        for j = 1:nFuncs
            V(i,j) = varargin(j)(x(i))
        end
    end

    //solve sys Ma=w for a (M = V'V, w = V'y --> a = (V'V)-1 V'y)
    a = inv(V'*V)*V'*y

endfunction

function a = lin_adjust_line(x,y)
// Adjusts a line to points {x,y} minimizing squared error
    deff("y=f0(x)", "y=1")
    deff("y=f1(x)", "y=x")
    a = lin_adjust(x, y, f0, f1)
endfunction

function a = lin_adjust_parab(x,y)
// Adjusts a line to points {x,y} minimizing squared error
    deff("y=f0(x)", "y=1")
    deff("y=f1(x)", "y=x")
    deff("y=f2(x)", "y=x^2")
    a = lin_adjust(x, y, f0, f1, f2)
endfunction

function a = lin_adjust_cubic(x,y)
// Adjusts a line to points {x,y} minimizing squared error
    deff("y=f0(x)", "y=1")
    deff("y=f1(x)", "y=x")
    deff("y=f2(x)", "y=x^2")
    deff("y=f3(x)", "y=x^3")
    a = lin_adjust(x, y, f0, f1, f2, f3)
endfunction

function res = residues(x, y, a, varargin)
// Returns the squared error at the ith point of {x,y}, 
// using provided factors (a) and functions (varargin)

    //save number of provided functions
    nFuncs = argn(2) - 3

    //size of the system
    n = size(x, 1)

    //for each {x,y}, calculate residue
    res = zeros(n)
    for i = 1:n

        //make P(x) = a1 * f1(x) + a2 * f2(x) + ... + an * fn(x) 
        Px = 0
        for j = 1:nFuncs
            Px = Px + a(j) * varargin(j)(x(i))
        end
    
        res(i) = (Px - y(i))^2
    end

endfunction