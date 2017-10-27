/* 
This macro allows you to batch process images!
Written by Ritu Roy Chowdhury
For queries:
Contact rituroych@gmail.com
*/
run("Close All"); 

waitForUser("WELCOME", "Are you ready to get started?");
beep();

input = getDirectory("Input directory");
output = getDirectory("Output directory");

Dialog.create("File type");
Dialog.addString("File suffix: ", ".oif", 5);
Dialog.show();
suffix = Dialog.getString();

processFolder(input);

function processFolder(input) 
{
	list = getFileList(input);
	for (i = 0; i < list.length; i++) 
	{
		/*if(File.isDirectory(list[i]))
			processFolder("" + input + list[i]);
			"In the loop";*/
		if(endsWith(list[i], suffix))
			processFile(input, output, list[i]);
			"Begin processing: ";
	}

Dialog.create("Finish");
beep();
Dialog.show();

}


function processFile(input, output, file)

{   
	//run("Close All"); 
	"Inside the function";
	open(input + file);
 	imgName=getTitle();
 	run("8-bit");
 	lowerRED=50;
 	lowerBLUE=35; //Set threshold values here!				//Set threshold values here!
 	upper=255;
 	
	run("Z Project...", "projection=[Max Intensity]");
	run("Split Channels");
	"I am" + imgName;
	
	selectWindow("C1-MAX_" + imgName); //RED channel
	run("Grays");
	setTool("freehand");
	
	/*if (selectionType() == 0)                            
	exit("Sorry, no ROI");*/	
	waitForUser("Set ROI for red_C1-MAX_" + imgName, "Select your region of interest. Then press OK.");
	setThreshold(lowerRED, upper);
	
	run("Measure");
	
	//close();
	                                   
	selectWindow("C2-MAX_" + imgName); //BLUE channel
	run("Grays");
	setTool("freehand");
	
	/*if (selectionType() == 0)                            //make sure we have got a rectangular selection
	exit("Sorry, no ROI");*/
	run("Restore Selection");
	//waitForUser("Set ROI for blue_C2-MAX_" + imgName, "Select your region of interest. Then press OK.");
	setThreshold(lowerBLUE, upper);
	
	run("Measure");
		
	//close();           
	
	selectWindow(file);
	close();
	//saveAs("Results", output);
	//close();
}



