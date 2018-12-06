function N = BasisFuns(i, u, p, U)
% U is not necessary bounded to [0 1]
N = zeros(p+1,1);
left = zeros(p+1, 1);
right = zeros(p+1, 1);
N(1) = 1.0;
for j = 1:p
    left(j+1) = u - U(i+1-j +1);
    right(j+1) = U(i+j +1) - u;
    saved = 0.0;
    for r = 0:j-1
        temp = N(r +1) / (right(r+1 +1) + left(j-r +1));
        N(r +1) = saved + right(r+1 +1) * temp;
        saved = left(j-r +1) * temp;
    end
    N(j +1) = saved;
    N;
end
end