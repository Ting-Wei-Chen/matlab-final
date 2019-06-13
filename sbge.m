function x=sbge(A,b)
[row,col]=size(A);
aug_A=[A,b];

for i=1:1:row
    if aug_A(i,1)~=0
        aug_A=row_exchange(aug_A,1,i);
        break
    end
end

for i=1:1:row
    for j=1:1:col
        if aug_A(i,j)~=0
            aug_A=scaling(aug_A,i,1/aug_A(i,j));
            if i ~=row
                for k=i+1:1:row
                    aug_A=add(aug_A,i,k,-aug_A(k,j));
                end
            end
            if i>1
                for k=1:1:i-1
                    aug_A=add(aug_A,i,k,-aug_A(k,j));
                end
            end
            
            break
        end
    end
end
x=aug_A(:,col+1);
end
