function y = interpolate(x, dataX, dataY)
// returns the interpolation at x, based on Lagrange polynomials over data
    
    n = length(dataX)
    if n ~= length(dataY) then
        printf("dataX and dataY should have the same size")
        return
    end

    y = 0
    for i = 1:n
        y = y + dataY(i)*L(i, x, dataX)
    end 

endfunction

function p = L(k, x, dataX)
// returns the Lk lagrange polynomial using points dataX, evaluated at x
    n = length(dataX)

    p = 1
    for j = 1:n
        if (j <> k) then
            p = p*(x - dataX(j))/(dataX(k)-dataX(j))
        end
    end
    
endfunction

function gridY = plot_interpolation(gridX, dataX, dataY)
// returns and plots interpolatioin of points in gridX using dataX and dataY

    n = length(gridX)
    
    gridY = zeros(n)
    
    for i = 1:n
        gridY(i) = interpolate(gridX(i), dataX, dataY)
    end

    plot(dataX, dataY, "xr")
    plot(gridX, gridY, "-.b")

endfunction