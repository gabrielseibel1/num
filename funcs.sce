function y=q91(x)
    y = exp(-(x^2))
endfunction

function y=q92(x)
    y = sqrt(13*x)
endfunction

function y=q9(x)
    y = abs(q91(x) - q92(x)) - 0.035
endfunction

function y=logao(x)
    y = x^2 - 4
endfunction

function y=polin(x)
    y = x^4-15+x
endfunction

function output = sin7x(x)
    output = sin(7*x)
endfunction

function y = sin7xMenosX(x)
    y = sin(7*x) - x
endfunction

function y = identidade(x)
    y = x
endfunction

function y = m4q1(x)
    y = sin(7*x) - x
endfunction

function y = m4q2(x) 
    y = x^8-6*x^4-3*x+2
endfunction

function y = m4q3original(x)
    y = exp(6 * x) + exp(-x) + 6 * x
endfunction

function y = m4q3pontoFixo(x)
    y = 6*exp(6 * x) - exp(-x) + 6 + x
endfunction

function y = m4q3deriv(x)
    y = 6*exp(6 * x) - exp(-x) + 6
endfunction

function y = m4q3deriv2(x)
    y = 36*exp(6 * x) + exp(-x)
endfunction

function y = m4q4(x)
    y = sin(x) - x^-1
endfunction

function y = m4q4deriv(x)
    y = cos(x) + x^-2
endfunction

function y = m4q5(x)
    y = exp(2 * cos(x) - 1) - 1
endfunction

function y = m4q5deriv(x)
    y =  (-2 * sin(x)) * exp(2 * cos(x) - 1)
endfunction

function y = m4q6(x)
    y = cos(sqrt(x^2 + 1)) - sin(x)
endfunction

function y = m4q7(x)
    y = exp(2*x) - 11 * sqrt(x)
endfunction

function y = m4q8(x)
    y = x^7-6*x^4+6
endfunction