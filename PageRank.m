A = [
  [0, 1, 1, 0, 0],
  [0, 0, 0, 0, 1],
  [0, 1, 0, 0, 0],
  [1, 0, 1, 0, 0],
  [0, 0, 1, 1, 0]
]

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
