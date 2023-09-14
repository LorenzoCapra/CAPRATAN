function Nodes = NodesDefinition(display)

% Function used to define the nodes of the simulation. 
% This function is to be tailored according to the specified mission, since
% the selection of the nodes is heavily mission-dependent.

% ------------------------------------------------------------------------------ %
%
% The current nodes definition is valid for the e.Inspector ESA mission. 
%
% The selected nodes are:
% - the 6 external surfaces (with solar panels assumed as part of the surfaces
% - the propulsion unit
% - the EPS subsystem
% - the antenna
%
% ------------------------------------------------------------------------------ %

function xK = cent2Kelvin(xC)
    xK = xC + 273.15;
end

%% Surface 1
Nodes.S1.A                  = 1; % [m^2]
Nodes.S1.rho                = 2700; % [km/m^3]
Nodes.S1.V                  = 0.1; % [m^3]
Nodes.S1.cv                 = 900; % [J/kgK]
Nodes.S1.alfa               = 0.1; % [-]
Nodes.S1.emissivity         = 0.1; % [-]
Nodes.S1.conductivity       = 237; % [W/mK]
Nodes.S1.Pdiss              = 0; % [W]
Nodes.S1.F                  = 0.5; % [-]
Nodes.S1.T0                 = cent2Kelvin(20); % [K]
Nodes.S1.thickness          = 0.01; % [m]
Nodes.S1.Ac                 = 0.01; % [m^2]
    
%% Surface 2
Nodes.S2.A                  = 3; % [m^2]
Nodes.S2.rho                = 2700; % [km/m^3]
Nodes.S2.V                  = 0.5; % [m^3]
Nodes.S2.cv                 = 900; % [J/kgK]
Nodes.S2.alfa               = 0.1; % [-]
Nodes.S2.emissivity         = 0.1; % [-]
Nodes.S2.conductivity       = 237; % [W/mK]
Nodes.S2.Pdiss              = 0; % [W]
Nodes.S2.F                  = 0.5; % [-]
Nodes.S2.T0                 = cent2Kelvin(20); % [K]
Nodes.S2.thickness          = 0.01; % [m]
Nodes.S2.Ac                 = 0.01; % [m^2]

%% Surface 3
Nodes.S3.A                  = 1; % [m^2]
Nodes.S3.rho                = 2700; % [km/m^3]
Nodes.S3.V                  = 0.1; % [m^3]
Nodes.S3.cv                 = 900; % [J/kgK]
Nodes.S3.alfa               = 0.1; % [-]
Nodes.S3.emissivity         = 0.1; % [-]
Nodes.S3.conductivity       = 237; % [W/mK]
Nodes.S3.Pdiss              = 0; % [W]
Nodes.S3.F                  = 0.5; % [-]
Nodes.S3.T0                 = cent2Kelvin(20); % [K]
Nodes.S3.thickness          = 0.01; % [m]
Nodes.S3.Ac                 = 0.01; % [m^2]

%% Surface 4
Nodes.S4.A                  = 3; % [m^2]
Nodes.S4.rho                = 2700; % [km/m^3]
Nodes.S4.V                  = 0.5; % [m^3]
Nodes.S4.cv                 = 900; % [J/kgK]
Nodes.S4.alfa               = 0.1; % [-]
Nodes.S4.emissivity         = 0.1; % [-]
Nodes.S4.conductivity       = 237; % [W/mK]
Nodes.S4.Pdiss              = 0; % [W]
Nodes.S4.F                  = 0.5; % [-]
Nodes.S4.T0                 = cent2Kelvin(20); % [K]
Nodes.S4.thickness          = 0.01; % [m]
Nodes.S4.Ac                 = 0.01; % [m^2]

%% Surface 5
Nodes.S5.A                  = 1; % [m^2]
Nodes.S5.rho                = 2700; % [km/m^3]
Nodes.S5.V                  = 0.2; % [m^3]
Nodes.S5.cv                 = 900; % [J/kgK]
Nodes.S5.alfa               = 0.1; % [-]
Nodes.S5.emissivity         = 0.1; % [-]
Nodes.S5.conductivity       = 237; % [W/mK]
Nodes.S5.Pdiss              = 0; % [W]
Nodes.S5.F                  = 0.5; % [-]
Nodes.S5.T0                 = cent2Kelvin(20); % [K]
Nodes.S5.thickness          = 0.01; % [m]
Nodes.S5.Ac                 = 0.01; % [m^2]

%% Surface 6
Nodes.S6.A                  = 1; % [m^2]
Nodes.S6.rho                = 2700; % [km/m^3]
Nodes.S6.V                  = 0.2; % [m^3]
Nodes.S6.cv                 = 900; % [J/kgK]
Nodes.S6.alfa               = 0.1; % [-]
Nodes.S6.emissivity         = 0.1; % [-]
Nodes.S6.conductivity       = 237; % [W/mK]
Nodes.S6.Pdiss              = 0; % [W]
Nodes.S6.F                  = 0.5; % [-]
Nodes.S6.T0                 = cent2Kelvin(20); % [K]
Nodes.S6.thickness          = 0.01; % [m]
Nodes.S6.Ac                 = 0.01; % [m^2]

%% Propulsion Unit
Nodes.Prop.A                = 0.1; % [m^2]
Nodes.Prop.rho              = 2700; % [km/m^3]
Nodes.Prop.V                = 0.01; % [m^3]
Nodes.Prop.cv               = 900; % [J/kgK]
Nodes.Prop.alfa             = 0.1; % [-]
Nodes.Prop.emissivity       = 0.1; % [-]
Nodes.Prop.conductivity     = 237; % [W/mK]
Nodes.Prop.Pdiss            = 10; % [W]
Nodes.Prop.F                = 0.5; % [-]
Nodes.Prop.T0               = cent2Kelvin(30);
Nodes.Prop.thickness        = 0.05; % [m]
Nodes.Prop.Ac                 = 0.01; % [m^2]

%% EPS subsystem
Nodes.Eps.A                 = 0.1; % [m^2]
Nodes.Eps.rho               = 2700; % [km/m^3]
Nodes.Eps.V                 = 0.01; % [m^3]
Nodes.Eps.cv                = 900; % [J/kgK]
Nodes.Eps.alfa              = 0.1; % [-]
Nodes.Eps.emissivity        = 0.1; % [-]
Nodes.Eps.conductivity      = 237; % [W/mK]
Nodes.Eps.Pdiss             = 20; % [W]
Nodes.Eps.F                 = 0.5; % [-]
Nodes.Eps.T0                = cent2Kelvin(30); % [K]
Nodes.Eps.thickness         = 0.05; % [m]
Nodes.Eps.Ac                 = 0.01; % [m^2]

%% Antenna
Nodes.Antenna.A             = 0.2; % [m^2]
Nodes.Antenna.rho           = 2700; % [km/m^3]
Nodes.Antenna.V             = 0.02; % [m^3]
Nodes.Antenna.cv            = 900; % [J/kgK]
Nodes.Antenna.alfa          = 0.1; % [-]
Nodes.Antenna.emissivity    = 0.1; % [-]
Nodes.Antenna.conductivity  = 237; % [W/mK]
Nodes.Antenna.Pdiss         = 5; % [W]
Nodes.Antenna.F             = 0.5; % [-]
Nodes.Antenna.T0            = cent2Kelvin(10); % [K]
Nodes.Antenna.thickness     = 0.05; % [m]
Nodes.Antenna.Ac                 = 0.01; % [m^2]

%% Payload
Nodes.PL.A                  = 0.2; % [m^2]
Nodes.PL.rho                = 2700; % [km/m^3]
Nodes.PL.V                  = 0.02; % [m^3]
Nodes.PL.cv                 = 900; % [J/kgK]
Nodes.PL.alfa               = 0.1; % [-]
Nodes.PL.emissivity         = 0.1; % [-]
Nodes.PL.conductivity       = 237; % [W/mK]
Nodes.PL.Pdiss              = 5; % [W]
Nodes.PL.F                  = 0.5; % [-]
Nodes.PL.T0                 = cent2Kelvin(10); % [K]
Nodes.PL.thickness          = 0.05; % [m]
Nodes.PL.Ac                 = 0.01; % [m^2]

if display
    fprintf('-------------------------------------Nodes Temperatures [K]---------------------------------------- \n');
    fprintf('T_surface1 T_surface2 T_surface3 T_surface4 T_surface5 T_surface6 T_prop T_eps T_antenna T_payload \n');
    fprintf('%9.1f %9.1f %9.1f %9.1f %10.1f %10.1f %9.1f %7.1f %8.1f %8.1f \n', ...
        Nodes.S1.T0,Nodes.S2.T0,Nodes.S3.T0,Nodes.S4.T0,Nodes.S5.T0,Nodes.S6.T0,Nodes.Prop.T0,Nodes.Eps.T0,Nodes.Antenna.T0,Nodes.PL.T0)
end

end