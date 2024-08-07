function [rho] = CalculateRho(dist,knn)
    n=size(dist,1);
    rho = ones(n,1);
    for i=1:n
        rho(i) =exp(-sum(dist(i,knn{i}(1:length(knn{i}))))/length(knn{i}));     % 局部密度
    end
%     for i=1:n
%         rho(i) =length(rnn{i})/sum(dist(i,rnn{i}(1:length(rnn{i}))));     %反向最近邻个数与到所有反向最近邻距离之和的比值
%     end
%     k=length(knn{1});    
%     rho=zeros(n,1);
%     du=k*(k+1)/2;
%     for i=1:n
%         for j=1:k
%             rho(knn{i}(j))=rho(knn{i}(j))+j;
%         end
%     end
%     rho=rho/du;
end
