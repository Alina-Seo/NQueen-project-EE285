#{
  Alina debug changelog |Orignal file by America|
  - used str2num on line 16 to change the type of the input array to an int, so it may be used as a number
  - changed assignment of startCoor to fix indexing issue, changes values one at a time using index
  - added debug dip on line 27, can be removed, shows class of the queenNum variable
  - rather than set chessBoard to ones matrix, line 27 has been changed to assign the board variable to the output of MN_next in line with its input requirements. this casts the finalized output to the chessBoard matrix variable
  - commented out the board check on line 39, since that changed all of the outputs to zeros int he final output file
  - removed line on 45 for similar reasons
  - changed output file on like 48 to a CSV for easier parsing by end user should they need it
  - used csvwrite command rather than writematrix on line 54 and 55 due to GNU Octave 8.4 not having that feature
  - removed line on 62 due to no need to place queens on board since MN_next and queenEval cast chessboard to contain all queens needed
  - added fclose at end of file to close the output csv
  #}


%this is the main script I am using while developing following:
%input loop, variable assignment using values from input loop
%creating an output file and
%get the user provided inputs for the variables and output the final board
%into a seperate text file

%b/c this is only a testing field, feel free to move the lines to the final
%files or add stuff to turn it into the final file

workingArray = str2num(inputLoop());

%variable assignment using the
queenNum = workingArray(1);
startCoor(1) = workingArray(2);
startCoor(2) = workingArray(3);

#$starCoor = workingArray([2 3]); %check this to be sure

disp(class(queenNum));
chessBoard = MN_next(startCoor,queenNum);




%depending on the structure of the final script, ideally
%this conversion function will be called in loop after the path clearing and
% before or after next position is determined

#chessBoard = boardCheck(chessBoard);


%output
%decompress the sparce matrix back to normalize
#chessBoard = full(chessBoard);
%generate the actual output file/hearder
fid = fopen('Solution.csv','w');
fprintf(fid, 'Solution Report \n');
fprintf(fid, '---------------- \n\n');

%read in the matrix, this may need checking
#writematrix(chessBoard,fid,'Delimiter','tab');
csvwrite(fid,chessBoard);


%read in the postion array
fprintf ('\n');
fprintf('queens placed at: ');
#writematrix(queenPositions)
fclose(fid)
