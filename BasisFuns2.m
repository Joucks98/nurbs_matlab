function N = BasisFuns2(i, u, p, U)
N = zeros(p+1,p+1);
left = zeros(p+1, 1);
right = zeros(p+1, 1);
N(1,1) = 1.0;
for j = 1:p
    left(j+1) = u - U(i+1-j);
    right(j+1) = U(i+j) - u;
    saved = 0.0;
    fprintf('for j = %d, left, right:\n',j);
    disp(left);disp(right);
    for r = 0:j-1
        temp = N(r+1,1) / (right(r+1+1) + left(j-r+1));
        
        
        N(r+1,1) = saved + right(r+1+1) * temp;
        saved = left(j-r+1) * temp;
        N(:, j+1) = N(:,1);
        fprintf('for j = %d, r = %d:\n', j, r);
          disp(N);
    end
    N(j+1,1) = saved;
    N(:, j+1) = N(:,1);
    fprintf('for j = %d:\n',j);
    disp(N);
end
end