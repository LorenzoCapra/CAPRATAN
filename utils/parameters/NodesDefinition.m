function Nodes = NodesDefinition(display)

% Function used to define the nodes of the simulation. 
% This function is to be tailored according to the specified mission, since
% the selection of the nodes is heavily mission-dependent.
% This file could be substituted by a .yml input file to be read from the
% main script.

% ------------------------------------------------------------------------------ %
%
% The current nodes definition is valid for the e.Inspector ESA mission. 
%
% The selected nodes are:
% - the 6 external surfaces
% - the solar panels 4 surfaces
% - the propulsion unit
% - the EPS subsystem
% - the antenna
%
% ------------------------------------------------------------------------------ %

function xK = cent2Kelvin(xC)
    xK = xC + 273.15;
end

%% Surface 1
Nodes.S1.A                  = 0.2*0.2; % [m^2]
Nodes.S1.rho                = 2700; % [km/m^3]
Nodes.S1.thickness          = 0.02; % [m]
Nodes.S1.V                  = Nodes.S1.A*Nodes.S1.thickness; % [m^3]
Nodes.S1.cv                 = 900; % [J/kgK]
Nodes.S1.alfa               = 0.1; % [-]
Nodes.S1.emissivity         = 0.1; % [-]
Nodes.S1.conductivity       = 237; % [W/mK]
Nodes.S1.Pdiss              = 0; % [W]
Nodes.S1.F                  = 0.5; % [-]
Nodes.S1.T0                 = cent2Kelvin(20); % [K]
Nodes.S1.Ac                 = 0.2*Nodes.S1.thickness; % [m^2]
    
%% Surface 2
Nodes.S2.A                  = 0.2*0.3; % [m^2]
Nodes.S2.rho                = 2700; % [km/m^3]
Nodes.S2.thickness          = 0.02; % [m]
Nodes.S2.V                  = Nodes.S2.A*Nodes.S2.thickness; % [m^3]
Nodes.S2.cv                 = 900; % [J/kgK]
Nodes.S2.alfa               = 0.1; % [-]
Nodes.S2.emissivity         = 0.1; % [-]
Nodes.S2.conductivity       = 237; % [W/mK]
Nodes.S2.Pdiss              = 0; % [W]
Nodes.S2.F                  = 0.5; % [-]
Nodes.S2.T0                 = cent2Kelvin(20); % [K]
Nodes.S2.Ac                 = 0.2*Nodes.S2.thickness; % [m^2]

%% Surface 3
Nodes.S3.A                  = 0.2*0.2; % [m^2]
Nodes.S3.rho                = 2700; % [km/m^3]
Nodes.S3.thickness          = 0.02; % [m]
Nodes.S3.V                  = Nodes.S3.A*Nodes.S3.thickness; % [m^3]
Nodes.S3.cv                 = 900; % [J/kgK]
Nodes.S3.alfa               = 0.1; % [-]
Nodes.S3.emissivity         = 0.1; % [-]
Nodes.S3.conductivity       = 237; % [W/mK]
Nodes.S3.Pdiss              = 0; % [W]
Nodes.S3.F                  = 0.5; % [-]
Nodes.S3.T0                 = cent2Kelvin(20); % [K]
Nodes.S3.Ac                 = 0.2*Nodes.S3.thickness; % [m^2]

%% Surface 4
Nodes.S4.A                  = 0.2*0.3; % [m^2]
Nodes.S4.rho                = 2700; % [km/m^3]
Nodes.S4.thickness          = 0.02; % [m]
Nodes.S4.V                  = Nodes.S4.A*Nodes.S4.thickness; % [m^3]
Nodes.S4.cv                 = 900; % [J/kgK]
Nodes.S4.alfa               = 0.1; % [-]
Nodes.S4.emissivity         = 0.1; % [-]
Nodes.S4.conductivity       = 237; % [W/mK]
Nodes.S4.Pdiss              = 0; % [W]
Nodes.S4.F                  = 0.5; % [-]
Nodes.S4.T0                 = cent2Kelvin(20); % [K]
Nodes.S4.Ac                 = 0.2*Nodes.S4.thickness; % [m^2]

%% Surface 5
Nodes.S5.A                  = 0.2*0.3; % [m^2]
Nodes.S5.rho                = 2700; % [km/m^3]
Nodes.S5.thickness          = 0.02; % [m]
Nodes.S5.V                  = Nodes.S5.A*Nodes.S5.thickness; % [m^3]
Nodes.S5.cv                 = 900; % [J/kgK]
Nodes.S5.alfa               = 0.1; % [-]
Nodes.S5.emissivity         = 0.1; % [-]
Nodes.S5.conductivity       = 237; % [W/mK]
Nodes.S5.Pdiss              = 0; % [W]
Nodes.S5.F                  = 0.5; % [-]
Nodes.S5.T0                 = cent2Kelvin(20); % [K]
Nodes.S5.Ac                 = 0.02*Nodes.S5.thickness; % [m^2]

