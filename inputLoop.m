#{
  Alina debug changelog |Orignal file by America|
  - implemented cell2mat on line 11 in order to convert cell array to numerical array so it may be processed later as numerical data
  - commented out evaluation of the testVal on lines 18 to 25 due to it not working and refusing to close the errorbox requiring task manager to close application
  #}


%this function sets up a dialouge box so that the user can input
%values that are assigned to the varialbes of the main script

function verifiedInput = inputLoop()
  inputStorage = cell2mat(inputBox());
  disp(inputStorage);
  testVal = numCheck(inputStorage);

  %this is the loop to verify if it is all #'s and to ask for input again
#{
  while testVal ~= true

    %check which error message veichle is appropriate
    errordlg('Error: non-numeric value detected. Please renter values');
    inputStorage = inputBox();
    testVal = numCheck(inputStorage);

  endwhile
#}
  verifiedInput = inputStorage;
end

%this is a utility function that will generate the input
%dialouge box
function inputAnswer = inputBox()
%the order of the strings: 1)string about # of queens, 2) string about xpos
%3)string about ypos
promptA = 'Enter the # of queens to be placed';
promptB = 'Enter the starting x-coordinate';
promptC = 'Enter the starting y-coordinate'
prompt = {promptA, promptB, promptC};
%create the title
title = 'Variable Initalization';
%define the size of the input fields
fieldsize = [1 12; 1 12; 1 12];

%combine previous stuff into args here
inputAnswer = inputdlg(prompt, title, fieldsize);

end

%a utility function to test if the input array is all # or not
function  bolTest = numCheck(exArray)
  bolTest = isnumeric(exArray);
end

