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
plot(time/Spacecraft.orbit.T, Orbit.q(:,1),'Color',color{1},LineWidth=1.5)
grid on, hold on, xlabel('Periods [-]'), ylabel('[-]'), title('Spacecraft quaternion evolution')
plot(time/Spacecraft.orbit.T, Orbit.q(:,2),'Color',color{2},LineWidth=1.5)
plot(time/Spacecraft.orbit.T, Orbit.q(:,3),'Color',color{3},LineWidth=1.5)
plot(time/Spacecraft.orbit.T, Orbit.q(:,4),'Color',color{4},LineWidth=1.5)
legend('q1', 'q2', 'q3', 'q4')

% Plot the angular velocity evolution
figure(3)
plot(time/Spacecraft.orbit.T, Orbit.w(:,1),'Color',color{1},LineWidth=1.5)
grid on, hold on, xlabel('Periods [-]'), ylabel('[rad/s]'), title('Spacecraft angular velocity')
plot(time/Spacecraft.orbit.T, Orbit.w(:,2),'Color',color{2},LineWidth=1.5)
plot(time/Spacecraft.orbit.T, Orbit.w(:,3),'Color',color{3},LineWidth=1.5)
legend('wx', 'wy', 'wz')

% Plot the temperature evolution of Surface 1
figure(4)
plot(time/Spacecraft.orbit.T, Thermal.Ts1,'Color',color{1},LineWidth=1.5)
grid on, hold on, xlabel('Periods [-]'), ylabel('[K]'), title('Temperature of surface 1')
legend('Ts1')

% Plot the temperature evolution of Surface 2
figure(5)
plot(time/Spacecraft.orbit.T, Thermal.Ts2,'Color',color{2},LineWidth=1.5)
grid on, hold on, xlabel('Periods [-]'), ylabel('[K]'), title('Temperature of surface 2')
legend('Ts2')

% Plot the temperature evolution of Surface 3
figure(6)
plot(time/Spacecraft.orbit.T, Thermal.Ts3,'Color',color{3},LineWidth=1.5)
grid on, hold on, xlabel('Periods [-]'), ylabel('[K]'), title('Temperature of surface 3')
legend('Ts3')

% Plot the temperature evolution of Surface 4
figure(7)
plot(time/Spacecraft.orbit.T, Thermal.Ts4,'Color',color{4},LineWidth=1.5)
grid on, hold on, xlabel('Periods [-]'), ylabel('[K]'), title('Temperature of surface 4')
legend('Ts4')

% Plot the temperature evolution of Surface 5
figure(8)
plot(time/Spacecraft.orbit.T, Thermal.Ts5,'Color',color{5},LineWidth=1.5)
grid on, hold on, xlabel('Periods [-]'), ylabel('[K]'), title('Temperature of surface 5')
legend('Ts5')

% Plot the temperature evolution of Surface 6
figure(9)
plot(time/Spacecraft.orbit.T, Thermal.Ts6,'Color',color{6},LineWidth=1.5)
grid on, hold on, xlabel('Periods [-]'), ylabel('[K]'), title('Temperature of surface 6')
legend('Ts6')

% Plot the temperature evolution of the Propulsion unit
figure(10)
plot(time/Spacecraft.orbit.T, Thermal.Tprop,'Color',color{7},LineWidth=1.5)
grid on, hold on, xlabel('Periods [-]'), ylabel('[K]'), title('Temperature of the propulsion unit')
legend('Tprop')

% Plot the temperature evolution of the EPS
figure(11)
plot(time/Spacecraft.orbit.T, Thermal.Teps,'Color',color{8},LineWidth=1.5)
grid on, hold on, xlabel('Periods [-]'), ylabel('[K]'), title('Temperature of the EPS')
legend('Teps')

% Plot the temperature evolution of the Payload
figure(12)
plot(time/Spacecraft.orbit.T, Thermal.Tpl,'Color',color{1},LineWidth=1.5)
grid on, hold on, xlabel('Periods [-]'), ylabel('[K]'), title('Temperature of the payload')
legend('Tpl')