%% Surface 6
Nodes.S6.A                  = 0.2*0.3; % [m^2]
Nodes.S6.rho                = 2700; % [km/m^3]
Nodes.S6.thickness          = 0.02; % [m]
Nodes.S6.V                  = Nodes.S6.A*Nodes.S6.thickness; % [m^3]
Nodes.S6.cv                 = 900; % [J/kgK]
Nodes.S6.alfa               = 0.1; % [-]
Nodes.S6.emissivity         = 0.1; % [-]
Nodes.S6.conductivity       = 237; % [W/mK]
Nodes.S6.Pdiss              = 0; % [W]
Nodes.S6.F                  = 0.5; % [-]
Nodes.S6.T0                 = cent2Kelvin(20); % [K]
Nodes.S6.Ac                 = 0.2*Nodes.S6.thickness; % [m^2]

%% Solar Panel 1
Nodes.SP1.A                 = 0.2*0.6; % [m^2]
Nodes.SP1.rho               = 2700; % [km/m^3]
Nodes.SP1.thickness         = 0.02; % [m]
Nodes.SP1.V                 = Nodes.SP1.A*Nodes.SP1.thickness; % [m^3]
Nodes.SP1.cv                = 900; % [J/kgK]
Nodes.SP1.alfa              = 0.1; % [-]
Nodes.SP1.emissivity        = 0.1; % [-]
Nodes.SP1.conductivity      = 237; % [W/mK]
Nodes.SP1.Pdiss             = 0; % [W]
Nodes.SP1.F                 = 0.5; % [-]
Nodes.SP1.T0                = cent2Kelvin(20); % [K]
Nodes.SP1.Acs               = 0.2*Nodes.SP1.thickness; % [m^2]
Nodes.SP1.Acp               = 0.2*0.6; % [m^2]

%% Solar Panel 2
Nodes.SP2.A                 = 0.2*0.6; % [m^2]
Nodes.SP2.rho               = 2700; % [km/m^3]
Nodes.SP2.thickness         = 0.02; % [m]
Nodes.SP2.V                 = Nodes.SP2.A*Nodes.SP2.thickness; % [m^3]
Nodes.SP2.cv                = 900; % [J/kgK]
Nodes.SP2.alfa              = 0.1; % [-]
Nodes.SP2.emissivity        = 0.1; % [-]
Nodes.SP2.conductivity      = 237; % [W/mK]
Nodes.SP2.Pdiss             = 0; % [W]
Nodes.SP2.F                 = 0.5; % [-]
Nodes.SP2.T0                = cent2Kelvin(20); % [K]
Nodes.SP2.Acs               = 0.2*Nodes.SP2.thickness; % [m^2]
Nodes.SP2.Acp               = 0.2*0.6; % [m^2]

%% Solar Panel 3
Nodes.SP3.A                 = 0.2*0.6; % [m^2]
Nodes.SP3.rho               = 2700; % [km/m^3]
Nodes.SP3.thickness         = 0.02; % [m]
Nodes.SP3.V                 = Nodes.SP3.A*Nodes.SP3.thickness; % [m^3]
Nodes.SP3.cv                = 900; % [J/kgK]
Nodes.SP3.alfa              = 0.1; % [-]
Nodes.SP3.emissivity        = 0.1; % [-]
Nodes.SP3.conductivity      = 237; % [W/mK]
Nodes.SP3.Pdiss             = 0; % [W]
Nodes.SP3.F                 = 0.5; % [-]
Nodes.SP3.T0                = cent2Kelvin(20); % [K]
Nodes.SP3.Acs               = 0.2*Nodes.SP3.thickness; % [m^2]
Nodes.SP3.Acp               = 0.2*0.6; % [m^2]

%% Solar Panel 4
Nodes.SP4.A                 = 0.2*0.6; % [m^2]
Nodes.SP4.rho               = 2700; % [km/m^3]
Nodes.SP4.thickness         = 0.02; % [m]
Nodes.SP4.V                 = Nodes.SP4.A*Nodes.SP4.thickness; % [m^3]
Nodes.SP4.cv                = 900; % [J/kgK]
Nodes.SP4.alfa              = 0.1; % [-]
Nodes.SP4.emissivity        = 0.1; % [-]
Nodes.SP4.conductivity      = 237; % [W/mK]
Nodes.SP4.Pdiss             = 0; % [W]
Nodes.SP4.F                 = 0.5; % [-]
Nodes.SP4.T0                = cent2Kelvin(20); % [K]
Nodes.SP4.Acs               = 0.2*Nodes.SP4.thickness; % [m^2]
Nodes.SP4.Acp               = 0.2*0.6; % [m^2]

