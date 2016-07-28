A = [
  [0, 1, 1, 0, 0],
  [0, 0, 0, 0, 1],
  [0, 1, 0, 0, 0],
  [1, 0, 1, 0, 0],
  [0, 0, 1, 1, 0]
]

e = 0.0001;

v = ones(rows(A), 1).';
v = v / norm(v);

do
  v_old = v;
  v = v * A;
  v = v / norm(v);
until (norm(v_old - v, 2) < e)

v