% Plot the temperature evolution of the Antenna
figure(13)
plot(time/Spacecraft.orbit.T, Thermal.Tant,'Color',color{2},LineWidth=1.5)
grid on, hold on, xlabel('Periods [-]'), ylabel('[K]'), title('Temperature of the antenna')
legend('Tant')

% Plot the temperature evolution of the first SP surface
figure(14)
plot(time/Spacecraft.orbit.T, Thermal.Tsp1,'Color',color{3},LineWidth=1.5)
grid on, hold on, xlabel('Periods [-]'), ylabel('[K]'), title('Temperature of the SP surface 1')
legend('Tsp1')

% Plot the temperature evolution of the second SP surface
figure(15)
plot(time/Spacecraft.orbit.T, Thermal.Tsp2,'Color',color{4},LineWidth=1.5)
grid on, hold on, xlabel('Periods [-]'), ylabel('[K]'), title('Temperature of the SP surface 2')
legend('Tsp2')

% Plot the temperature evolution of the third SP surface
figure(16)
plot(time/Spacecraft.orbit.T, Thermal.Tsp3,'Color',color{4},LineWidth=1.5)
grid on, hold on, xlabel('Periods [-]'), ylabel('[K]'), title('Temperature of the SP surface 3')
legend('Tsp3')

% Plot the temperature evolution of the fourth SP surface
figure(17)
plot(time/Spacecraft.orbit.T, Thermal.Tsp4,'Color',color{5},LineWidth=1.5)
grid on, hold on, xlabel('Periods [-]'), ylabel('[K]'), title('Temperature of the SP surface 4')
legend('Tsp4')

% Plot eclipse step function
figure(18)
plot(time/Spacecraft.orbit.T, Orbit.eclipse,'Color',color{6},LineWidth=1.5)
grid on, hold on, xlabel('Periods [-]'), ylabel('[-]'), title('Eclipse')
ylim([-.1, 1.1])

% Plot the cosine of the angle between the faces normal and the sun direction
figure(19)
plot(time/Spacecraft.orbit.T, Orbit.cth(:,1),'Color',color{1},LineWidth=1.5)
grid on, hold on, xlabel('Periods [-]'), ylabel('[-]'), title('Cosine of surface normal angle with Sun direction')
plot(time/Spacecraft.orbit.T, Orbit.cth(:,2),'Color',color{2},LineWidth=1.5)
plot(time/Spacecraft.orbit.T, Orbit.cth(:,3),'Color',color{3},LineWidth=1.5)
plot(time/Spacecraft.orbit.T, Orbit.cth(:,4),'Color',color{4},LineWidth=1.5)
plot(time/Spacecraft.orbit.T, Orbit.cth(:,5),'Color',color{5},LineWidth=1.5)
plot(time/Spacecraft.orbit.T, Orbit.cth(:,6),'Color',color{6},LineWidth=1.5)
plot(time/Spacecraft.orbit.T, Orbit.cth(:,7),'Color',color{7},LineWidth=1.5)
plot(time/Spacecraft.orbit.T, Orbit.cth(:,8),'Color',color{8},LineWidth=1.5)
plot(time/Spacecraft.orbit.T, Orbit.cth(:,9),'Color','g',LineWidth=1.5)
plot(time/Spacecraft.orbit.T, Orbit.cth(:,10),'Color','y',LineWidth=1.5)
legend('cos1','cos2','cos3','cos4','cos5','cos6','cosp1','cosp2','cosp3','cosp4')

