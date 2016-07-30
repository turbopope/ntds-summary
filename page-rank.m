A = [
  [0, 1, 1, 0, 0],
  [0, 0, 0, 0, 1],
  [0, 1, 0, 0, 0],
  [1, 0, 1, 0, 0],
  [0, 0, 1, 1, 0]
]

e = 0.0001;
a = 0.85;
n = rows(A);

v = ones(n, 1);
v = v / n;

d = A * ones(n, 1);
d

% G = (1 - a) *






% do
%   v_old = v;
%   v = v * A;
%   v = v / norm(v);
% until (norm(v_old - v, 2) < e)
%
% v
