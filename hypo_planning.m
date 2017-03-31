function Q = hypo_planning(Q, Model, steps, alpha, gamma )

[s_list a_list] = find(Model(:,:,1));

for j=1:steps
    %random index over s_list
    i = randi(numel(s_list));

    % random previously visited state
    s = s_list(i);
    % random action previously taken at state s
    a = a_list(i);

    sp  = Model(s,a,1);    
    r   = Model(s,a,2);    
    
    
    TD_error =   ((r + gamma*max(Q(sp,:))) - Q(s,a));
    Q(s,a) =  Q(s,a) + alpha * TD_error;
    
end
end
