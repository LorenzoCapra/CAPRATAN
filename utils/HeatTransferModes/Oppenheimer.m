function Edot = Oppenheimer(T1, T2, A1, A2, eps1, eps2, F12)

sigma = 5.67e-8; % [W/m^2K^4]

num = - sigma * (T2^4 - T1^4);
den = (1-eps1)/(eps1*A1) + 1/(A1*F12) + (1-eps2)/(eps2*A2);

Edot = num/den;

end