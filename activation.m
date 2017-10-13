%% Copyright (C) 2017 David Viana
% 
% This program is free software; you can redistribute it and/or modify it
% under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

% -*- texinfo -*- 
% @deftypefn {Function File} {@var{retval} =} activation (@var{input1}, @var{input2})
%
% @seealso{}
% @end deftypefn

% Author: David Viana <david@asusx>
% Created: 2017-10-03

function [ativ, deriv] = activation (data, func)

    switch func
        case 'log'
            ativ = 1 ./ (1 + exp(-data));
            deriv = ativ.*(1-ativ);
        
        case 'deg'
            if data >= 0
                ativ = 1;
            else
                ativ = 0;
            end
            deriv = 1;
            
        case 'lin'
            ativ = data;
            deriv = 1;
        
        case 'tgh'
            ativ = (1 - exp(-data)) ./ (1 + exp(-data));
            deriv = 0.5.*(1-(ativ.^2));
    end

end
