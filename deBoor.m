function C = deBoor(P, U, p,  u)
% k index state from 1.
% If u lies in [uk,uk+1) and u != uk, let h = p (i.e., inserting u p times) and s = 0; 
% If u = uk and uk is a knot of multiplicity s, let h = p - s (i.e., inserting u p - s times); 
% Copy the affected control points Pk-s, Pk-s-1, Pk-s-2, ..., Pk-p+1 and Pk-p 
% to a new array Q; 

[k,s] = FindSpan2(p,u,U);
if s == p+1
    if k == p+1
        C = P(1, :);
    else
        C = P(k, :); % k == n+1
    end
    return
end
Q = P(k-p:k-s,:);
h = p-s;
for r = 1:h
    for i = k-p+r: k-s        
        alpha = (u-U(i)) / (U(i+p-r+1) - U(i));
        L = i-(k-p+r)+1;
        Q(L,:) = (1-alpha)*Q(L,:)+alpha*Q(1+L,:);
    end
end
C = Q(1,:);
end