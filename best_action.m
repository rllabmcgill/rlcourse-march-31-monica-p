function [ a ] = best_action( Q, s )

nactions=size(Q,2);

[v index]    = sort(Q(s,:),'descend');
x = diff(v);
m = find(x,1);

if isempty(m)
    a = randi(nactions);
else
    
    n = randi(m);
    a = index(n);
end

end