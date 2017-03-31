clc
%stops at optimum steps.
maxepisodes = 1000;
nrows = 9;
ncols = 6;

start = [0 3];
goal = [8 5];

maze_world = zeros(nrows,ncols);

%ADD WALLS
maze_world(3,1:3) = 1;
maze_world(6,2)   = 1;
maze_world(5:6,4:5) = 1;
maze_world(8,4:6) = 1;

x1  = 0:nrows-1;
x2  = 0:ncols-1;

s_list = all_combo(x1,x2);
a_list = [1 ; 2 ; 3 ; 4];

n_s     = size(s_list,1);
n_a    = size(a_list,1);

Q = zeros(n_s,n_a);
Model = zeros(n_s,n_a,2);

planning_steps     = 50;

maxsteps    = 2000;  
alpha       = 0.1;   
gamma       = 0.95;  
epsilon     = 0.1;   


%activate_disp = false; 
activate_disp = true;
xpoints=[];
ypoints=[];


for i=1:maxepisodes    
    
    
    [total_reward,steps,Q,Model ] =  algo_main( maxsteps, Q, Model , alpha, gamma,epsilon,s_list,a_list,activate_disp,maze_world,start,goal,planning_steps ) ;  
    
    disp(['Steps:',int2str(steps),'  Reward:',num2str(total_reward)])
    
    drawnow
    
    if (i>2000000)
        activate_disp=true;
    end
end

