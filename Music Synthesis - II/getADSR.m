function E = getADSR(notelength)
    A = linspace(0, 1, 0.1*notelength);
    D = linspace(1, 0.9, 0.1*notelength);
    S = linspace(0.9, 0.8, 0.65*notelength);
    R = linspace(0.8, 0, notelength-length(A)-length(D)-length(S));
    E = [A, D, S, R];

    assert(length(E) == notelength,'There is an error in the code.')
end