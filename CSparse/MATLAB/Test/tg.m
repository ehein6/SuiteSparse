
index = UFget ;
[ignore f] = sort (max (index.nrows,index.ncols)) ;

% f = 276 
% f = 706

for i = f 

    % Prob = UFget (i,index)
    Prob = UFget (i)
    A = Prob.A ;
    [m n] = size (A) ;
    if (m < n)
	A = A' ;
    end
    [m n] = size (A) ;
    if (sprank (A) < n || ~isreal (A))
	continue ;
    end

    [V,beta,p,R1,q] = cs_qr(A) ;
    A = A (p,q) ;
    parent = etree (A, 'col') ;

    R0 = qr (A) ;
    R2 = qr_givens (full (A)) ;
    R3 = qr_givens_full (full (A)) ;

    subplot (2,2,1) ; cspy (R0) ; title ('matlab') ;
    subplot (2,2,2) ; cspy (R3) ; title ('qr-full') ;
    subplot (2,2,3) ; cspy (R2) ; title ('qr-givens') ;
    subplot (2,2,4) ; cspy (R1) ; title ('cs-qr') ;

    e0 = norm (A'*A-R0'*R0,1) / norm (A,1) ;
    e1 = norm (A'*A-R1'*R1,1) / norm (A,1) ;
    e2 = norm (A'*A-R2'*R2,1) / norm (A,1) ;
    e3 = norm (A'*A-R3'*R3,1) / norm (A,1) ;
    fprintf ('error %6.2e %6.2e %6.2e %6.2e\n', e0, e1, e2, e3) ;
    drawnow
    if (e1 > e0*1e3 || e2 > e0*1e3)
	pause
    end
    pause
end
