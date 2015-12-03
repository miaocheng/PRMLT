% Done
% demo for chapter 03
clear; close all;
n = 100;
beta = 1e-1;
X = rand(1,n);
w = randn;
b = randn;
t = w'*X+b+beta*randn(1,n);
x = linspace(min(X)-1,max(X)+1,n);   % test data

% d = 1;
% n = 200;
% [X,t,model] = linRnd(d,n);
% plotBand(X,t,2*model.sigma);
%%
model = linReg(X,t);
y = linPred(model,x);
figure;
hold on;
plot(X,t,'o');
plot(x,y,'r-');
hold off
pause
%%
[model,llh] = linRegEbEm(X,t);
[y, sigma] = linPred(model,x,t);
figure;
hold on;
plotBand(x,y,2*sigma);
plot(X,t,'o');
plot(x,y,'r-');
hold off
figure
plot(llh);
linPlot(model,x,t)
pause
%%
[model,llh] = linRegEbFp(X,t);
[y, sigma] = linPred(model,x,t);
figure;
hold on;
plotBand(x,y,2*sigma);
plot(X,t,'o');
plot(x,y,'r-');
hold off
figure
plot(llh);