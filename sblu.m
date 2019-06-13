function x=sblu(A,b)
[l,u,p]=lu_decomposition(A);
b=p*b;
b=inv(l)*b;
x=inv(u)*b;
end