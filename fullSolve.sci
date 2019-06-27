function [L,A]=fatoraLU(A)
    n=size(A,1)
    L=eye(n,n)
    for j=1:n-1
        for i=j+1:n
            L(i,j)=A(i,j)/A(j,j)
            A(i,:)=A(i,:)-L(i,j)*A(j,:)
            A(i,j)=0
        end
    end

endfunction

function [x]=solveL(L,b)
    n=size(L,1)
    x(1)=b(1)/L(1,1)
    for i=2:n
      x(i)=(b(i)-L(i,1:i-1)*x(1:i-1))/L(i,i)
    end

endfunction

function [x]=solveU(U,b)
    n=size(U,1)
    x(n)=b(n)/U(n,n)
    for i=n-1:-1:1
      x(i)=(b(i)-U(i,i+1:n)*x(i+1:n))/U(i,i)
    end
endfunction

function x = fullSolve(A, b) 
    [L, U] = fatoraLU(A)
    y = solveL(L, b)
    x = solveU(U, y)
endfunction

// resolver sistema Ax = b (encontrar x) por x = fullSolve(A, b) (definir A e b antes)