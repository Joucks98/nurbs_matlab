function C = DeCasteljaul(Q, n, u)
% omit Q backup for Q is already copied value.
% Q size is (n+1)x3
u1 = 1-u;
for k = 1:n
    for i = 1:n-k +1
        Q(i,:) = u1*Q(i,:) + u*Q(i+1,:);
    end
end
C = Q(1,:);
end