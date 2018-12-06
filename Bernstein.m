function B = Bernstein(i, n, u)
%%input i from 0~n
tmp = zeros(n+1,1);
tmp(n-i +1) = 1;
u1 = 1 - u;
for k = 1 +1:n +1
    for j = n +1:-1:k
        tmp(j) = u1 * tmp(j) + u * tmp(j-1);
    end
end
B = tmp(n +1);
return
end