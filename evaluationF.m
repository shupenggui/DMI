function [ SN,SP,ACC,Fmeasure,MCC,AUC ] = evaluationF( A0,gsd,BgNet,N )
%   A0  : recovery gene network
%   gsd : ground truth N-by-N
%   BgNet: Background network N-by-N
%   N: Size of network
seq1 = TopNinMatrix(abs(A0),sum(sum(gsd)));
MAP = sparse(seq1(:,2),seq1(:,3),ones(1,length(seq1)),N,N);

%AUC
[xx,yy,tt,AUC] = perfcurve(gsd(BgNet == 1),MAP(BgNet == 1),1);

%SN
TPMatrix = zeros(N,N);%True positive
TPMatrix((MAP > 0) & (gsd == 1)) = 1;
FNMatrix = zeros(N,N);%False negative
FNMatrix((MAP == 0) & (gsd == 1)) = 1;
TP = sum(sum(TPMatrix));
FN = sum(sum(FNMatrix));

SN = TP/(TP+FN);
%SP
TNMatrix = zeros(N,N);%True Negative
TNMatrix((MAP == 0)&(gsd == 0)&(BgNet == 1)) = 1;
FPMatrix = zeros(N,N);%False Positive
FPMatrix((MAP == 1)&(gsd == 0)) = 1;

TN = sum(sum(TNMatrix));
FP = sum(sum(FPMatrix));

SP = TN/(TN+FP);
% fprintf('SP is %f\n', SP);


%ACC
ACC = (TP+TN)/(TP+TN+FN+FP);
% fprintf('ACC is %f\n', ACC);


%F-measure
Fmeasure = 2*(SN*SP)/(SN+SP);
% fprintf('Fmeasure is %f\n', Fmeasure);


%MCC
MCC = (TP * TN - FP * FN)/sqrt((TP+FN)*(TP+FP)*(TN+FP)*(TN+FN));

% fprintf('MCC is %f\n', MCC);

end

