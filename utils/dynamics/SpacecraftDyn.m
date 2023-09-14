function dx = SpacecraftDyn(t, x, Settings, Spacecraft)

% Orbital motion
r = x(1:3);
v = x(4:6);
r_norm = norm(r);

a = -Settings.mu * r / (r_norm ^ 3);

% Attitude motion
q = x(7:10);
w = x(11:13);
I = Spacecraft.params.inertia;

OM = skew_symmetric(w);
qdot = 0.5*OM*q;

wdot = [(I(2,2)-I(3,3))*w(2)*w(3)/I(1,1); ...
        (I(3,3)-I(1,1))*w(1)*w(3)/I(2,2); ...
        (I(1,1)-I(2,2))*w(2)*w(1)/I(3,3)];

dx = [v; a; qdot; wdot];

end