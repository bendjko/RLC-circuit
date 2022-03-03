%task 1.1

%set up the needed values
R = 1e3;
C = 1e-6;
h = 0.00001;
vCInit = 0;
vRInit = 0;
vIn = ones(1,1000); 
v = zeros(2,1000); 
v(:,1) = [vRInit; vCInit];

% simulate the system
for k=1:999
    v(:,k+1) = [0 -(1-(h/(R*C))); 0 (1-(h/(R*C)))]*v(:,k) + [h/(R*C)-1; h/(R*C)]*vIn(k);
end
%plot the simulation
figure;
plot(h.*(1:k+1),v(2,:));
xlabel('Time (s)');
ylabel('v_C (V)');
title('Voltage across Capacitor, h = 1e-05');

%% task 1.2

%make a few h values to simulate
hVals = [.1, .01, .001, .0001, .00001, .000001];
for i = 1:6
h = hVals(i);
%reset v 
v = zeros(2,1000); 
v(:,1) = [vRInit; vCInit];

% simulate the system
for k=1:999
    v(:,k+1) = [0 -(1-(h/(R*C))); 0 (1-(h/(R*C)))]*v(:,k) + [h/(R*C)-1; h/(R*C)]*vIn(k);
end

%plot the simulation
figure;
plot(h.*(1:k+1),v(2,:));
xlabel('Time (s)');
ylabel('v_C (V)');
title('Voltage across Capacitor, h = ', num2str(h));

end
%% task 1.3
%reset v
v = zeros(2,1000); 
v(:,1) = [vRInit; vCInit];

%plot with accrate h
h = .00001;
% simulate the system
for k=1:999
    v(:,k+1) = [0 -(1-(h/(R*C))); 0 (1-(h/(R*C)))]*v(:,k) + [h/(R*C)-1; h/(R*C)]*vIn(k);
end
%plot the simulation
figure;
plot(h.*(1:k+1),v(2,:));
xlabel('Time (s)');
ylabel('v_C (V)');
title('Voltage across Capacitor, accurate h, h = 1e-05');

%plot with an inaccurate h
h = .01;

%reset v
v = zeros(2,1000); 
v(:,1) = [vRInit; vCInit];
% simulate the system
for k=1:999
    v(:,k+1) = [0 -(1-(h/(R*C))); 0 (1-(h/(R*C)))]*v(:,k) + [h/(R*C)-1; h/(R*C)]*vIn(k);
end
%plot the simulation
figure;
plot(h.*(1:k+1),v(2,:));
xlabel('Time (s)');
ylabel('v_C (V)');
title('Voltage across Capacitor,, inaccurate h, h = 1e-02');

%run and plot theoretical charge curve

t = 0:1e-6:.1;
%plot
figure;
plot(t, 1-exp(-t/(R*C)));
xlabel('Time (s)');
ylabel('v_C (V)');
title('Voltage across Capacitor, predicted');
