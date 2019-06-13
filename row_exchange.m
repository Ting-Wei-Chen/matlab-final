function new=row_exchange(old,x,y)
temp=old(x,:);
old(x,:)=old(y,:);
old(y,:)=temp;
new=old;
end