% Plot the angle between the faces normal and sun direction
figure(20)
plot(time/Spacecraft.orbit.T, Orbit.theta(:,1),'Color',color{1},LineWidth=1.5)
grid on, hold on, xlabel('Periods [-]'), ylabel('[rad]'), title('Normal angle with Sun direction')
plot(time/Spacecraft.orbit.T, Orbit.theta(:,2),'Color',color{2},LineWidth=1.5)
plot(time/Spacecraft.orbit.T, Orbit.theta(:,3),'Color',color{3},LineWidth=1.5)
plot(time/Spacecraft.orbit.T, Orbit.theta(:,4),'Color',color{4},LineWidth=1.5)
plot(time/Spacecraft.orbit.T, Orbit.theta(:,5),'Color',color{5},LineWidth=1.5)
plot(time/Spacecraft.orbit.T, Orbit.theta(:,6),'Color',color{6},LineWidth=1.5)
plot(time/Spacecraft.orbit.T, Orbit.theta(:,7),'Color',color{7},LineWidth=1.5)
plot(time/Spacecraft.orbit.T, Orbit.theta(:,8),'Color',color{8},LineWidth=1.5)
plot(time/Spacecraft.orbit.T, Orbit.theta(:,9),'Color','g',LineWidth=1.5)
plot(time/Spacecraft.orbit.T, Orbit.theta(:,10),'Color','y',LineWidth=1.5)
legend('teta1','teta2','teta3','teta4','teta5','teta6','tetap1','tetap2','tetap3','tetap4')

% Plot the lowest and highest temperature values for each node, with their
% operative limits and margins
index = 1:1:Spacecraft.params.NS+4;

figure(21)
ymin = [min(Thermal.Ts1)-273.15, min(Thermal.Ts2)-273.15, min(Thermal.Ts3)-273.15, min(Thermal.Ts4)-273.15,...
    min(Thermal.Ts5)-273.15, min(Thermal.Ts6)-273.15, min(Thermal.Tsp1)-273.15, min(Thermal.Tsp1)-273.15,...
    min(Thermal.Tsp3)-273.15, min(Thermal.Tsp4)-273.15, min(Thermal.Tprop)-273.15, min(Thermal.Teps)-273.15,...
    min(Thermal.Tpl)-273.15, min(Thermal.Tant)-273.15];
ymax = [max(Thermal.Ts1)-273.15, max(Thermal.Ts2)-273.15, max(Thermal.Ts3)-273.15, max(Thermal.Ts4)-273.15,...
    max(Thermal.Ts5)-273.15, max(Thermal.Ts6)-273.15, max(Thermal.Tsp1)-273.15, max(Thermal.Tsp1)-273.15,...
    max(Thermal.Tsp3)-273.15, max(Thermal.Tsp4)-273.15, max(Thermal.Tprop)-273.15, max(Thermal.Teps)-273.15,...
    max(Thermal.Tpl)-273.15, max(Thermal.Tant)-273.15];

plot([index(1), index(1)], [ymax(1), ymin(1)], 'LineWidth',10)
grid on, hold on
plot([index(2), index(2)], [ymax(2), ymin(2)], 'LineWidth',10)
plot([index(3), index(3)], [ymax(3), ymin(3)], 'LineWidth',10)
plot([index(4), index(4)], [ymax(4), ymin(4)], 'LineWidth',10)
plot([index(5), index(5)], [ymax(5), ymin(5)], 'LineWidth',10)
plot([index(6), index(6)], [ymax(6), ymin(6)], 'LineWidth',10)
plot([index(7), index(7)], [ymax(7), ymin(7)], 'LineWidth',10)
plot([index(8), index(8)], [ymax(8), ymin(8)], 'LineWidth',10)
plot([index(9), index(9)], [ymax(9), ymin(9)], 'LineWidth',10)
plot([index(10), index(10)], [ymax(10), ymin(10)], 'LineWidth',10)
plot([index(11), index(11)], [ymax(11), ymin(11)], 'LineWidth',10)
plot([index(12), index(12)], [ymax(12), ymin(12)], 'LineWidth',10)
plot([index(13), index(13)], [ymax(13), ymin(13)], 'LineWidth',10)
plot([index(14), index(14)], [ymax(14), ymin(14)], 'LineWidth',10)
ylabel('Temperature [C]'), title('Temperature range of the nodes')

nodes = {'S1', 'S2', 'S3', 'S4', 'S5', 'S6', 'SP1', 'SP2', 'SP3', 'SP4', 'Prop', 'Eps', 'PL', 'Ant'};
set(gca, 'xtick', index, 'xticklabel', nodes, 'TickLabelInterpreter', 'latex')
xlim([0, length(index)]), ylim([min(ymin)-20, max(ymax)+20])

end