function [index, s] = FindSpan2(p, u, U)
%% output index start from 1.
% U is not necessary bounded to [0 1]
% s is the multiplicity of u in original U series.
eps = 1e-9;
if u>U(end) || u<U(1)
    index = -1;
    s = -1;
    return;
end

n = numel(U) -1 - p -1;
if u == U(1)
    index = p+1;
    s = p+1;
    return
end
if u == U(n+2)
    index = n+1;
    s = p+1;
    return;
end
low = p+1; 
high = n+2;
mid = floor((low + high) / 2);

while(u < (U(mid)) || u >= (U(mid+1)))
    if u < U(mid)
        high = mid;
    else
        low = mid;
    end
    mid = floor((high + low) / 2);
end
index = mid;
s = numel(find(U==u));
return
end