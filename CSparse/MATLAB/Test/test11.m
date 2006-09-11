clear
clear functions
index = UFget ;
[ignore f] = sort (max (index.nrows, index.ncols)) ;
f = f (1:200) ;

for i = f
    Prob = UFget (i)
    A = Prob.A ;
    [m n] = size (A) ;
    if (~isreal (A) || m ~= n)
	continue
    end

    A = spones (A) ;
    A = A+A' + speye(n) ;

    [cc h pa po R] = symbfact (A) ;
    rc1 = full (sum (R)) ;
    rc2 = cs_rowcnt (A, pa, po) ;
    if (any (rc1 ~= rc2))
	error ('!') ;
    end

    try
	p = amd (A) ;
    catch
	p = symamd (A) ;
    end
    A = A (p,p) ;

    [cc h pa po R] = symbfact (A) ;
    rc1 = full (sum (R)) ;
    rc2 = cs_rowcnt (A, pa, po) ;
    if (any (rc1 ~= rc2))
	error ('!') ;
    end

end

