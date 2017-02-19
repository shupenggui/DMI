function [ grdt ] = GRDTInput( N )
% This function is going to input the ground truth of our gene network to
% evaluate our reconstruction result.
%   N : size of network
%   grdt: groundtruth network. In which, edges are directed from column
%   index j to row index i

    ngsdfile = fopen(strcat('Yeast',num2str(N),'_goldstandard.tsv'));
    c = textscan(ngsdfile,'%c%d %c%d %d');
    fclose(ngsdfile);
    temp = c{1,5};
    c5 = double(temp(temp~=0));
    temp = c{1,2};
    c2 = double(temp(1:length(c5)));
    temp = c{1,4};
    c4 = double(temp(1:length(c5)));
    grdt = sparse(c4,c2,c5,N,N);
    

end

