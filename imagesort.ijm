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
 	
 	
	run("Z Project...", "projection=[Max Intensity]");
	run("Grays");
	run("Grays");
	//run("Split Channels");
	//run("Arrange Channels...");
	/*
	selectWindow("C1-MAX_" + imgName);
	run("Grays");

	selectWindow("C2-MAX_" + imgName);
	run("Grays");
	"I am" + imgName;

	run("Brightness/Contrast...");
    //run("Smooth");

	*/
	selectWindow(file);
	close();
	//saveAs("Results", output);
	//close();
	
	
	
}



