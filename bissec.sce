function y=sinexp(x)
    y=sin(x) + exp(x)
endfunction

function [p] = bissecao(f, a, b, TOL, N)  
  i = 1  
  fa = f(a)  
  while (i <= N)  
    //iteracao da bissecao  
    p = a + (b-a)/2  
    fp = f(p)  
    //condicao de parada  
    if ((fp == 0) | ((b-a)/2 < TOL)) then  
      return  
    end  
    //bissecta o intervalo  
    i = i+1  
    if (fa * fp > 0) then  
      a = p  
      fa = fp  
    else  
      b = p  
    end  
  end  
  
  disp(p)
  
  error ('Num maximo de iteracoes excedido!')  
endfunction
