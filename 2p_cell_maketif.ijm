// convert into tif stack from system files.
run("Close All"); 
mainDir = getDirectory("Choose a main directory"); 
mainList = getFileList(mainDir); 
mainDirName = File.getName(mainDir);
output= mainDir + "/TIF_files_"+mainDirName+"/";
File.makeDirectory(output);

end = 1000;


//end=getNumber("Enter total no. of slices:", 1000);




for (i=0; i<mainList.length; i++) 
{  
if(endsWith(mainList[i], "/"))
{   // if the name is a subfolder... 

          subDir = mainDir + mainList[i]; 
          subList = getFileList(subDir);  		  
		  open(subDir);
StackTitle = getTitle();
run("Make Substack...", "  slices=1-"+end);
saveAs("Tiff", output+"\\"+StackTitle +"stack.tif");


} 
} 





