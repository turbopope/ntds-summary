A = [
[0, 1, 1, 0, 0],
[1, 0, 1, 0, 1],
[1, 1, 0, 1, 1],
[0, 0, 1, 0, 1],
[0, 1, 1, 1, 0]
]

power_v = ones(rows(A), 1);
e = 0.000001;
l = 0;

do
  power_v = A*power_v;
  l_prev = l;
  l = norm(power_v);
  power_v = power_v/l;
until (abs(l_prev - l) < e)

power_v
[V, eigs] = eigs(A, 1);
V
