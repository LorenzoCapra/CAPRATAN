function Qcond = Conduction(T1, T2, conductivity, area, thickness, resistance)

Rtot = thickness/(conductivity*area) + resistance/area;

Qcond = (T1-T2) / Rtot;

end