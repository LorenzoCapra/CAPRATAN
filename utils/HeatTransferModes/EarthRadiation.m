function Qearth = EarthRadiation(absorptivity, emissivity, area, Albedo, F_sc_earth, Settings)

if Albedo
    albedo = absorptivity*Settings.Gs*area*Settings.albFactor*F_sc_earth;
else
    albedo = 0;
end

ir = Settings.sigma*Settings.T_earth*area*emissivity*F_sc_earth;

Qearth = albedo + ir;

end