// input is the folder containing the tifs to be analysed.
// computes average of the off phase images and subtracts it from the whole stack.
//output is a stack after calculation and an avi at 25 fps.

mainDir = getDirectory("Choose a main directory "); 
mainList = getFileList(mainDir); 

mainDirName = File.getName(mainDir);
output= mainDir + "/BScorr_files_"+mainDirName+"/";
File.makeDirectory(output);

begin=1;
stim_start=100;
stim_end=200;
end=getNumber("Enter total no. of slices:", 300);

for (i=0; i<mainList.length; i++) 
{  
          subDir = mainDir + mainList[i]; 
          subList = getFileList(subDir);  		  
		  open(subDir);
		 // make the stack 8 bit so that the image calculator can work.

StackTitle = getTitle();
// blank period

selectWindow(StackTitle);
run("Z Project...", "start=begin stop=stim_start projection=[Average Intensity]");
average = getTitle();

// image calculator
imageCalculator("Difference create stack", StackTitle,average);
saveAs("Tiff", output+"\\"+StackTitle +"bs.tif");
bsStackTitle = getTitle();

//Z projections

selectWindow(bsStackTitle);
run("Make Substack...", "  slices="+stim_start+"-"+stim_end);
run("Z Project...", "projection=[Average Intensity]");
saveAs("Tiff", output+"\\"+StackTitle +" ON.tif");


selectWindow(bsStackTitle);
run("Make Substack...", "  slices="+stim_start+"-"+end);
run("Z Project...", "projection=[Average Intensity]");
saveAs("Tiff", output+"\\"+StackTitle +" ON_OFF.tif");

}
run("Close All");