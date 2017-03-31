function [ total_r,counter_s,Q,Model ] = algo_main( maxsteps,Q,Model,alpha,gamma,epsilon,state_l,actionlist,grafic,maze,start,goal,p_steps)

x            = start;
counter_s        = 0;
total_r = 0;

[d  s] = min(dist(state_l,x'));

nactions = size(Q,2);

if (rand()>epsilon) 
    	[v idx] = sort(Q(s,:),'descend');
	x = diff(v);
	i = find(x,1);

	if isempty(i)
	    a = randi(nactions);
	else
	    j = randi(i);
	    a = idx(j);
	end
else
    a = randi(nactions);
end

for i=1:maxsteps    
        
    action = actionlist(a);    
    
    xp  = act( action , x, maze );    
    
    if ( xp==goal) 
    	r = 1;
    	f = true;
    else
    	r = 0;   
    	f = false;
    end

    total_r = total_r + r;
    
    [td ts]  =  min(dist(state_l,xp')); 
    sp = ts;
    
    nactions = size(Q,2);

    if (rand()>epsilon) 
	    ap = best_action(Q,sp);    
    else
	    ap = randi(nactions);
    end

    TD_error =   ((r + gamma*max(Q(sp,:))) - Q(s,a));
    Q(s,a) =  Q(s,a) + alpha * TD_error;
    
    Model(s,a,1) = sp;
    Model(s,a,2) = r;

    Q = hypo_planning(Q, Model, p_steps, alpha, gamma);
   
    s = sp;
    a = ap;
    x = xp;
    
    counter_s=counter_s+1;
    

    if (grafic==true)
        plot_world( x,a,counter_s,maze,start,goal,'Grid world Display');
    end
    
    if (f==true)
        break
    end
    
    
end

