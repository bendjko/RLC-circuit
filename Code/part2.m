%% Task 1
clear;
%set up the needed values
R = 1e2;
L = 1*10^-1;
h = 0.0001;
vIn = ones(1,1000); 
i = zeros(2,1000); 
v(:,1) = [0,0];
i(:,1) = [0,0];

for k=1:999
    i(:,k+1) = (1-((h*R)/L))*i(:,k)+(h/L)*vIn(:,k);
    v(:,k) = vIn(k)-i(k);
end
figure;
plot(h.*(1:k),v(2,:));
xlabel('Time (s)');
ylabel('V_L (V)');
title('Inductor');

%% Task 2
% simulate and plot the capacitor against the inductor

%for the capacitator
%set up the needed values
Rc = 1e3;
Cc = 1e-6;
hc = 0.0001;
vCInit = 0;
vRInit = 0;
vIn = ones(1,1000); 
vc = zeros(2,1000); 
vc(:,1) = [vRInit; vCInit];

% simulate the system
for k=1:999
    vc(:,k+1) = [0 -(1-(hc/(Rc*Cc))); 0 (1-(hc/(Rc*Cc)))]*vc(:,k) + [hc/(Rc*Cc)-1; hc/(Rc*Cc)]*vIn(k);
end

%for the inductor
%set up the needed values
R2 = 1e2;
L2 = 1*10^-1;
h2 = 0.0001;
vIn2 = ones(1000); 
i2 = zeros(1000); 
v2 = zeros(1000);
%run the simulation
for k=1:999
    i2(k+1) = (1-((h2*R2)/L2))*i2(k)+(h2/L2)*vIn(k);
    vR(k+1) = i2(k+1) * R2;
    v2(k) = vIn(k)-vR(k);
end

%plot the simulation
figure; 
%for i
plot(h2.*(1:k),v2(1:999,1)');
set(gca, "XLIM", [0, .009]);
hold on;
%for c
plot(h2.*(1:k+1),vc(2,:));
hold off;
xlabel('Time (s)');
ylabel('');
title("Capacitor and Inductor");
legend("Inductor", "Capacitor");