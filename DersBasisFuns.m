function ders = DersBasisFuns(i,u,p,n,U)
ndu = [];
ndu(1,1) = 1.0;
for j = 1:p
    left(j +1) = u-U(i+1-j +1);
    right(j +1) = U(i+j +1)-u;
    saved = 0.0;
    for r = 0:j-1
        ndu(j +1, r +1) = right(r+1 +1)+left(j-r +1);
        temp = ndu(r +1,j-1 +1) / ndu(j +1, r +1);
        
        ndu(r +1, j +1) = saved + right(r+1 +1) *temp;
        saved = left(j-r +1)*temp;
    end
    ndu(j +1,j +1) = saved;
end
for j = 0:p
    ders(1,j +1) = ndu(j +1,p +1);
end
a = [];
for r = 0:p
    s1 = 0; s2 = 1;
    a(1,1) = 1.0;
    
    for k = 1:n
        d = 0.0;
        rk = r-k; pk = p-k;
        if r >= k
            a(s2 +1, 1) = a(s1 +1, 1) / ndu(pk+1 +1, rk +1);
            d = a(s2 +1,1)* ndu(rk +1, pk +1);
        end
        if rk >= -1
            j1 = 1;
        else
            j1 = j1 - rk;
        end
        if r - 1 <= pk
            j2 = k-1;
        else
            j2 = p-r;
        end
        for j = j1:j2
            a(s2 +1,j +1) = (a(s1 +1,j +1) - a(s1 +1, j-1 +1)) / ndu(pk+1 +1, rk+j +1);
            d = d+a(s2 +1, j +1)*ndu(rk+j +1, pk +1);
        end
        if r <= pk
            a(s2 +1,k +1) = -a(s1 +1,k-1 +1) / ndu(pk+1 +1, r +1);
            d = d+a(s2 +1,k +1)*ndu(r +1,pk +1);
        end
        ders(k +1,r +1) = d;
        j = s1; s1 = s2; s2 = j;
    end
end

r= p;
for k = 1:n
    for j = 0:p
        ders(k +1, j +1) = ders(k +1, j +1) *r;
    end
    r = r* (p-k);
end

end