if exist('A.mat', 'file')
    load -binary A.mat;
else
    %A = load_directed('out.munmun_twitter_social');
    A = load_directed('test');
    save -binary A.mat A;
end

alpha = 0.2;
ahpla = 1 - alpha;
Do    = sum(A');
n     = length(A);

if exist('P.mat', 'file')
    load -binary P.mat;
else
    [Is, Js] = find(A);
    P = spones(A);

    for x = 1:length(Is)
        i = Is(x);
        j = Js(x);
        P(i,j) = p_elem(n, A(i,j), Do(i));
    end

    save -binary P.mat P;
end

G = (1 - alpha) * P + alpha * ones(n, n) / n;
v = ((n^-0.5) * ones(n, 1))';
do
    old = v;
    v   = v * G;
until (old == v)

v
