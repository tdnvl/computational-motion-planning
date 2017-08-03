function flag = triangle_intersection(P1, P2)
% triangle_test : returns true if the triangles overlap and false otherwise
% P1, P2: a 3 rows by 2 columns array (each), describing the vertices of a triangle,
% the first column corresponds to the x coordinates while the second column
% corresponds to the y coordinates.
% flag: Return value for the function, set to true if it determines that the
% triangles do intersect and false otherwise.

%%% All of your code should be between the two lines of stars.
% *******************************************************************

xv = [P2(1,1),P2(2,1),P2(3,1)];
yv = [P2(1,2),P2(2,2),P2(3,2)];

xq = [P1(1,1),P1(2,1),P1(3,1)];
yq = [P1(1,2),P1(2,2),P1(3,2)];

% P1 and P2 are coming from CollisionCheck.m lines 8 and 10 

    for i = 1:3
       
        if inpolygon(xq(i),yq(i),xv,yv) == true
            flag = true;
        else
            flag = false;
        end
        
        % check if edgei.P2 is in P1
        % we can use in = inpolygon(xq,yq,xv,yv)
        % returns in indicating if the query points specified by xq and yq are inside
        % or on the edge of the polygon area defined by xv and yv.
    end

% *******************************************************************
end