// Acha o ponto fixo g(x) = x com tolerancia tol no maximo max_iter
function output = ponto_fixo(g, x, max_iter, tol)

    for i = 1:max_iter

        proximo_x = g(x)

        if (abs(proximo_x - x) < tol) then
            output = proximo_x
            disp("Iterações: ", i)
            disp("Achei g(x) = x em x = ", output)
            return
        else
            x = proximo_x
        end
    end

    output = proximo_x
    disp("Não achei g(x) = x, mais perto foi x = ", output)
    return

endfunction