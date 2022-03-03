%% Testing
vIn = ones(1,1000); 
x = zeros(2,1000);

R = 1800; % resistance
L = 12e-1; %inductance
C = .05e-6; %current
h = 1/192000;
result = zeros(1,length(10:10:10000));
counter = 1;

for f = 10:10:10000
    for t = 1:200
        %for k = 1:t
        vIn(t)=sin(2*pi*f*t*h); 
        x(:,t+1) = [1 h/C ; -h/L 1-(h*R)/L ] * x(:,t) + [0;h/L]*vIn(t);
        %end 
    end
    result(counter) = norm(x)/norm(vIn);
    counter = counter + 1;
end

soundsc(x(1,:));

%plot
figure();
semilogx(10:10:10000,result);
figure();
plot(10:10:10000, result);

