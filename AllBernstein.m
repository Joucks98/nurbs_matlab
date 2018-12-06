function B = AllBernstein(n,u)
B = zeros(n+1, 1);
B(1) = 1.0;
u1 = 1-u;
for j = 2:n+1
    saved = 0;
    for k = 1:j-1
        tmp = B(k);
        B(k) = saved + u1*tmp;
        saved = u*tmp;
    end
    B(j) = saved;
end
end