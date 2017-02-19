clc;
clear all;
addpath('./data');
addpath('./support');
fprintf('DMI method starts:\n');
N = 100;
Nexp = 1;
% import gene expression data
[D,X] = ExpressionInput(N,Nexp,'100n10perYeast_ts.mat' );
% import gene network ground truth
grdt = GRDTInput(N);
% background knowledge simulator
bgnet = MaskSimSP(grdt,2*N,N);
% parameter settings
param.alpha = 0.08;
param.beta = 0.16;
param.rc = 0.7;
K = 1000; % number of iterations
% Set up experiment
d = D{1};
x = X{1};
A = DMI_admm_core(d,x,N,param,K,bgnet);
fprintf('%s\n','experiment is finished!');
% Evaluation SN SP ACC F-measure MCC AUC
t = zeros(1,6);
[t(1),t(2),t(3),t(4),t(5),t(6)] = evaluationF( A,grdt,bgnet,N );
fprintf('SN: %f\n',t(1));
fprintf('SP: %f\n',t(2));
fprintf('ACC: %f\n',t(3));
fprintf('F-measure: %f\n',t(4));
fprintf('MCC: %f\n',t(5));
fprintf('AUC: %f\n',t(6));

% save results
save(['A',num2str(N),'.mat'],'A');
