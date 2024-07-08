syms k1 k2 real;
syms x1 x2 real;
syms a w real;
syms t real;

% x1 = -a+sqrt(a^2-w^2)
% x2 = -a-sqrt(a^2-w^2)
q = k1*exp(x1*t)+k2*exp(x2*t)
i = diff(q, t)

qt0 = subs(q,t,0)
it0 = subs(i,t,0)

syms q0 real;
eqns = [k1+k2==q0 k1*x1+k2*x2==0]
[k1 k2]=solve(eqns, [k1 k2])

%x1 = -a+sqrt(a^2-w^2)
%x2 = -a-sqrt(a^2-w^2)
newq = simplify(subs(q))
newi = simplify(subs(i))

x1 = -5e5+sqrt((5e5)^2-1e8)
x2 = -5e5-sqrt((5e5)^2-1e8)
q0 = 2.5e-3
k1 = subs(k1)
k2 = subs(k2)
q = vpa(subs(q))
i = vpa(subs(i))
