function htrunc = TruncIdlLPF(N, hatfm)
    if mod(N, 2) == 1
        N = N+1;
    end

    L = N/2;
    k = 0:2*L;
    htrunc = sin(2*pi*hatfm*(k-L))./(pi*(k-L));
    htrunc(L+1) = 2*hatfm;
end