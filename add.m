function new=add(old,x,y,multi)
old(y,:)=old(y,:)+multi*old(x,:);
new=old;
end