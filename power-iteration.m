A = [
[0, 1, 1, 0, 0],
[1, 0, 1, 0, 1],
[1, 1, 0, 1, 1],
[0, 0, 1, 0, 1],
[0, 1, 1, 1, 0]
]

v = ones(5, 1);
e = 0.0001;
l = 0;

do
  v = A*v;
  l_prev = l;
  l = norm(v)
  v = v/l
until (l_prev - l < e)

v
[V, eigs] = eig(A)
