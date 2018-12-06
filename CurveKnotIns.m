function [nq, UQ, Qw] = CurveKnotIns(np, p, UP, Pw, u, k, s, h)
% r+s <= p
% insert u into positon after u_k(start index at 1) h times, 
% the original multiplicity is s
% input UP size of (1 x np)
% input Pw size of (np x 3)

nq = np + h;


UQ = [UP(1:k) u*ones(1,h) UP((k+1):end)];
% p-s+h-1: (k-s) - (k-p) - 1 + 2*h - h
Qw = [Pw(1:(k-p),:);zeros(p-s+h-1,3);Pw((k-s):end, :)];

Rw = Pw((k-p):(k-s),:);

for r = 1:h
    L = k-p+r;
    for i = 0:p-s-r
        alpha = (u-UP(L+i))/(UP(L+i+p-(r-1))-UP(L+i));
        Rw(i +1,:) = alpha*Rw(i+1 +1,:)+(1-alpha)*Rw(i +1,:);
    end
    Qw(L,:) = Rw(1,:);
    % start at k-s go up: k+h-r-s = (k-p)+(p-s+h-1)-(r-1)
    Qw(k+h-r-s,:) = Rw(p-s-(r-1),:);
end

if (k-s)-(k-p+h)-1>0
    Qw(k-p+h+1:k-s-2*h-1,:) = Rw(2:p-s-h,:);
end

end