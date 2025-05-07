#{

Author: Alina Matchette
 Created: 2025-04-27

 USAGE: for use in the N Queen problem script in the github repo <https://github.com/Alina-Seo/NQueen-project-EE285/tree/main>
 - requires inputs
	- coord: 2 position coordinate array of evaluation position, the queen from the perspective of which the removal of queens from the board using subtractive methods is applied
	- board: the current board state as an NxN matrix
	- both inputs require being valid coordinates and board matrices, must have min value 1,1 and max n,n
 - outputs
	- returns updated matrix when called, after subtractive method is applied
 - dependencies: none
 - version
	1.0 - Original
	1.1 - drasically reduce compute time by itterating over targets array rather than rows array in output
	1.2 - reduce compute time further by eliminating for loop in output generation
	1.3 - added error if function recives an input that isnt a queen
#}


function queenElim = queenElim (coord, board)

if board(coord(1),coord(2)) ~= 1
  error('no queen at elimination position')
 end

localBoard = board; #casting global input to local variables as safety measure, generally redundant
posit = coord; #posit, the current positon of the program in board matrix

localBoard(posit(1),posit(2)) = 2; #isolating current position from analysis of non target
[row,col] = find(localBoard ==1); #isolating target values

vectx = row - posit(1); #create two arrays containing x and y coordinates of all queens on board in target positions, as vectors from posit
vecty = col -posit(2);

magna = sqrt(vectx.^2+vecty.^2); #creates array of magnitudes of queen vectors

anglv = acosd(vecty./(magna.*(sqrt(1)))); #finds angle between vector [0 1] and target vectors, isolating target coordinates, at 45 degree angles
anglerem = rem(anglv,45);
target = find(anglerem <=.001); #.001 used as comparison value due to 45/45 remainder not being zero, but 7E-15


tarind = sub2ind(size(localBoard),row(target),col(target)); #creating index of local board based on targets and then setting targets to 0
localBoard(tarind) = 0;


localBoard(posit(1),posit(2)) = 1; #unisolate current position queen so that it may be used in output, which requires queens to be specified as a 1

queenElim = localBoard; #returning locally stored board to calling script

endfunction
