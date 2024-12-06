% MATLAB Script to demonstrate plotting coordinates in spherical, cylindrical, and Cartesian systems

% Example 1: Cartesian Coordinates
x1 = 8; % Starting point x-coordinate
y1 = 6; % Starting point y-coordinate
z1 = 7; % Starting point z-coordinate
x2 = 9; % Ending point x-coordinate
y2 = 5; % Ending point y-coordinate
z2 = 6; % Ending point z-coordinate

u = x2 - x1; % x-component
v = y2 - y1; % y-component
w = z2 - z1; % z-component

% Plotting Cartesian Vector
figure;
quiver3(x1, y1, z1, u, v, w, 'LineWidth', 2);
axis equal;
grid on;
xlabel('X'); ylabel('Y'); zlabel('Z');
title('3D Cartesian Vector');

% Example 2: Cylindrical Coordinates
r = 5; % Radial distance
theta = pi/4; % Azimuthal angle
z_cyl = 7; % Height

% Convert Cylindrical to Cartesian for plotting
x_cyl = r * cos(theta);
y_cyl = r * sin(theta);

% Create a cylinder for visualization
theta_c = linspace(0, 2*pi, 100);
z_c = linspace(0, z_cyl, 50);
[Theta_c, Z_c] = meshgrid(theta_c, z_c);
X_c = r * cos(Theta_c);
Y_c = r * sin(Theta_c);

% Plotting Cylindrical Coordinate System
figure;
hold on;
surf(X_c, Y_c, Z_c, 'FaceAlpha', 0.3, 'EdgeColor', 'none'); % Draw cylinder
plot3([0, x_cyl], [0, y_cyl], [0, z_cyl], 'r', 'LineWidth', 2); % Radial line
plot3([0, x_cyl], [0, y_cyl], [0, 0], 'g--', 'LineWidth', 1.5); % Projection on XY-plane
plot3([x_cyl, x_cyl], [y_cyl, y_cyl], [0, z_cyl], 'b--', 'LineWidth', 1.5); % Projection on Z-axis
scatter3(x_cyl, y_cyl, z_cyl, 100, 'k', 'filled'); % Point in cylindrical coordinates
grid on;
xlabel('X'); ylabel('Y'); zlabel('Z');
title('Cylindrical Coordinate System');
text(x_cyl, y_cyl, z_cyl, ' Point (x, y, z)', 'FontSize', 12, 'Color', 'k');
view(3);
axis equal;

% Example 3: Spherical Coordinates
rho = 5; % Radial distance
theta_sph = pi/4; % Azimuthal angle
phi = pi/6; % Polar angle

% Convert Spherical to Cartesian for plotting
x_sph = rho * sin(phi) * cos(theta_sph);
y_sph = rho * sin(phi) * sin(theta_sph);
z_sph = rho * cos(phi);

% Create a sphere for visualization
[phi_s, theta_s] = meshgrid(linspace(0, pi, 50), linspace(0, 2*pi, 100));
x_s = rho * sin(phi_s) .* cos(theta_s);
y_s = rho * sin(phi_s) .* sin(theta_s);
z_s = rho * cos(phi_s);

% Plotting Spherical Coordinate System
figure;
hold on;
surf(x_s, y_s, z_s, 'FaceAlpha', 0.3, 'EdgeColor', 'none'); % Draw sphere
plot3([0, x_sph], [0, y_sph], [0, z_sph], 'r', 'LineWidth', 2); % Radial line
plot3([0, x_sph], [0, y_sph], [0, 0], 'g--', 'LineWidth', 1.5); % Projection on XY-plane
plot3([x_sph, x_sph], [y_sph, y_sph], [0, z_sph], 'b--', 'LineWidth', 1.5); % Projection on Z-axis
scatter3(x_sph, y_sph, z_sph, 100, 'k', 'filled'); % Point in spherical coordinates
grid on;
xlabel('X'); ylabel('Y'); zlabel('Z');
title('Spherical Coordinate System');
text(x_sph, y_sph, z_sph, ' Point (x, y, z)', 'FontSize', 12, 'Color', 'k');
view(3);
axis equal;
