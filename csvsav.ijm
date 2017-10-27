run("Close All"); 
mainDir = getDirectory("Choose a main directory"); 
mainList = getFileList(mainDir); 
mainDirName = File.getName(mainDir);
output= mainDir + "/csv_"+mainDirName+"/";

File.makeDirectory(output);
begin=1;


for (i=0; i<mainList.length; i++) 
{  
          subDir = mainDir + mainList[i]; 
          subList = getFileList(subDir);  		  
		  open(subDir);


StackTitle = getTitle();

selectWindow(StackTitle);
roiManager("Show All");
roiManager("Multi Measure");
saveAs("Results", output+"\\"+StackTitle +".csv");

run("Close All"); 

} 





