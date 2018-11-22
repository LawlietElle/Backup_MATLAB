function [v1,v2,v3] = Graam_Schmidt(u1,u2,u3)
v1=u1/norm(u1);
v2=u2+dot(u2,v1)*v1;
v2=v2/norm(v2);
v3=u3+dot(u3,v1)*v1+dot(u3,v2)*v2;
v3=v3/norm(v3);
end

