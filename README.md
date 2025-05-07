# NQueen-project-EE285
for matlab course final project, being a solution to the N Queen problem. not an idealized solution, however one that functions as a display of matlab capabilites of the uploaders


the goal of the probram is to provide a 3 stage soultion to the N Queen problem in matlab
the stages follow a subtractive method where an idealized board full of queens, represented as a ones matrix, is then passed through rounds of elimination where queens that are threatened are removed from the board

the user of the program specifies a starting position, along with other input perameters such as board size, and any to be added at a future date

the program then returns the finalized boardstate to the user

the stages are as follows

1 - take input / give output
2 - find which queens are used as the queens to evaluate subtractivly from
3 - subtractive elimiation

program loops between stages 2 and 3 before returning to 1 after N times

TO DOWNLOAD AND USE

go to release folder, and follow readme in folder
