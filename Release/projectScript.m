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
starCoor = workingArray([2 3]); %check this to be sure
chessBoard = ones(size(queenNum));



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

