function [route,numExpanded] = AStarGrid (input_map, start_coords, dest_coords)
% Run A* algorithm on a grid.
% Inputs : 
%   input_map : a logical array where the freespace cells are false or 0 and
%   the obstacles are true or 1
%   start_coords and dest_coords : Coordinates of the start and end cell
%   respectively, the first entry is the row and the second the column.
% Output :
%    route : An array containing the linear indices of the cells along the
%    shortest route from start to dest or an empty array if there is no
%    route. This is a single dimensional vector
%    numExpanded: Remember to also return the total number of nodes
%    expanded during your search. Do not count the goal node as an expanded node. 

% set up color map for display
% 1 - white - clear cell
% 2 - black - obstacle
% 3 - red = visited
% 4 - blue  - on list
% 5 - green - start
% 6 - yellow - destination

cmap = [1 1 1; ...
    0 0 0; ...
    1 0 0; ...
    0 0 1; ...
    0 1 0; ...
    1 1 0; ...
    0.5 0.5 0.5];

colormap(cmap);

% variable to control if the map is being visualized on every
% iteration
drawMapEveryTime = true;

[nrows, ncols] = size(input_map);

% map - a table that keeps track of the state of each grid cell
map = zeros(nrows,ncols);

map(~input_map) = 1;   % Mark free cells
map(input_map)  = 2;   % Mark obstacle cells

% Generate linear indices of start and dest nodes
start_node = sub2ind(size(map), start_coords(1), start_coords(2));
dest_node  = sub2ind(size(map), dest_coords(1),  dest_coords(2));

map(start_node) = 5;
map(dest_node)  = 6;

% meshgrid will `replicate grid vectors' nrows and ncols to produce
% a full grid
% type `help meshgrid' in the Matlab command prompt for more information
parent = zeros(nrows,ncols);

% 
[X, Y] = meshgrid (1:ncols, 1:nrows);

xd = dest_coords(1);
yd = dest_coords(2);

% Evaluate Heuristic function, H, for each grid cell
% Manhattan distance
H = abs(X - xd) + abs(Y - yd);
H = H';
% Initialize cost arrays

f = Inf(nrows,ncols);    % Node's g value + heuristic H(node)
                         % sum of the distance between the node and the start and 
                         % the estimate for how much distance is left to go between
                         % that node and the goal location.



g = Inf(nrows,ncols);    % Distance between the current node and the start location.
                         % For start_node, of course, it's 0

g(start_node) = 0;    

f(start_node) = H(start_node);

% keep track of the number of nodes that are expanded
numExpanded = 0;

% Main Loop

while true
    
    % Draw current map
    map(start_node) = 5;
    map(dest_node) = 6;
    
    % make drawMapEveryTime = true if you want to see how the 
    % nodes are expanded on the grid. 
    if (drawMapEveryTime)
        image(1.5, 1.5, map);
        grid on;
        axis image;
        drawnow;
    end
    
    % Find the node with the minimum f value
    [min_f, current] = min(f(:));
    
    if ((current == dest_node) || isinf(min_f))
        break;
    end;
    
    % Update input_map
    map(current) = 3;
    f(current) = Inf; % remove this node from further consideration
    
    % Compute row, column coordinates of current node
    [i, j] = ind2sub(size(f), current);
    
    % *********************************************************************
    % ALL YOUR CODE BETWEEN THESE LINES OF STARS
    % Visit all of the neighbors around the current node and update the
    % entries in the map, f, g and parent arrays
    %
    
    % north—if it exists
    
    if (i-1) > 0

        north = sub2ind(size(map),i-1,j);
        
        if map(north) ~= 3 && map(north) ~= 2 && map(north) ~= 5
            
            
            if g(north) > g(current) + 1
                g(north) = g(current) + 1;
                f(north) = g(north) + H(north);
                parent(north) = current;
                map(north) = 4;
            end

        end
    end
    
    % south—if it exists
    
    if (i+1) < 11

        south = sub2ind(size(map),i+1,j);
        
        if map(south) ~= 3 && map(south) ~= 2 && map(south) ~= 5
            
            
            if g(south) > g(current) + 1
                g(south) = g(current) + 1;
                f(south) = g(south) + H(south);
                parent(south) = current;
                map(south) = 4;
            end

        end
    end
    
    % west—if it exists
    
    if (j-1) > 0

        west = sub2ind(size(map),i,j-1);
        
        if map(west) ~= 3 && map(west) ~= 2 && map(west) ~= 5
            
            
            if g(west) > g(current) + 1
                g(west) = g(current) + 1;
                f(west) = g(west) + H(west);
                parent(west) = current;
                map(west) = 4;
            end

        end
    end
    
    % east—if it exists
    
    if (j+1) < 11

        east = sub2ind(size(map),i,j+1);
        
        if map(east) ~= 3 && map(east) ~= 2 && map(east) ~= 5
            
            
            if g(east) > g(current) + 1
                g(east) = g(current) + 1;
                f(east) = g(east) + H(east);
                parent(east) = current;
                map(east) = 4;
            end

        end
    end
    
    numExpanded = numExpanded + 1;
    
    %*********************************************************************
    
    
end

%% Construct route from start to dest by following the parent links
if (isinf(f(dest_node)))
    route = [];
else
    route = [dest_node];
    
    while (parent(route(1)) ~= 0)
        route = [parent(route(1)), route];
    end

    % Snippet of code used to visualize the map and the path
    for k = 2:length(route) - 1        
        map(route(k)) = 7;
        pause(0.1);
        image(1.5, 1.5, map);
        grid on;
        axis image;
    end
end

end
