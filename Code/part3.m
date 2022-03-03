%% run 1

%set up the needed values
C = 1e-7; % current
R = .5e2; % resistance
L = 1*10^-2; % inductance
h = 1/192000; % 
t = 20000;
vIn = ones(1,t); 
x = zeros(2,t);

%run the simulation
for k=1:t
    %disp(([1,(h/C); (h/L),1] * [v(k+1); i(k+1)]) + [1;h/L]*vIn(k));
    
   x(:,k+1) = [1 h/C ; -h/L 1-h*R/L] * x(:,k) + [0;h/L]*vIn(k);
end
%soundsc(x(1,:));

%% run 2
%set up the needed values
C2 = 5e-8; % current
R2 = .7e2; % resistance
L2 = 1*10^-2; % inductance
t = 200;
x2 = zeros(2,1000);

%run the simulation
vIn = ones(1,t);
for k=1:t
   x2(:,k+1) = [1 h/C2 ; -h/L2 1-((h*R2)/L2) ] * x2(:,k) + [0;h/L2]*vIn(k);
end
soundsc(x2(1,:));
%% run 3

%set up the needed values
C3 = 1e-7; % current
R3 = .75e2; % resistance
L3 = 1*10^-3; % inductance

t = 200;
x3 = zeros(2,t);
vIn = ones(1,t);
%run the simulation

for k=1:t
   x3(:,k+1) = [1 h/C3 ; -h/L3 1-((h*R3)/L3) ] * x3(:,k) + [0;h/L3]*vIn(k);
end
soundsc(x3(1,:));
%% plot them all
figure(1);
v = x(1,:)';
i = x(2,:)';
plot(h*(1:t), v(1:t));

hold on;
v2 = x2(1,:)';
i2 = x2(2,:)';
plot(h*(1:t), v2(1:t));

v3 = x3(1,:)';
i3 = x3(2,:)';
plot(h*(1:t), v3(1:t));
hold off;

xlabel('Time (s)');
ylabel('Voltage (V)');
title('');
legend('1','2','3');



