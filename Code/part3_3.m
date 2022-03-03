%% Sinusodial response
vIn = ones(1,1000); 
x = zeros(2,1000);

R = 100;
L = 1*10^-1;
C = 1e-7;
f = 1000;
h = 1/192000;

for t = 1:1000
    vIn(t)=sin(2*pi*f*t*h);
    x(:,t+1) = [1 h/C ; -h/L 1-(h*R)/L ] * x(:,t) + [0;h/L]*vIn(t);

end
%soundsc(x(1,:));

%plot
figure();


v = x(1,:)';
i = x(2,:)';
plot(h*(1:t), v(1:t));
hold on;
plot(h*(1:t), vIn(1:t));
title("Sinusodial Output");
legend('V','vIn')
