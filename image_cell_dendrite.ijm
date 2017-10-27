/* 
This macro allows you to batch process images!
Written by Ritu Roy Chowdhury
For queries:
Contact rituroych@gmail.com
*/


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
	"Inside the function";
	open(input + file);
 	imgName=getTitle();
 	run("8-bit");
 	lowerred=20;
 	lowerblue=35;//Set threshold values here!
 	upper=255;
 	
	run("Z Project...", "projection=[Max Intensity]");
	run("Split Channels");
	"I am" + imgName;
	
	selectWindow("C1-MAX_" + imgName);
	setTool("Circle Tool");
	waitForUser("Set ROI for C1-MAX_" + imgName, "Choose Cell Body. Then press OK.");
	setThreshold(lowerred, upper);
	run("Measure");
	//close();
	                                   
		
	selectWindow("C2-MAX_" + imgName);
	setTool("Circle Tool");
	//waitForUser("Set ROI for C1-MAX_" + imgName, "Choose Cell Body. Then press OK.");
	run("Restore Selection");
	setThreshold(lowerblue, upper);
	run("Measure");
	//close();         
	
	selectWindow(file);
	close();
	saveAs("Results", "G:\\Dropbox\\Thesisyear_literature\\DATA\\Constitutive_0_30\\Nov,3,2015\\macro_output\\Results.xls");
	//close();
	
	
	
}



