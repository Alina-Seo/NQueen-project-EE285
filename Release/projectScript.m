%this is the main script I am using while developing following:
%input loop, variable assignment using values from input loop
%creating an output file and
%get the user provided inputs for the variables and output the final board
%into a seperate text file

%b/c this is only a testing field, feel free to move the lines to the final
%files or add stuff to turn it into the final file

#{
Short final debug log by Alina
  -fixed typing and dimension errors by adding str2num line 15, size() line 20
  - changed 29 to use queenNum rather than chessboard in MN input to fix dimension error
  - added lines 40 and 41 to generate queen position array for output
  - lines 50 and 51 now output to the output file rather than terminal
  - transpose array on line 25 to fix dimension mismatch error
#}

workingArray = str2num(inputLoop());

%variable assignment using the
queenNum = workingArray(1);
startCoor = workingArray([2 3]); %check this to be sure
chessBoard = ones(size(queenNum));
startCoor = transpose(startCoor);


%depending on the structure of the final script, ideally
%this conversion function will be called in loop after the path clearing and
% before or after next position is determined

chessBoard = MN_next(startCoor, queenNum);


%output
%decompress the sparce matrix back to normalize
chessBoard = full(chessBoard);
%generate the actual output file/hearder
fid = fopen('Solution.txt','w');
fprintf(fid, 'Solution Report \n');
fprintf(fid, '---------------- \n\n');

[qrow,qcol] = find(chessBoard == 1); #added this to give the actual positions for the final output
queenPositions =[qrow qcol];

%read in the matrix, this may need checking
#writematrix(chessBoard,fid,'Delimiter','tab');
csvwrite(fid,chessBoard);
%read in the postion array
fprintf (fid,'\n');
fprintf(fid,'queens placed at: \n');
csvwrite(fid,queenPositions);
fclose(fid);
