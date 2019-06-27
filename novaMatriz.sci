function V = novaMatriz(n, m, f)
    V = zeros(n,m)
    for i = 1:n 
        for j = 1:m
            V(i,j) = f(i,j)
        end
    end
endfunction

function y = senoDeINaJ(i,j)
    y = sin(i)^j
endfunction

function y = apenasI(i,j)
    y = i
endfunction

function y = iVezesENaJ(i, j)
    y = i*exp(j)
endfunction

//criar matriz com M = novaMatriz(5, 6, iVezesENaJ)