%% Propulsion Unit
Nodes.Prop.A                = 0.03; % [m^2]
Nodes.Prop.rho              = 2700; % [km/m^3]
Nodes.Prop.V                = 0.001; % [m^3]
Nodes.Prop.cv               = 900; % [J/kgK]
Nodes.Prop.alfa             = 0.1; % [-]
Nodes.Prop.emissivity       = 0.1; % [-]
Nodes.Prop.conductivity     = 237; % [W/mK]
Nodes.Prop.Pdiss            = 5; % [W]
Nodes.Prop.F                = 0.5; % [-]
Nodes.Prop.T0               = cent2Kelvin(30);
Nodes.Prop.thickness        = 0.05; % [m]
Nodes.Prop.Ac               = 0.01; % [m^2]

%% EPS subsystem
Nodes.Eps.A                 = 0.01; % [m^2]
Nodes.Eps.rho               = 2700; % [km/m^3]
Nodes.Eps.V                 = 0.0005; % [m^3]
Nodes.Eps.cv                = 900; % [J/kgK]
Nodes.Eps.alfa              = 0.1; % [-]
Nodes.Eps.emissivity        = 0.1; % [-]
Nodes.Eps.conductivity      = 237; % [W/mK]
Nodes.Eps.Pdiss             = 10; % [W]
Nodes.Eps.F                 = 0.5; % [-]
Nodes.Eps.T0                = cent2Kelvin(30); % [K]
Nodes.Eps.thickness         = 0.05; % [m]
Nodes.Eps.Ac                = 0.01; % [m^2]

%% Antenna
Nodes.Antenna.A             = 0.01; % [m^2]
Nodes.Antenna.rho           = 2700; % [km/m^3]
Nodes.Antenna.V             = 0.0005; % [m^3]
Nodes.Antenna.cv            = 900; % [J/kgK]
Nodes.Antenna.alfa          = 0.1; % [-]
Nodes.Antenna.emissivity    = 0.1; % [-]
Nodes.Antenna.conductivity  = 237; % [W/mK]
Nodes.Antenna.Pdiss         = 5; % [W]
Nodes.Antenna.F             = 0.5; % [-]
Nodes.Antenna.T0            = cent2Kelvin(10); % [K]
Nodes.Antenna.thickness     = 0.02; % [m]
Nodes.Antenna.Ac            = 0.01; % [m^2]

%% Payload
Nodes.PL.A                  = 0.01; % [m^2]
Nodes.PL.rho                = 2700; % [km/m^3]
Nodes.PL.V                  = 0.002; % [m^3]
Nodes.PL.cv                 = 900; % [J/kgK]
Nodes.PL.alfa               = 0.1; % [-]
Nodes.PL.emissivity         = 0.1; % [-]
Nodes.PL.conductivity       = 237; % [W/mK]
Nodes.PL.Pdiss              = 2; % [W]
Nodes.PL.F                  = 0.5; % [-]
Nodes.PL.T0                 = cent2Kelvin(10); % [K]
Nodes.PL.thickness          = 0.05; % [m]
Nodes.PL.Ac                 = 0.01; % [m^2]

if display
    fprintf('-------------------------------------Nodes Temperatures [K]---------------------------------------------------------------------------------------- \n');
    fprintf(['T_surface1 T_surface2 T_surface3 T_surface4 T_surface5 T_surface6 T_solar_panel1 T_solar_panel2 T_solar_panel3 T_solar_panel4 ' ...
        'T_prop T_eps T_antenna T_payload \n']);
    fprintf('%9.1f %9.1f %9.1f %9.1f %10.1f %10.1f %12.1f %13.1f %15.1f %15.1f %11.1f %6.1f %8.1f %8.1f \n', ...
        Nodes.S1.T0,Nodes.S2.T0,Nodes.S3.T0,Nodes.S4.T0,Nodes.S5.T0,Nodes.S6.T0,Nodes.SP1.T0,Nodes.SP2.T0,Nodes.SP3.T0,Nodes.SP4.T0, ...
        Nodes.Prop.T0,Nodes.Eps.T0,Nodes.Antenna.T0,Nodes.PL.T0)
end

end