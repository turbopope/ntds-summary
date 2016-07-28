function v = power_method(A)
    v      = ones(length(A), 1);
    lambda = Inf;
    old    = Inf;

    do
        old    = lambda;
        v      = A * v;
        lambda = norm(v);
        v      = v / lambda;
    until (lambda == old);
    % this could use a delta like
    %     abs(lambda - old) < some_small_number
    % but it seems to work fine without it too
end
