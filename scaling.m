function new=scaling(old,row,multi)
old(row,:)=old(row,:)*multi;
new=old;
end