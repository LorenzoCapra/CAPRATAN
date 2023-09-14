function [Albedo, Eclipse, nu] = CheckEclipse(r_sat, r_sun)

% Function computing the eclipse percentage and wheter albedo is active or
% not. The input variables must be in [m].

Rs = 696000000; % [m]
earth_radius = 6378137; % [m]
atmosphere_heigth = 90000; % [m]
Rp = earth_radius + atmosphere_heigth; % [m]

% Compute the shadow function from a generic occulting body.
% See shadow_function.m documentation for more info.
nu = shadow_function(r_sat, r_sun, Rs, Rp);

if nu == 1
    Albedo = true;
    Eclipse = 0;
else
    Albedo = false;
    Eclipse = 1 - nu;
end