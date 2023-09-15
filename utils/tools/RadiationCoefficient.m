function k = RadiationCoefficient(emissivity1, emissivity2, view_factor, Settings)

k = Settings.sigma / ((1-emissivity1)/emissivity1 + 1/view_factor + (1-emissivity2)/emissivity2);

end