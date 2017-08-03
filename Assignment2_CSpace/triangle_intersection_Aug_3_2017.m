function flag = triangle_intersection(P1, P2)
% triangle_test : returns true if the triangles overlap and false otherwise
% P1, P2: a 3 rows by 2 columns array (each), describing the vertices of a triangle,
% the first column corresponds to the x coordinates while the second column
% corresponds to the y coordinates.
% flag: Return value for the function, set to true if it determines that the
% triangles do intersect and false otherwise.

%%% All of your code should be between the two lines of stars.
% *******************************************************************


% In P1
% x1 P1(1,1)      y1  P1(1,2)
% x2 P1(2,1)      y2  P1(2,2)
% x3 P1(3,1)      y3  P1(3,2)

% x and y rotate through all vertices in P2 so x is P2(i,1) and y is P2(i,2)

% d=(x−x1)(y2−y1)−(y−y1)(x2−x1)
% d=(x−x2)(y3−y2)−(y−y2)(x3−x2)
% d=(x−x1)(y3−y1)−(y−y1)(x3−x1)


for i=1:3
    
    
    a = ((P2(i,1)-P1(1,1))*(P1(2,2)-P1(1,2))) - ((P2(i,2)-P1(1,2))*(P1(2,1)-P1(1,1)));
    b = ((P2(i,1) - P1(2,1))*(P1(3,2) - P1(2,2))) - ((P2(i,2) - P1(2,2))*(P1(3,1) - P1(2,1)));
    c = ((P2(i,1)-P1(1,1))*(P1(3,2)-P1(1,2))) - ((P2(i,2)-P1(1,2))*(P1(3,1)-P1(1,1)));

    if a > 0 & b > 0 & c > 0
        flag = true;
    else flag = false;
    end
    
end


% *******************************************************************
end