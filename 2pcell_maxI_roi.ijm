run("Close All"); 
mainDir = getDirectory("Choose a main directory"); 
mainList = getFileList(mainDir); 
mainDirName = File.getName(mainDir);
output= mainDir + "/STD_moco_draw_roi_"+mainDirName+"/";

File.makeDirectory(output);
begin=1;
end=getNumber("Enter total no. of slices:", 300);

for (i=0; i<mainList.length; i++) 
{  
  

          subDir = mainDir + mainList[i]; 
          subList = getFileList(subDir);  		  
		  open(subDir);


StackTitle = getTitle();
// full period

selectWindow(StackTitle);
run("Z Project...", "start=begin stop=end projection=[Standard Deviation]");
run("8-bit");
saveAs("Tiff", output+"\\"+StackTitle +"proj.tif");

run("Close All"); 

} 





