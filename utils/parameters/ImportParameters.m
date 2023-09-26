function [Settings, Spacecraft] = ImportParameters(n_sim, display)

% Function to import the simulation parameters and the spacecraft properties 
% and put them inside two structures called Settings and Spacecraft respectively.

%% Simulation settings
Settings.simulationTime = 6000; % [s]
Settings.absTolerance = 1e-8;
Settings.relTolerance = 1e-8;
Settings.jd0 = 2458941; % [days]
Settings.leapseconds = 37; 

%% Constant variables
Settings.sigma = 5.67e-8; % [W/m^2K^4]
Settings.mu = 398600; % [km^3/s^2]
Settings.Gs = 1367; % [W/m^2]
Settings.albFactor = 0.35; % [-]
Settings.T_deep_space = 3; % [K]
Settings.T_earth = 253.73; % [K]
Settings.Resistance = 100; % Contact resistance [W/Km^2]   ---- 7000 W/Km^2 ---- 600 W/Km^2

%% Spacecraft inertial and geometrical parameters
Spacecraft.params.mass = 14; % [kg]
Spacecraft.params.inertia = [0.33845, -0.17334, -0.00693;
                             -0.17334, 0.3409, -0.00644;
                             -0.00693, -0.00644, 0.4494]; % [kg*m^2]
Spacecraft.params.NS = 10; % number of spacecraft faces
% Normal Directions of the Faces - Normalized
N1_1 =[ 1; 0; 0]; %In geometric reference.
N1_2 =[-1; 0; 0]; %In geometric reference.
N1_3 =[ 0; 1; 0]; %In geometric reference.
N1_4 =[ 0;-1; 0]; %In geometric reference.
N1_5 =[ 0; 0; 1]; %In geometric reference.
N1_6 =[ 0; 0;-1]; %In geometric reference.
%Solar Panels
N1_7 =[-1;-1; 0]/sqrt(2); %In geometric reference - panels with positive X (front SA)
N1_8 =[ 1; 1; 0]/sqrt(2); %In geometric reference - panels with positive X
N1_9 =[-1;-1; 0]/sqrt(2); %In geometric reference - panels with positive Y (front SA)
N1_10=[ 1; 1; 0]/sqrt(2); %In geometric reference - panels with positive Y
Spacecraft.params.N=[N1_1,N1_2,N1_3,N1_4,N1_5,N1_6,N1_7,N1_8,N1_9,N1_10];
% Geometric dimensions of the satellite
L_s=0.2; %m - Small side
L_l=0.3; %m - Long side
L_p=0.7; %m - Panel Extension
% Center of mass position (for now it is ideal)
xcom = 0.1; % [m]
ycom = 0.1; % [m]
zcom = 0.15; % [m]
Spacecraft.params.com = [xcom;ycom;zcom]; % [m]
% Center of pressure vector of the Faces with respect to C.O.M.
% Exact values because of geometry of the S/C - Variations are directly inserted in C.O.M. defintion
R1_1 =[   L_s; L_s/2; L_l/2] - Spacecraft.params.com; %In geometric reference.
R1_2 =[  0.00; L_s/2; L_l/2] - Spacecraft.params.com; %In geometric reference.
R1_3 =[ L_s/2;   L_s; L_l/2] - Spacecraft.params.com; %In geometric reference.
R1_4 =[ L_s/2;  0.00; L_l/2] - Spacecraft.params.com; %In geometric reference.
R1_5 =[ L_s/2; L_s/2;   L_l] - Spacecraft.params.com; %In geometric reference.
R1_6 =[ L_s/2; L_s/2;  0.00] - Spacecraft.params.com; %In geometric reference.
%Solar Panels
R1_7 =[ L_s+L_p/2/sqrt(2);    -L_p/2/sqrt(2); L_l/2] - Spacecraft.params.com; %In geometric reference.
R1_8 =[ L_s+L_p/2/sqrt(2);    -L_p/2/sqrt(2); L_l/2] - Spacecraft.params.com; %In geometric reference.
R1_9 =[    -L_p/2/sqrt(2); L_s+L_p/2/sqrt(2); L_l/2] - Spacecraft.params.com; %In geometric reference.
R1_10=[    -L_p/2/sqrt(2); L_s+L_p/2/sqrt(2); L_l/2] - Spacecraft.params.com; %In geometric reference.
Spacecraft.params.R=[R1_1,R1_2,R1_3,R1_4,R1_5,R1_6,R1_7,R1_8,R1_9,R1_10];
% Surfaces of the Faces
% Faces Subdivision in B frame
S1_sv=[0,0,0,0,1,1,0,0,0,0]; %Small Faces
S1_lv=[1,1,1,1,0,0,0,0,0,0]; %Large Faces
S1_pv=[0,0,0,0,0,0,1,1,1,1]; %Panels Faces
S1_s=L_s*L_s; %m2
S1_l=L_s*L_l; %m2
S1_p=L_l*L_p; %m2
Spacecraft.params.S=S1_s.*S1_sv+S1_l.*S1_lv+S1_p.*S1_pv;
Spacecraft.params.R_surf = Spacecraft.params.R;
Spacecraft.params.N_surf = Spacecraft.params.N;
Spacecraft.params.S_surf = Spacecraft.params.S;
% Data for Solar pressure
Spacecraft.params.c_dif=0.1;
Spacecraft.params.c_spe=0.1;
Spacecraft.params.c_dif=Spacecraft.params.c_dif;
Spacecraft.params.c_spe=Spacecraft.params.c_spe;
Spacecraft.params.c_abs=1-Spacecraft.params.c_dif-Spacecraft.params.c_spe;

%% Spacecraft orbital parameters
Spacecraft.orbit.Re = 6378; % [km]
Spacecraft.orbit.Rp = Spacecraft.orbit.Re + 664; % [km]
Spacecraft.orbit.e = 0.009638; % [-]
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

Settings.F_sc_earth = Spacecraft.orbit.Re^2 / ((Spacecraft.orbit.alt + Spacecraft.orbit.Re)^2);

%% Spacecraft attitude parameters
if n_sim == 1
    Spacecraft.attitude.q0 = rand(4, 1) - 0.5; % (-)
    Spacecraft.attitude.w0 = deg2rad(1)*randn(3, 1); % (rad/s)
elseif n_sim > 1
    Spacecraft.attitude.q0 = rand(4, 1) - 0.5; % (-)
    Spacecraft.attitude.w0 = deg2rad(10)*randn(3, 1); % (rad/s)
end

if display
    fprintf('-------------------------------------Orbital Elements---------------------------------------- \n');
    fprintf('Semimajor axis[km] Eccentricity[-] Inclination[�] Argument Perigee[�] RAAN[�] True Anomaly[�] \n');
    fprintf('%7.1f %15.2f %15.1f %15.1f %19.1f %12.1f \n',Spacecraft.orbit.oev(1),Spacecraft.orbit.oev(2),rad2deg(Spacecraft.orbit.oev(3)),rad2deg(Spacecraft.orbit.oev(4)),rad2deg(Spacecraft.orbit.oev(5)),rad2deg(Spacecraft.orbit.oev(6)))
    fprintf('Orbital Period [s]: %f \n \n',Spacecraft.orbit.T);
end


end