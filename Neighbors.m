function [knn,rnn,mnn,distK] = Neighbors(X,k)
% 近邻搜索
    n = size(X,1);
    kdtree = KDTreeSearcher(X,'bucketsize',1); % 1表示选用欧式距离
    [index,d] = knnsearch(kdtree,X,'k',100);% 返回排好序的索引和距离矩阵
    knn = cell(n,1);           %k近邻
    rnn = cell(n,1);           %反向近居
    mnn = cell(n,1); 
    distK=zeros(n,1);
    for i=1:n
        knn{i}(1:k) = index(i,2:k+1);
        distK(i)=d(i,k+1);
        for j = 2:k+1
            rnn{index(i,j)}(end+1) = i;
        end
    end
    for i = 1:n
        for j = 1:k
            if (ismember(knn{i}(j),rnn{i})==1)
                mnn{i}(end+1) = knn{i}(j);
            end
        end
    end
end

