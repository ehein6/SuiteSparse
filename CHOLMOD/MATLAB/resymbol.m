function L = resymbol (L, A)
%RESYMBOL recomputes the symbolic Cholesky factorization of the matrix A.
%   L = resymbol (L, A)
%
%   Recompute the symbolic Cholesky factorization of the matrix A.  A must be
%   symmetric.  Only tril(A) is used.  Entries in L that are not in the Cholesky
%   factorization of A are removed from L.  L can be from an LL' or LDL'
%   factorization (lchol or ldlchol).  resymbol is useful after a series of
%   downdates via ldlupdate, since downdates do not remove any entries in L.
%   The numerical values of A are ignored; only its nonzero pattern is used.
%
% See also LCHOL, LDLUPDATE

%   Copyright 2006, Timothy A. Davis
%   http://www.cise.ufl.edu/research/sparse

error ('resymbol not found') ;
