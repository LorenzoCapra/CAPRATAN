function ThermalPlots(Orbit, Thermal, Spacecraft, Settings)

close all

% Plotting options
set( 0, 'defaultlegendinterpreter', 'latex' ) ;
set( 0, 'defaulttextinterpreter', 'latex' ) ;
set( 0,'defaultAxesFontSize', 15 ) ;
set( groot, 'defaultLegendLocation', 'best' )
set( groot,'defaultLineLineWidth', 1.5 ) ;
color = { [0 0.4470 0.7410], [0.8500 0.3250 0.0980], [0.9290 0.6940 0.1250], [0.4940 0.1840 0.5560], [0.4660 0.6740 0.1880], [0.3010 0.7450 0.9330], [0.6350 0.0780 0.1840], [153,153,255]/255 } ;
time = linspace(0,Settings.simulationTime,size(Orbit.r,1));

% Plot the spacecraft orbit
figure(1)
plot3(Orbit.r(:,1),Orbit.r(:,2),Orbit.r(:,3),'r',LineWidth=2)
hold on, grid on, axis equal
set(gca, 'NextPlot','add','Color','none');
[xx, yy, zz] = ellipsoid(0, 0, 0, Spacecraft.orbit.Re, Spacecraft.orbit.Re, Spacecraft.orbit.Re, 72);
earth = surf(xx, yy, -zz);
cdata = imread('earth.jpg');
set(earth, 'FaceColor', 'texturemap', 'CData', cdata,'FaceAlpha', 0.75, 'EdgeColor', 'none');
colormap('gray');
xlabel('x [km]', 'FontSize', 12);
ylabel('y [km]', 'FontSize', 12);
zlabel('z [km]', 'FontSize', 12);
title('Spacecraft orbit')

% Plot the quaternion evolution
figure(2)
plot(time, Orbit.q(:,1),'Color',color{1},LineWidth=1.5)
grid on, hold on, xlabel('Time [s]'), ylabel('[-]'), title('Spacecraft quaternion evolution')
plot(time, Orbit.q(:,2),'Color',color{2},LineWidth=1.5)
plot(time, Orbit.q(:,3),'Color',color{3},LineWidth=1.5)
plot(time, Orbit.q(:,4),'Color',color{4},LineWidth=1.5)
legend('q1', 'q2', 'q3', 'q4')

% Plot the angular velocity evolution
figure(3)
plot(time, Orbit.w(:,1),'Color',color{1},LineWidth=1.5)
grid on, hold on, xlabel('Time [s]'), ylabel('[rad/s]'), title('Spacecraft angular velocity')
plot(time, Orbit.w(:,2),'Color',color{2},LineWidth=1.5)
plot(time, Orbit.w(:,3),'Color',color{3},LineWidth=1.5)
legend('wx', 'wy', 'wz')

% Plot the temperature evolution of Surface 1
figure(4)
plot(time, Thermal.Ts1,'Color',color{1},LineWidth=1.5)
grid on, hold on, xlabel('Time [s]'), ylabel('[K]'), title('Temperature of surface 1')
legend('Ts1')

% Plot the temperature evolution of Surface 2
figure(5)
plot(time, Thermal.Ts2,'Color',color{2},LineWidth=1.5)
grid on, hold on, xlabel('Time [s]'), ylabel('[K]'), title('Temperature of surface 2')
legend('Ts2')

% Plot the temperature evolution of Surface 3
figure(6)
plot(time, Thermal.Ts3,'Color',color{3},LineWidth=1.5)
grid on, hold on, xlabel('Time [s]'), ylabel('[K]'), title('Temperature of surface 3')
legend('Ts3')

% Plot the temperature evolution of Surface 4
figure(7)
plot(time, Thermal.Ts4,'Color',color{4},LineWidth=1.5)
grid on, hold on, xlabel('Time [s]'), ylabel('[K]'), title('Temperature of surface 4')
legend('Ts4')

% Plot the temperature evolution of Surface 5
figure(8)
plot(time, Thermal.Ts5,'Color',color{5},LineWidth=1.5)
grid on, hold on, xlabel('Time [s]'), ylabel('[K]'), title('Temperature of surface 5')
legend('Ts5')

% Plot the temperature evolution of Surface 6
figure(9)
plot(time, Thermal.Ts6,'Color',color{6},LineWidth=1.5)
grid on, hold on, xlabel('Time [s]'), ylabel('[K]'), title('Temperature of surface 6')
legend('Ts6')

% Plot the temperature evolution of the Propulsion unit
figure(10)
plot(time, Thermal.Tprop,'Color',color{7},LineWidth=1.5)
grid on, hold on, xlabel('Time [s]'), ylabel('[K]'), title('Temperature of the propulsion unit')
legend('Tprop')

% Plot the temperature evolution of the EPS
figure(11)
plot(time, Thermal.Teps,'Color',color{8},LineWidth=1.5)
grid on, hold on, xlabel('Time [s]'), ylabel('[K]'), title('Temperature of the EPS')
legend('Teps')

% Plot the temperature evolution of the Payload
figure(12)
plot(time, Thermal.Tpl,'Color',color{1},LineWidth=1.5)
grid on, hold on, xlabel('Time [s]'), ylabel('[K]'), title('Temperature of the payload')
legend('Tpl')

% Plot the temperature evolution of the Antenna
figure(13)
plot(time, Thermal.Tant,'Color',color{2},LineWidth=1.5)
grid on, hold on, xlabel('Time [s]'), ylabel('[K]'), title('Temperature of the antenna')
legend('Tant')

% Plot the temperature evolution of the first SP surface
figure(14)
plot(time, Thermal.Tsp1,'Color',color{3},LineWidth=1.5)
grid on, hold on, xlabel('Time [s]'), ylabel('[K]'), title('Temperature of the SP surface 1')
legend('Tsp1')

% Plot the temperature evolution of the second SP surface
figure(15)
plot(time, Thermal.Tsp2,'Color',color{4},LineWidth=1.5)
grid on, hold on, xlabel('Time [s]'), ylabel('[K]'), title('Temperature of the SP surface 2')
legend('Tsp2')

% Plot the temperature evolution of the third SP surface
figure(15)
plot(time, Thermal.Tsp3,'Color',color{4},LineWidth=1.5)
grid on, hold on, xlabel('Time [s]'), ylabel('[K]'), title('Temperature of the SP surface 3')
legend('Tsp3')

% Plot the temperature evolution of the fourth SP surface
figure(16)
plot(time, Thermal.Tsp4,'Color',color{5},LineWidth=1.5)
grid on, hold on, xlabel('Time [s]'), ylabel('[K]'), title('Temperature of the SP surface 4')
legend('Tsp4')

% Plot eclipse step function
figure(17)
plot(time, Orbit.eclipse,'Color',color{6},LineWidth=1.5)
grid on, hold on, xlabel('Time [s]'), ylabel('[-]'), title('Eclipse')
ylim([-.1, 1.1])

end