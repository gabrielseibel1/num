function y = interpolate_vand(x, dataX, dataY)
// returns the interpolation at x, based on vandermonde matrix
    
    m = vandermonde(dataX)
    a = inv(m)*dataY'
    n = length(a)

    y = 0
    for i = 1:n
        y = y + a(i)*x^(i-1)
    end

endfunction
    
function m = vandermonde(x)
// returns a vandermonde matrix based on vector x

    n = length(x)
    m = zeros(n, n)

    for i = 1:n
        for j = 1:n
            m(i,j) = x(i)^(j-1)
        end
    end

endfunction

function gridY = plot_interpolation_vand(gridX, dataX, dataY)
// returns and plots interpolatioin of points in gridX using dataX and dataY

    n = length(gridX)
    
    gridY = zeros(n)
    
    for i = 1:n
        gridY(i) = interpolate_vand(gridX(i), dataX, dataY)
    end

    plot(dataX, dataY, "xr")
    plot(gridX, gridY, "-.b")

endfunction