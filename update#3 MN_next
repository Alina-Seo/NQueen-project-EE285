%% MN_next Function (Hamza Alshamasneh)
% The function's job is to place N queens on an NxN chessboard, starting from
% an initial position inputed by the user. And then placing the rest of the queens by
% searching safe rows and columns, and calling an external function (queenElim)
% to update the board by removing all threatened squares.

%% Initail Version:
% by using a loop and linear indexing, it searched for the next valid square
% by sorting the valid indices and choosing the next one after the current.
% was missing earlier valid squares.

%% Update #1:
% switched to using nested loops to search from top left of the board.
% also rebuilt the board at each iteration and applied the elimination
% function for all previously placed queens. Skipped the used rows and
% columns.

%% Upadate #2 (Final Update):
% used new internal function (bestPlacement) to find the best queen
% positions through a structured board checking, then updates the board
% state after each move.



function [finalBoard, queenPositions] = MN_next(startCoord, queenNum)
% MN_next begins with a user inputed queen placed at a starting coordinate on an NxN chessboard.
%then tries to add as many additional queens as possible without any of them threatening each other.
%threats are eliminated using (queenElim) function.


    board = ones(queenNum);

    %place the first queen at the user inputed position
    queenPositions = startCoord;

    % call the elimination function to remove threatened squares
    board = queenElim(startCoord, board);

    %search for rows and columns that already have queens
    usedRows = false(1, queenNum);
    usedCols = false(1, queenNum);
    usedRows(startCoord(1)) = true; %mark the starting queen's row as used
    usedCols(startCoord(2)) = true; %mark the starting queen's column as used

    %placing the rest of the queens
    queenPositions = bestPlacement(board, queenPositions, usedRows, usedCols, queenNum);

    %set the final board to zeros
    finalBoard = zeros(queenNum);

    %mark the positions of the successfully placed queens with 1s
    for i = 1:size(queenPositions,1)
        finalBoard(queenPositions(i,1), queenPositions(i,2)) = 1;
    end
end


function bestPositions = bestPlacement(board, current, usedRows, usedCols, queenNum)
% This function uses backtracking to place as many queens as possible on
% the board, starting from a initial given board state, avoiding placing 
% multiple queens in the same row or column and updates the board after
% each queen using the (queenElim) function to remove threatened squares.

    %start with the current list
    bestPositions = current;

    %loop through each row of the board
    for row = 1:queenNum
        if usedRows(row)
            continue; %skip the row if a queen is already placed
        end

        %loop through each column of the board
        for col = 1:queenNum
            if usedCols(col)
                continue;  % Skip column if a queen is already placed
            end

            %Check if this square is still valid
            if board(row, col) == 1

                % create a new board with threats eliminated by this queen
                newBoard = queenElim([row, col], board);

                %mark the row and column as used
                newUsedRows = usedRows;
                newUsedCols = usedCols;
                newUsedRows(row) = true;
                newUsedCols(col) = true;

                % ddd this queen's position to the current list
                newCurrent = [current; [row, col]];

                % keep triyng to place more queens
                result = bestPlacement(newBoard, newCurrent, newUsedRows, newUsedCols, queenNum);

                % if this path placed more queens than our current best, update best
                if size(result,1) > size(bestPositions,1)
                    bestPositions = result;

                    %if we placed all N queens, stop early
                    if size(bestPositions,1) == queenNum
                        return;
                    end
                end
            end
        end
    end
end
