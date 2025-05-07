#{
Description:
  script that runs evaulU for every single board and starting position from startPoint to specified stopPoint, in terms of dimenstions of chessboard.
  Is used to test the output of MN_next to verify that it outputs as expected for every input
  
  requires making of outputfile.csv



Inputs:
    requres runner to change start and stop position veriables to desired values
Output
    returns the number of times that output passed and failed, along with the times it takes to execute and the retult of each test
Version:
  1.0 Original
  1.1 - addes stop and start positions for easier user experience
  1.2 - changed output to display pass and fail counts during runtime to provide more accurate information to user
  1.3 - updated output to display cordinates being etsted and improved readability with spacing
  1.4 - added text file output for log
  1.5 - added more terminal output for log, and streamlined file write
  1.6 - outputs to csv file
#}

## Author: Alina Matchette
## Created: 2025-05-02

startPoint = 1; #SET THESE to target start and stop dimensions
stopPoint = 20;


passcount  = 0;
failcount = 0;



fileID = fopen('outputfile.csv','w');
fprintf(fileID,"board_size,coordinates,MN_time,Eval_time,num_times_passed,num_times_failed\n\n");



for k = startPoint:stopPoint #runs loop fdor every single board and cordinate on board of MN_next
for i = 1:k
  for j = 1:k


fprintf("\n\ntrying %d , point(%d , %d)\n",k, i , j)
 tic
  runa =  MN_next([i j],k);
deltaT = toc

 tic
  run = evalu(runa); #checking output from MN_next in evalU
deltaT2 = toc


  if run == "Pass" #updating pass or fail count
    passcount = passcount + 1;
   else
    failcount = failcount + 1;
  endif
  fprintf(fileID,"\n%d,(%d %d),%f,%f,%d,%d\n",k, i , j,deltaT,deltaT2,passcount,failcount);

  fprintf("passed %d times, failed %d times\n\n",passcount,failcount);


end
end
fprintf(fileID,"\n\n");


end

fclose(fileID);
