syms k1 k2 real;
syms x1 x2;
syms t real;
syms a b real;
x1 = -a+1j*b
x2 = -a-1j*b
q = k1*exp(x1*t)+k2*exp(x2*t)
Req = simplify(collect(real(q)),10)
Imq = simplify(collect(imag(q)),10)
i = diff(q, t)
Rei = simplify(collect(real(i)),10)
Imi = simplify(collect(imag(i)),10)

qt0 = subs(Req+1j*Imq,t,0)
it0 = subs(Rei+1j*Imi,t,0)

syms q0 real;
newq = subs(subs(Req+1j*Imq,k1+k2,q0),k1-k2,-1j*a*q0/b)
newq = simplify(newq)
newi = subs(subs(Rei+1j*Imi,k1+k2,q0),k1-k2,-1j*a*q0/b)
newi = simplify(newi)

tq = vpa(simplify(vpa(simplify(subs(subs(subs(newq,q0,2.5e-3),a,5e3),b,sqrt(1e8-25e6))),3)),3)
ti = vpa(simplify(vpa(simplify(subs(subs(subs(newi,q0,2.5e-3),a,5e3),b,sqrt(1e8-25e6))),3)),3)

testq = subs(tq, t, 0)
testi = subs(ti, t, 0)