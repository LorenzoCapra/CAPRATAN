function Qdeep_space = DeepSpaceRadiation(T, emissivity, area, Settings)

Qdeep_space = Settings.sigma*emissivity*area*(T^4 - Settings.T_deep_space^4);

end