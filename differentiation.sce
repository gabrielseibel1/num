function c = coefs_multi_step(x, degree)
// solve system Mc=e
// x é pontos do tempo. xn = 0 e são espaçados de h=1 (e.g. 0, -1, -2 ...)
// degree é a diferença de passo entre o lado esquerdo e direito da eq
// deg = 2 para un+2 = un + h(....) por exemplo

    // get size of the system
    n = size(x,2)

    // create M and c
    M = zeros(n, n)
    e = zeros(n, 1)

    // fill M and c
    for i = 1:n
        for j = 1:n
            M(i,j) = x(j)^(i-1)
        end

        e(i) = (degree)^i/i
    end

    //solve Mc=e
    c = inv(M)*e

endfunction

function c = coefs_finite_difs(xstar, x)
// solve system Mc=e
// x é pontos do tempo que influenciam o calculo da derivada (espaçados de h=1)
// xstar é o ponto onde a derivada é calculada

    // get size of the system
    n = size(x,2)

    // create M and c
    M = zeros(n, n)
    e = zeros(n, 1)

    // fill M and c
    for i = 1:n
        for j = 1:n
            M(i,j) = x(j)^(i-1)
        end

        if (xstar == 0 && (i-2) < 0) then
            e(i) = 0
        else
            e(i) = (i-1)*xstar^(i-2)
        end
    end

    //solve Mc=e
    c = inv(M)*e

endfunction

function c = coefs_finite_difs_2(xstar, x)
// solve system Mc=e
// x é pontos do tempo que influenciam o calculo da derivada (espaçados de h=1)
// xstar é o ponto onde a derivada é calculada

    // get size of the system
    n = size(x,2)

    // create M and c
    M = zeros(n, n)
    e = zeros(n, 1)

    // fill M and c
    for i = 1:n
        for j = 1:n
            M(i,j) = x(j)^(i-1)
        end

        if (xstar == 0 && (i-2) < 0) then
            e(i) = 0
        else
            e(i) = (i-1)*xstar^(i-2)
        end
    end

    //adapt to grau 2
    M_ = M
    M(1,:) =  0
    for i = 2:n
        M(i,:) = M_(i-1, :)
    end
    for i = 1:n
        M(i,:) = M(i,:) * (i-1)
        e(i) = e(i) * (i-1)
    end

    disp(M)
    disp(e)

    //solve Mc=e
    c = inv(M)*e

endfunction
    
    