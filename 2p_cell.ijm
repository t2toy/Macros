output1 = getDirectory("Output directory for montages");
output2 = getDirectory("Output directory for tifs");
in = getDirectory("Input folder containing everything");
tot_frames = 130;



run("Close All"); 
//run("Image Sequence...", in+"\\ChanA_0001_0001_0001_0001.tif" );
open(in);
//doCommand("Start Animation [\\]");

StackTitle = getTitle();
begin=1;
stim_start=50;
stim_end=80;
end=130;
//lower=getNumber("Threshold: lower", 30);
upper=255; 
roll = 50;//getNumber("Background Substraction", 50);
/*
labels = newArray("Standard Deviation", "Average Intensity", "Maximum Intensity projection");
Dialog.create("Z projection");
Dialog.addChoice("mode",labels);
Dialog.show();
mode = Dialog.getChoice();*/
mode = "Standard Deviation"
// full period
/*
selectWindow(StackTitle);
run("Z Project...", "start=begin stop=end projection=[mode]");
run("8-bit");
run("Subtract Background...", "rolling=roll");


run("8-bit");
setThreshold(lower, upper);
*/

// blank period

selectWindow(StackTitle);
run("Z Project...", "start=begin stop=stim_start projection=[mode]");
run("8-bit");
run("Subtract Background...", "rolling=roll");

// stimulus period

selectWindow(StackTitle);
run("Z Project...", "start=stim_start stop=end projection=[mode]");
run("8-bit");
run("Subtract Background...", "rolling=roll");

// post stim

selectWindow(StackTitle);
run("Z Project...", "start=stim_end stop=end projection=[mode]");
run("8-bit");
run("Subtract Background...", "rolling=roll");

run("Images to Stack", "name=Stack title=[] use");
run("Make Montage...", "columns=3 rows=1 scale=1");
run("Enhance Contrast...", "saturated=0.3");

//setThreshold(lower, upper);
//run("Convert to Mask");

saveAs("Tiff", output1+"\\"+StackTitle +" "+mode+ "_montage.tif");

//saving whole stack as tif
selectWindow(StackTitle);
saveAs("Tiff", output2+"\\"+StackTitle +"stack.tif");

/*

// counting cells
waitForUser( "Select the stack to count"); 
StackCount = getTitle();
selectWindow(StackCount);
run("Analyze Particles...", "size=15-Infinity pixel show=Outlines display exclude clear summarize");

waitForUser( "Select the stack to count"); 
StackCount = getTitle();
selectWindow(StackCount);
run("Analyze Particles...", "size=15-Infinity pixel show=Outlines display exclude clear summarize");

waitForUser( "Select the stack to count"); 
StackCount = getTitle();
selectWindow(StackCount);
run("Analyze Particles...", "size=15-Infinity pixel show=Outlines display exclude clear summarize");