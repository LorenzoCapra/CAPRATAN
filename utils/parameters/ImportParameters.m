function [Settings, Spacecraft] = ImportParameters(n_sim, display)

% Function to import the simulation parameters and the spacecraft properties 
% and put them inside two structures called Settings and Spacecraft respectively.

%% Simulation settings
Settings.simulationTime = 100; % [s]
Settings.absTolerance = 1e-8;
Settings.relTolerance = 1e-8;
Settings.jd0 = 2458941; % [days]
Settings.leapseconds = 37; 

%% Constant variables
Settings.sigma = 5.67e-8; % [W/m^2K^4]
Settings.mu = 398600; % [km^3/s^2]
Settings.Gs = 1361; % [W/m^2]
Settings.albFactor = 0.35; % [-]
Settings.T_deep_space = 3; % [K]
Settings.T_earth = 253.73; % [K]

%% Spacecraft parameters
Spacecraft.params.mass = 14; % [kg]
Spacecraft.params.inertia = [0.33845, -0.17334, -0.00693;
                             -0.17334, 0.3409, -0.00644;
                             -0.00693, -0.00644, 0.4494]; % [kg*m^2]
Spacecraft.params.NS = 6; % number of spacecraft faces
% Normal Directions of the Faces - Normalized
N1_1 =[ 1; 0; 0]; %In geometric reference.
N1_2 =[-1; 0; 0]; %In geometric reference.
N1_3 =[ 0; 1; 0]; %In geometric reference.
N1_4 =[ 0;-1; 0]; %In geometric reference.
N1_5 =[ 0; 0; 1]; %In geometric reference.
N1_6 =[ 0; 0;-1]; %In geometric reference.
Spacecraft.params.N=[N1_1,N1_2,N1_3,N1_4,N1_5,N1_6];
% Geometric dimensions of the satellite
L1 = 0.2; % [m]
L2 = 0.5; % [m] (body + solar panel)
L3 = 0.3; % [m]
% Center of mass position (for now it is ideal)
xcom = 0.1; % [m]
ycom = 0.25; % [m]
zcom = 0.15; % [m]
Spacecraft.params.com = [xcom;ycom;zcom]; % [m]
% Center of pressure vector of the Faces with respect to C.O.M.
% Exact values because of geometry of the S/C - Variations are directly inserted in C.O.M. defintion
R1_1 =[   L1; L1/2; L3/2] - Spacecraft.params.com; %In geometric reference.
R1_2 =[  0.00; L1/2; L3/2] - Spacecraft.params.com; %In geometric reference.
R1_3 =[ L1/2;   L1; L3/2] - Spacecraft.params.com; %In geometric reference.    % REVISE %
R1_4 =[ L1/2;  0.00; L3/2] - Spacecraft.params.com; %In geometric reference.
R1_5 =[ L1/2; L1/2;   L3] - Spacecraft.params.com; %In geometric reference.
R1_6 =[ L1/2; L1/2;  0.00] - Spacecraft.params.com; %In geometric reference.
Spacecraft.params.R=[R1_1,R1_2,R1_3,R1_4,R1_5,R1_6];
% Surfaces of the Faces
% Faces Subdivision in B frame
S1_sv=[0,0,0,0,1,1]; %Small Faces
S1_lv=[1,1,0,0,0,0]; %Large Faces
S1_pv=[0,0,1,1,0,0]; %Panels Faces
S1_1=L1*L1; %m2
S1_3=L1*L3; %m2
S1_2=L3*L2; %m2
Spacecraft.params.S=S1_1.*S1_sv+S1_3.*S1_lv+S1_2.*S1_pv;
Spacecraft.params.R_surf = Spacecraft.params.R;
Spacecraft.params.N_surf = Spacecraft.params.N;
Spacecraft.params.S_surf = Spacecraft.params.S;
%% Data for Solar pressure
Spacecraft.params.c_dif=0.1;
Spacecraft.params.c_spe=0.1;
Spacecraft.params.c_dif=Spacecraft.params.c_dif;
Spacecraft.params.c_spe=Spacecraft.params.c_spe;
Spacecraft.params.c_abs=1-Spacecraft.params.c_dif-Spacecraft.params.c_spe;

Spacecraft.orbit.Re = 6378; % [km]
Spacecraft.orbit.Rp = Spacecraft.orbit.Re + 664; % [km]
Spacecraft.orbit.e = 0.01; % [-]
Spacecraft.orbit.Ra = Spacecraft.orbit.Rp*(1+Spacecraft.orbit.e)/(1-Spacecraft.orbit.e); % [km]
Spacecraft.orbit.a = 0.5*(Spacecraft.orbit.Rp + Spacecraft.orbit.Ra); % [km]
Spacecraft.orbit.ii = deg2rad(98); % [rad]
Spacecraft.orbit.raan = 5.8966; % [rad]
Spacecraft.orbit.wper = 5.657; % [rad]
if n_sim == 1
    Spacecraft.orbit.th = 0.3142; % [rad]
elseif n_sim > 1
    Spacecraft.orbit.th = deg2rad(rand*360); % [rad]
end
Spacecraft.orbit.oev = [Spacecraft.orbit.a, Spacecraft.orbit.e, Spacecraft.orbit.ii, ...
                        Spacecraft.orbit.raan, Spacecraft.orbit.wper, Spacecraft.orbit.th];
[Spacecraft.orbit.r, Spacecraft.orbit.v] = orb2eci(Settings.mu, Spacecraft.orbit.oev);
Spacecraft.orbit.T = 2*pi*sqrt(Spacecraft.orbit.a^3/Settings.mu); % [s]
Spacecraft.orbit.n = 2*pi/Spacecraft.orbit.T; % [1/s]
Spacecraft.orbit.alt = norm(Spacecraft.orbit.r) - Spacecraft.orbit.Re; % [km]

if n_sim == 1
    Spacecraft.attitude.q0 = [0; 0; 0; 1]; % (-)
    Spacecraft.attitude.w0 = [0; 0; 0]; % (rad/s)
elseif n_sim > 1
    Spacecraft.attitude.q0 = rand(4, 1) - 0.5; % (-)
    Spacecraft.attitude.w0 = deg2rad(10)*randn(3, 1); % (rad/s)
end

if display
    fprintf('-------------------------------------Orbital Elements---------------------------------------- \n');
    fprintf('Semimajor axis[km] Eccentricity[-] Inclination[�] Argument Perigee[�] RAAN[�] True Anomaly[�] \n');
    fprintf('%5.1f %15.2f %15.1f %15.1f %15.1f %15.1f \n',Spacecraft.orbit.oev(1),Spacecraft.orbit.oev(2),rad2deg(Spacecraft.orbit.oev(3)),rad2deg(Spacecraft.orbit.oev(4)),rad2deg(Spacecraft.orbit.oev(5)),rad2deg(Spacecraft.orbit.oev(6)))
    fprintf('Orbital Period [s]: %f \n',Spacecraft.orbit.T);
end


end