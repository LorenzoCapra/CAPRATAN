function OMEGA = skew_symmetric(omega)

% 1. PROTOTYPE:
% OMEGA = skew_symmetric(omega)
%
% 2. DESCRIPTION:
% Given a [3,1] vector omega, this function generates the skew-symmetric
% (otherwise known as antisymmetric) matrix OMEGA such that OMEGA'= -OMEGA.
%
% 3. INPUT  SIZE  UNITS   DESCRIPTION
% omega     [3,1] [rad/s] Angular acceleration vector of body frame with respect
%                         to inertial frame, written in the body frame.
%
% 4. OUTPUT SIZE  UNITS   DESCRIPTION
% OMEGA     [4,4] [rad/s] Skew-symmetric matrix constructed from omega.
%
% 6. DEPENDENCIES
% -None
%

%% Function code

OMEGA = [  0,         omega(3), -omega(2), omega(1)   ; ...
          -omega(3),  0,         omega(1), omega(2)   ; ...
           omega(2), -omega(1),  0,        omega(3)   ; ...
          -omega(1), -omega(2), -omega(3), 0        ] ;

end

