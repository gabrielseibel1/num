function y = ode_euler(t, a, f)
// Solve ODE with Euler's method
// y' = f(t, y(t)) 
// y(1) = a

    //set N and h
    N = size(t,1)
    h = (t(N) - t(1)) / (N-1)

    //init y
    y = zeros(N) ; y(1) = a
    
    //fill y with Euler's method
    for n = 1:N-1
        y(n+1) = y(n) + h*f(t(n), y(n))
    end

endfunction

function y = ode_heun(t, a, f)
// Solve ODE with Heun's method
// y' = f(t, y(t)) 
// y(1) = a

    //set N and h
    N = size(t,1)
    h = (t(N) - t(1)) / (N-1)

    //init y
    y = zeros(N) ; y(1) = a
    
    //fill y with Heun's method
    for n = 1:N-1
        fa = f(t(n), y(n))
        fb = f(t(n+1), y(n)+h*fa)    
        y(n+1) = y(n) + h*(fa+fb)/2
    end

endfunction

function y = ode_taylor(t, a, varargin)
// Solve ODE with Taylor's method
// y' = f(t, y(t)) 
// y(1) = a
// varargin are the derivatives of f starting from order 1 (first is f)

    //set N, h and order
    N = size(t,1)
    h = (t(N) - t(1)) / (N-1)
    order = argn(2) - 2 

    //init y
    y = zeros(N) ; y(1) = a

    //fill y with Taylor's method
    for n = 1:N-1

        y(n+1) = y(n)

        //enhance with Taylor (starting from first derivative)
        for i = 1:order
           y(n+1) = y(n+1) + (h^i/factorial(i)) * varargin(i)(t(n), y(n))
        end
    end

endfunction
    
    