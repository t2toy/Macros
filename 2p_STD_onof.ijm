mainDir = getDirectory("Choose a main directory "); 
mainList = getFileList(mainDir); 

output1 = getDirectory("Output directory for Z projections");

begin=1;
stim_start=100;
stim_end=200;
end=getNumber("Enter total no. of slices:", 300);

labels = newArray("Standard Deviation", "Average Intensity", "Maximum Intensity projection");
Dialog.create("Z projection");
Dialog.addChoice("mode",labels);
Dialog.show();
mode = Dialog.getChoice();

for (i=0; i<mainList.length; i++) 
{  
          subDir = mainDir + mainList[i]; 
          subList = getFileList(subDir);  		  
		  open(subDir);

StackTitle = getTitle();
// blank period

selectWindow(StackTitle);
run("Z Project...", "start=begin stop=end projection=[mode]");
run("8-bit");
saveAs("Tiff", output1+"\\"+StackTitle +" "+mode+ "_proj.tif");

/*
// stimulus period

selectWindow(StackTitle);
run("Z Project...", "start=stim_start stop=stim_end projection=[mode]");
run("8-bit");
saveAs("Tiff", output1+"\\"+StackTitle +" "+mode+ "_on_proj.tif");

// post stim

selectWindow(StackTitle);
run("Z Project...", "start=stim_end stop=end projection=[mode]");
run("8-bit");
saveAs("Tiff", output1+"\\"+StackTitle +" "+mode+ "_post_proj.tif");

*/
run("Close All"); 

} 





