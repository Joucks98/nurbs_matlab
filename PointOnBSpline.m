function C = PointOnBSpline(P, p, U, u)
n = size(P,1) -1;
if length(U) ~= (n+p+1 +1)
    return
end
% i = FindSpan(p, u, U);
[i,s] = FindSpan2(p,u,U);
if s == p+1
    if i == p+1
        C = P(1, :);
    else
        C = P(i, :); % k == n+1
    end
    return
end
N = BasisFuns(i-1, u, p, U);
C = N'*P(i-p:i,:);
end