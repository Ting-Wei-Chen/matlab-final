function [L,U,P]=lu_decomposition(old)
[row,col]=size(old);
L=eye(row);
P=eye(row);

for i=1:1:row
    if old(i,1) ~=0
        old=row_exchange(old,1,i);
        P=row_exchange(P,1,i);
        break
    end
end

for i=1:1:row-1
    for j=1:1:col
        if old(i,j)~=0
            for k=i+1:1:row
                temp=old(k,j)/old(i,j);
                old=add(old,i,k,-temp);
                L=add(L,i,k,-temp);
            end
            break
        end
    end
end
L=inv(L);
U=old;
end