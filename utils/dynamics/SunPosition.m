function r_sun = SunPosition(time, Settings)

utc = (Settings.jd0 - 2451545) * 86400 + time;

tai = utc + Settings.leapseconds;

tt = tai + 32.184;

% Compute the geocentric position of the Sun in the ECI frame (km)
[~, ~, r_sun] = ephem_sun(tt);

end