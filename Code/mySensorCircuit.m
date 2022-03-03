%% Case study 3: Circuits as Resonators, Sensors, and Filters
% *ESE 105* 
%
% *Name: Robert, Max, Ben*
%
% function mySensorCircuit(Vin,h) receives a time-series voltage sequence
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

function Vout = mySensorCircuit(Vin,h)
R = 100;
L = 18*10^-1;
C = 19e-7;
time = length(Vin);
x = zeros(2,time);
%run the simulation

for t=1:time

    x(:,t+1) = [1 h/C ; -h/L 1-(h*R)/L ] * x(:,t) + [0;h/L]*Vin(t);
    
end

v = x(1,:)';

Vout = v;
end

