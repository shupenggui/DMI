function [ D,X ] = ExpressionInput( N,Nexp,exp_file )
% Import gene expression data
%   N is the size of the gene net
%   Nexp is the times of experiments carried by the researcher, for each
%   experiment, whose observation timepoints are all the same.
%   D is the difference matrix between two adjacency time points
%   X is the real gene expression without the level of the last time point

    ts = importdata(exp_file);
    [obsTime, v] = size(ts);
    obsTime = obsTime/Nexp;
% 
    X = cell(1,Nexp);
    D = cell(1,Nexp);
    for i = 1: Nexp
        X{i} = ts((i-1)*obsTime+1:(i-1)*obsTime+5,:)';
        D{i} = ts((i-1)*obsTime+2:i*obsTime,:)' -ts((i-1)*obsTime+1:(i-1)*obsTime+5,:)';
    end
end

