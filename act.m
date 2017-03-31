function [ posp ] = act( action, pos,maze )

x = pos(1);
y = pos(2); 

[N M] = size(maze);


x_max = N-1; 
x_min = 0;
y_max = M-1; 
y_min = 0;

 
if (action==1)
    y = y + 1;
elseif (action==2)
    x = x + 1;
elseif (action==3)
    y = y - 1;
elseif (action==4)
    x = x - 1;
end

x = min(x_max,x);
x = max(x_min,x);

y = min(y_max,y);
y = max(y_min,y);

if maze(x+1,y+1)==1
    x = pos(1);
    y = pos(2); 
end

posp=[x y];







