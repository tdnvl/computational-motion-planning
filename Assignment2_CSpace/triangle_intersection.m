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
z11 = 0;
x12 = P1(2,1);
y12 = P1(2,2);
z12 = 0;
x13 = P1(3,1);
y13 = P1(3,2);
z13 = 0;


P11 = [x11,y11,z11];
P12 = [x12,y12,z12];
P13 = [x13,y13,z13];

x21 = P2(1,1);
y21 = P2(1,2);
z21 = 0;
x22 = P2(2,1);
y22 = P2(2,2);
z22 = 0;
x23 = P2(3,1);
y23 = P2(3,2);
z23 = 0;


P21 = [x21,y21,z21];
P22 = [x22,y22,z22];
P23 = [x23,y23,z23];


    


function sameSide(Q1,Q2,F,G) % p1, p2, a, b
    
    GF = [F(1,:)-G(1,:),F(2,:)-G(2,:),F(3,:)-G(3,:)];
    Q1F = [F(1,:)-Q1(1,:),F(2,:)-Q1(2,:),F(3,:)-Q1(3,:)];
    Q2F = [F(1,:)-Q2(1,:),F(2,:)-Q2(2,:),F(3,:)-Q2(3,:)];
    
    CP1 = cross(GF,Q1F);
    CP2 = cross(GF,Q2F);
    
    if cross(CP1,CP2) >= 0
        sameflag = true;
    end
end

function PointInTriangle(p,a,b,c)
    
    for i=1:3
    
        if sameSide(P2i,P11,P12,P13) && sameSide(P2i,P12,P11,P13) && sameSide(P2i,P13,P11,P12)
            flag = true;
        else flag = false;
        end
        
    end
    
end

% *******************************************************************
end