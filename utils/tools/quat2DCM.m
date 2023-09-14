function A = quat2DCM(q)
%
% 1. PROTOTYPE:
% A = quat2A(q)
%
% 2. DESCRIPTION:
% Function computes director cosine matrix (DCM) from the quaterion q
%   q = [(q1,q2,q3),q4] with q4 being scalar part
%
% 3. INPUT  SIZE   UNITS   DESCRIPTION
% q         [4,1]  [-]     Attitude quaternion between inertial and body frame
%
% 4. OUTPUT SIZE   UNITS   DESCRIPTION
% A         [3,3]  [-]     Director cosine matrix between inertial and body frame
%
% 5. CHANGELOG
% 26/02/2023 - Matteo D'Ambrosio - Created function
% 26/02/2023 - Matteo D'Ambrosio - Validated function
%
% 6. DEPENDENCIES
% -None
%
A = (q(4)^2 - q(1:3)'*q(1:3))*eye(3) + 2*q(1:3)*q(1:3)' - 2*q(4) * [  0,    -q(3),  q(2) ; ...
                                                                      q(3),  0,    -q(1) ; ...
                                                                     -q(2),  q(1),  0 ] ;
 
end

