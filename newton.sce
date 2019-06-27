// Acha raízes de f utilizando a sua derivada, df
function output = newton(f, df, x, max_iter, tol1, tol2)

    for i = 1:max_iter

        x_anterior = x
        x = x - f(x)/df(x)

        if (abs(f(x)) < tol1 | abs((x - x_anterior) / x) < tol2) then
            output = x
            return
        end
    end

    output = x
    disp("Não achei f(x) = 0")
    return

endfunction

// Acha raízes de f utilizando a sua derivada, df
function output = newton2(f, x, max_iter, tol1, tol2)

    for i = 1:max_iter

        x_anterior = x
        x = x - f(x)/numderivative(f, x)

        if (abs(f(x)) < tol1 | abs((x - x_anterior) / x) < tol2) then
            output = x
            return
        end
    end

    output = x
    disp("Não achei f(x) = 0")
    return

endfunction