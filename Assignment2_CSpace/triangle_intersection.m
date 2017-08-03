function flag = triangle_intersection(P1, P2)
% triangle_test : returns true if the triangles overlap and false otherwise
% P1, P2: a 3 rows by 2 columns array (each), describing the vertices of a triangle,
% the first column corresponds to the x coordinates while the second column
% corresponds to the y coordinates.
% flag: Return value for the function, set to true if it determines that the
% triangles do intersect and false otherwise.

%%% All of your code should be between the two lines of stars.
% *******************************************************************

% See http://blackpawn.com/texts/pointinpoly/default.html

x11 = P1(1,1);
y11 = P1(1,2);
x12 = P1(2,1);
y12 = P1(2,2);
x13 = P1(3,1);
y13 = P1(3,2);


A1 = [x11,y11];
B1 = [x12,y12];
C1 = [x13,y13];

x21 = P2(1,1);
y21 = P2(1,2);
x22 = P2(2,1);
y22 = P2(2,2);
x23 = P2(3,1);
y23 = P2(3,2);


A2 = [x21,y21];
B2 = [x22,y22];
C2 = [x23,y23];



function sameSide(Q1,Q2,F,G) % p1, p2, a, b
    CP1 = cross(G-F,Q1-F);
    CP2 = cross(G-F,Q2-F);
    
    if cross(CP1,CP2) >= 0
        sameflag = true;
    end
end

function PointInTriangle(p,A1,B1,C1)
    if SameSide(p,a, b,c) and SameSide(p,b, a,c)
        and SameSide(p,c, a,b) then return true
    else return false

% *******************************************************************
end