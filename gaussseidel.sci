function [x,normr]=gaussseidel(A,b)

  n=size(A,1)
  x=zeros(n,1);  x(1)=1;  // chute

  for it=1:100
      x(1)=(b(1) - A(1,2:n)*x(2:n))/A(1,1)
      for i=2:n-1
        x(i)=(b(i) - A(i,1:i-1)*x(1:i-1)-A(i,i+1:n)*x(i+1:n))/A(i,i)
      end
      x(n)=(b(n) - A(n,1:n-1)*x(1:n-1)  )/A(n,n)
      normr(it)= norm( b-A*x)
      
  end
    
endfunction

