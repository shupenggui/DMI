function [ A ] = lzeroProj( varargin)

%     error(nargchk(2,3,nargin));
    if nargin == 2
        A = varargin{1};
        P = varargin{2};
        copyA = abs(A);
        [Y,I] = sort(copyA,2);
        A(I(1:P)) = 0;
%        disp(A);
%         copyA(copyA == 0) = inf;
%         lower = min(min(copyA));
%         copyA = abs(A);
%         copyA(copyA==0) = 0.1*lower;
%         N = length(A);
%         Mask = sparse(1:N,1:N,zeros(1,N));
%         for k = 1:rc
%             [M,Index] = max(copyA,[],2);            
%              Mask(1:N,Index) = (copyA(1:N,Index)~=0)*1;
%              copyA = copyA.*(~Mask);
%         end
%         A = A.*Mask;
    else
        if nargin == 3;
            A = varargin{1};
            P = varargin{2};
            Q = varargin{3};
            copyA = abs(A);
            [Y,I] = sort(copyA,2);
            N = length(A);
            for i = 1:N
                A(i,I(i,Q(i):P(i)))=0;
            end
%             A(I(Q:P)) = 0;
            
        else 
            if nargin == 4
                A = varargin{1};
%                 rc = varargin{2};
                gsd = varargin{3};
                copyA = abs(A);
                N = length(A);
                P = ceil(sum(gsd,2)*1.3);
                [Y,I] = sort(copyA,2);
                for i = 1:N
                    A(i,I(i,1:N-P(i))) = 0;
                end
            end
        end
    end
            


end

