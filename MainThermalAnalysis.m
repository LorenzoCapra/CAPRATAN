close all
clear
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Spacecraft Thermal Dynamics - Static and Transient analysis.
%
% (c) ASTRA - Aerospace Science and Technology Dept. - PoliMi - 2023
%
% V1.0 - Lorenzo Capra - 09/2023
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% SIMULATION TYPES AND INPUTS
addpath(genpath('utils'));

% -- SIMULATION TYPE
% Number of simulation runs
n_sim = 1;

% True for repeatable Monte Carlo simulations
repeatable = 0;

% -- SIMULATION OPTIONS
sim_mode_type = 'transient';


%% RANDOM NUMBER SETTINGS

if repeatable
    % Rememeber to change seed value if want to repeat different simulations
    seed = 1;
    rng(seed);
else
    rng('shuffle')
end

%% Importing simulation parameters and spacecraft properties + defining nodes
Nodes = NodesDefinition(true);
[Settings, Spacecraft] = ImportParameters(n_sim, true);

%% Simulation
tspan = [0, Settings.simulationTime];
time = 0;
dt = 10;
index = 0;

% Arrays for storing
Orbit.r       = zeros(floor(tspan(end)/dt), 3);
Orbit.v       = zeros(floor(tspan(end)/dt), 3);
Orbit.q       = zeros(floor(tspan(end)/dt), 4);
Orbit.w       = zeros(floor(tspan(end)/dt), 3);
Orbit.r_sun   = zeros(floor(tspan(end)/dt), 3);
Orbit.eclipse = zeros(floor(tspan(end)/dt), 1);
% Orbit.cth     = zeros(floor(tspan(end)/dt), Spacecraft.params.NS);
load('utils\tools\cth.mat')
Orbit.theta   = zeros(floor(tspan(end)/dt), Spacecraft.params.NS);
Thermal.Ts1   = zeros(floor(tspan(end)/dt), 1);
Thermal.Ts2   = zeros(floor(tspan(end)/dt), 1);
Thermal.Ts3   = zeros(floor(tspan(end)/dt), 1);
Thermal.Ts4   = zeros(floor(tspan(end)/dt), 1);
Thermal.Ts5   = zeros(floor(tspan(end)/dt), 1);
Thermal.Ts6   = zeros(floor(tspan(end)/dt), 1);
Thermal.Tsp1  = zeros(floor(tspan(end)/dt), 1);
Thermal.Tsp2  = zeros(floor(tspan(end)/dt), 1);
Thermal.Tsp3  = zeros(floor(tspan(end)/dt), 1);
Thermal.Tsp4  = zeros(floor(tspan(end)/dt), 1);
Thermal.Tprop = zeros(floor(tspan(end)/dt), 1);
Thermal.Teps  = zeros(floor(tspan(end)/dt), 1);
Thermal.Tant  = zeros(floor(tspan(end)/dt), 1);
Thermal.Tpl   = zeros(floor(tspan(end)/dt), 1);

% Integration accuracy options
options = odeset('RelTol', Settings.relTolerance, 'AbsTol', Settings.absTolerance);
% Orbital and Attitude initial conditions
SpacecraftState = [Spacecraft.orbit.r; Spacecraft.orbit.v; Spacecraft.attitude.q0; Spacecraft.attitude.w0];
% Thermal initial conditions
ThermalState = [Nodes.S1.T0; Nodes.S2.T0; Nodes.S3.T0; Nodes.S4.T0; Nodes.S5.T0; Nodes.S6.T0; ...
                Nodes.SP1.T0; Nodes.SP2.T0; Nodes.SP3.T0; Nodes.SP4.T0; ...
                Nodes.Prop.T0; Nodes.Eps.T0; Nodes.Antenna.T0; Nodes.PL.T0];

while time < tspan(end)
    % Update time and index
    time = time + dt;
    index = index+1;

    % Integrate spacecraft dynamics (orbital + attitude)
    [t, y] = ode45(@(t,x) SpacecraftDyn(t,x,Settings,Spacecraft), [0,dt], SpacecraftState, options);

    % Compute position of the Sun
    Orbit.r_sun(index,:) = SunPosition(index, Settings);

    % Check for albedo and eclipse
    [Albedo, Eclipse, nu] = CheckEclipse(SpacecraftState(1:3)*1e3, Orbit.r_sun(index,:)*1e3);

    % Compute the cosine of the angles between each spacecraft face and the Sun direction
    [~, ~, Spacecraft.params.cth, Spacecraft.params.theta] = srp_faces(Orbit.r_sun(index,:)*1e3, SpacecraftState(1:3)*1e3, quat2DCM(SpacecraftState(7:10)), ...
                                                nu, Spacecraft.params.N_surf, Spacecraft.params.R_surf, Spacecraft.params.S_surf, ...
                                                Spacecraft.params.NS, Spacecraft.params.c_spe, Spacecraft.params.c_dif, Spacecraft.params.mass);

    % Integrate the thermal dynamics of each node
    [~, T] = ode45(@(t,x) ThermalDyn(t,x,Settings,Spacecraft,Nodes,Eclipse,Albedo,index,cth), [0,dt], ThermalState, options);

    % Collect orbital and attitude parameters
    Orbit.r(index,:) = y(end,1:3)';
    Orbit.v(index,:) = y(end,4:6)';
    Orbit.q(index,:) = y(end,7:10)';
    Orbit.w(index,:) = y(end,11:13)';
    Spacecraft.orbit.alt = norm(Orbit.r(index,:) - Spacecraft.orbit.Re); % altitude to be used for albedo and IR view factor

    Orbit.eclipse(index) = Eclipse;
    Orbit.cth(index,:) = Spacecraft.params.cth;
    Orbit.theta(index,:) = Spacecraft.params.theta;

    % Collect thermal parameters
    Thermal.Ts1(index)   = T(end,1);
    Thermal.Ts2(index)   = T(end,2);
    Thermal.Ts3(index)   = T(end,3);
    Thermal.Ts4(index)   = T(end,4);
    Thermal.Ts5(index)   = T(end,5);
    Thermal.Ts6(index)   = T(end,6);
    Thermal.Tsp1(index)  = T(end,7);
    Thermal.Tsp2(index)  = T(end,8);
    Thermal.Tsp3(index)  = T(end,9);
    Thermal.Tsp4(index)  = T(end,10);
    Thermal.Tprop(index) = T(end,11);
    Thermal.Teps(index)  = T(end,12);
    Thermal.Tant(index)  = T(end,13);
    Thermal.Tpl(index)   = T(end,14);

    % Update current orbital, attitude and thermal state
    SpacecraftState = [Orbit.r(index,:), Orbit.v(index,:), Orbit.q(index,:), Orbit.w(index,:)];
    ThermalState = [Thermal.Ts1(index), Thermal.Ts2(index), Thermal.Ts3(index), Thermal.Ts4(index), ...
                    Thermal.Ts5(index), Thermal.Ts6(index), Thermal.Tsp1(index), Thermal.Tsp2(index), ...
                    Thermal.Tsp3(index), Thermal.Tsp4(index), Thermal.Tprop(index), ...
                    Thermal.Teps(index), Thermal.Tant(index), Thermal.Tpl(index)];
end

%% Plot the postprocessing results
ThermalPlots(Orbit, Thermal, Spacecraft, Settings)
