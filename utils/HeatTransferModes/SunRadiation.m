function Qsun = SunRadiation(absorptivity, area, eclipse, cos_th, Settings)

Qsun = absorptivity*Settings.Gs*area*(1-eclipse)*cos_th;

end