function x=sblu(A,b)
[l,u,p]=lu_decomposition(A);
b=p*b;
b=l\b;
x=u\b;
end