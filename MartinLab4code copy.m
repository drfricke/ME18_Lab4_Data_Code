%% officeHoursCode.m
%
% So rewrite Felix's code for Lab 4 analysis
%
% By: Martin Majkut, Jared, Adolfo, Libby, David, Lorenzo
% Date: Apr. 2, 2020
%

%% Constants
dataFreq   = 50e3;  %[Hz]
speedSound = 344;   %[m/s] = speed of sound
distMics   = .12;   %[m] = distance between mics

%% Read csv files and visualize data
recMicFile  = "L_clap_0_1.csv";
sendMicFile = "r_clap_0_1.csv";

recMicData  = csvread(recMicFile);
sendMicData = csvread(sendMicFile);

x = 1:length(recMicData);
figure(4200); clf;
hold on;
plot(x,recMicData, 'k');
plot(x,sendMicData, 'g');
legend('rec', 'send')

%% Find minimum (can be max if you want to) of data for each mic

[minValRec, iMinValRec]   = min(recMicData);
[minValSend, iMinValSend] = min(sendMicData);

plot(x(iMinValRec), minValRec, 'ro');
plot(x(iMinValSend), minValSend, 'bo');

diffIndex = abs(iMinValRec - iMinValSend);
ITD       = diffIndex / dataFreq;
theta     = asind( (speedSound * ITD) / distMics )