%this is the function to iterate through the board and determine
%how many zeros and how many nonzeros ther are on the board.
%once the numbers are found, the board is either convered to a sparce
%matrix or left alone until next function call

function convertedBoard = boardCheck(currBoard)
  zeroCount = 0;  occupiedCount =0;
  %for loop to transerse matrix
  for ii = 1:length(currBoard)
    for jj = 1: length(currBoard)
      %determine whixh counter to increment
      if currBoard(ii, jj) = 0
        zeroCount = zeroCount+1;
       else
        occupiedCount = occupiedCount+1;
      endif
    endfor
  endfor

  %if statement to determine if there are more 0's than non0's
  %and to change the board or not according to it
  if zeroCount > occupiedCount
    convertedBoard = sparce(currBoard);
  else
    convertedBoard = currBoard;
  endif

