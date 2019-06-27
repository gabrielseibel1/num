function A = integ(a, b, f, n, heightApprox)
// integrates f from a to b in n intervals using a height aproximation
    A = 0
    intervalBase = (b-a)/n
    x = linspace(a, b, n+1)
    output = 0
    for i = 1:n
        A = A + intervalBase * heightApprox(x, f, i)
    end
    
endfunction

function A = integ_riemman_left(a, b, f, n)
// integrates f from a to b in n intervals using riemman left method
    
    function approx = heightApproxRiemmanLeft(x, f, i)
    // riemman left height approximation with points x, func f and iteration i
        points = [x(i)]
        coefs = [1]
        approx = coefs' * f(points)
    endfunction

    A = integ(a, b, f, n, heightApproxRiemmanLeft)
endfunction

function A = integ_riemman_right(a, b, f, n)
// integrates f from a to b in n intervals using riemman right method

    function approx = heightApproxRiemmanRight(x, f, i)
    // riemman right approximation with points x, func f and iteration i
        points = [x(i+1)]
        coefs = [1]
        approx = coefs' * f(points)
    endfunction

    A = integ(a, b, f, n, heightApproxRiemmanLeft)
endfunction

function A = integ_trap(a, b, f, n)
// integrates f from a to b in n intervals using trapezoid method
    
    function approx = heightApproxTrap(x, f, i)
    // trapezoid height approximation with points x, func f and iteration i
        points = [x(i) ; x(i+1)]
        coefs = [1/2 ; 1/2]
        approx = coefs' * f(points)
    endfunction

    A = integ(a, b, f, n, heightApproxTrap)
endfunction

function A = integ_simpson(a, b, f, n)
// integrates f from a to b in n intervals using simpson method
    
    function approx = heightApproxSimpson(x, f, i)
    // Simpson height approximation with points x, func f and iteration i
        points = [x(i) ; (x(i)+x(i+1))/2; x(i+1)]
        coefs = [1/6 ; 4/6 ; 1/6]
        approx = coefs' * f(points)
    endfunction

    A = integ(a, b, f, n, heightApproxSimpson)
endfunction

function A = integ_gauss(a, b, f, n, degree)
// integrates f from a to b in n intervals using gauss-legendre method (3 nodes)

    // choose coeffiecients from predetermined table
    select degree,
    case 1 then
        nodes = [0]
        coefs = [2]
    case 2 then
        nodes = [-sqrt(3)/3 ; sqrt(3)/3]
        coefs = [1 ; 1]
    case 3 then
        nodes = [-sqrt(3/5) ; 0 ; sqrt(3/5)]
        coefs = [5/9 ; 8/9 ; 5/9]
    case 4 then
        na = sqrt( (3-2*sqrt(6/5)) / 7 ); nb = sqrt( (3+2*sqrt(6/5)) / 7 )
        ca = (18+sqrt(30))/36 ; cb = (18-sqrt(30))/36 ; 
        nodes = [-na ; -nb; na ; nb]
        coefs = [ca ; cb ; ca ; cb]
    end

    
    function approx = heightApproxGauss(x, f, i)
    // Gauss height approximation with points x, func f and iteration i 
        alpha = (x(i+1)-x(i))/2
        betha = (x(i+1)+x(i))/2
        
        points = alpha * nodes + betha

        approx = coefs' * f(points) / 2
    endfunction

    A = integ(a, b, f, n, heightApproxGauss)
endfunction
    
function w = quadrature_weights(a,b,x)
// returns weights for integral approximation quadrature with Lagrange polynomials
// integral is from a to b, using nodes (points) x    

    // solve system Mw=u

    // get size of the system
    n = size(x,2)

    // create M and u
    M = zeros(n, n)
    u = zeros(n, 1)
    
    // fill M and U
    for i = 1:n
    
        for j = 1:n
            M(i,j) = x(j)^(i-1)
        end
    
        u(i) = (b^i - a^i) / i
    
    end

    //solve Mw=u
    w = inv(M)*u

endfunction