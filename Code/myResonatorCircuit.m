%% Case study 3: Circuits as Resonators, Sensors, and Filters
% *ESE 105* 
%
% *Name: Max, Robert, Ben*
%
% function myResonatorCircuit(Vin,h) receives a time-series voltage sequence
% sampled with interval h, and returns the output voltage sequence produced
% by a circuit
%
% inputs:
% Vin - time-series vector representing the voltage input to a circuit
% h - scalar representing the sampling interval of the time series in
% seconds
%
% outputs:
% Vout - time-series vector representing the output voltage of a circuit

function Vout = myResonatorCircuit(Vin,h)

x = zeros(2,960000);
C = 1e-7; % current
R = .5e2; % resistance
L = .9255; % inductance 

%run the circuit for approximately 5 seconds
for t = 1:960000
    x(:,t+1) = [1 h/C ; -h/L 1-h*R/L] * x(:,t) + [0;h/L]*Vin(t);
    
end
Vout = x(1,:)';

end
