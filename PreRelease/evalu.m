#{
Description:
  evaluation function used to test MN_next by comapring its output to generated output using the same queen positions it finds.
  takes all queens on board and feeds them into the elimination script. if there are spaces missing that are not under threat it is marked as a fail, if not a pass.



Inputs:
    Takes input matrix in the form of queens are represented as a 1, 0 is an empty space
Output
    returns true or false absed on the result of test
Version:
  1.0 Original
  1.1 - fixed need to comment out queenElims input checker, and streamlined setting up evaluation
#}

## Author: Alina Matchette
## Created: 2025-05-02

function retval = evalu (inputM)
  ; #takes and locally stores input and then obtaisn locations of ones and zeros in the matrix, both indecies and rows/columns
  [qrow qcol] = find(inputM ==1);
  queen = sub2ind(size(inputM),qrow,qcol);
  nQueen = find(inputM ==0);

  board = ones(size(inputM)); #makes fresh board of queens for evaluation

 for i= 1:length(queen) #using known "good" queen locations extracted earlier from the original output, runss them through the verification process again
 board = queenElim([qrow(i) qcol(i)], board);

 end
  board(queen) = 2; #setting all of the prevous known good positions to a 2, so they are marked as prevously having been known as good


  if ismember(1,board) #quckly checks to see that there are no queens that there should not be in output

   retval = "Fail";


 else
  retval = "Pass";
endif

endfunction
