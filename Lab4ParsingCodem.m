% officeHoursCode.m
%
%By David and Martin
%04/02/2020

clear; close all; 

%Get data, only works for single trials
recMicFile = "L_clap_300_3.csv";
sendMicFile = "r_clap_300_3.csv";

recMicData = csvread(recMicFile);
sendMicData = csvread(sendMicFile);


%Should do EVERYTHING - find lag - but doesn't
d = finddelay(sendMicData,sendMicData);
 
%%shifts all the data - assigned Correlations to each lag (chart)
[c, lags] = xcorr(sendMicData,sendMicData);
%stem(lags, c);

%constants
ss = 343;
MicDistance = 0.12;
dataFreq = 50000;

%plot data
x = 1:length(recMicData);
figure(2); clf;
hold on;
plot(x,recMicData,'k')
plot(x,sendMicData, 'g')
xlabel('Seconds, (1/50000)');
legend('rec', 'send');

[minValRec, iMinValRec] =min(recMicData);
[minValSend, iMinValSend] =min(sendMicData);

%solves for theta
diffIndex = iMinValSend - iMinValRec;
ITD = diffIndex/dataFreq;
arguement = (ss*ITD)/MicDistance;
theta = asind(arguement)

%Correlation for angle trends
corrcoef(recMicData,sendMicData)

