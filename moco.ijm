run("Close All"); 
mainDir = getDirectory("Choose a main directory"); 
mainList = getFileList(mainDir); 
mainDirName = File.getName(mainDir);
outputmoco= mainDir + "/MOCO1_"+mainDirName+"/";
File.makeDirectory(outputmoco);
//outputSTD= mainDir + "/STD_"+mainDirName+"/";
//File.makeDirectory(outputSTD);
//outputSTDmoco= mainDir + "/STDmoco_"+mainDirName+"/";
//File.makeDirectory(outputSTDmoco);


begin=1;
end=getNumber("Enter total no. of slices:", 300);
w=getNumber("MoCo, w", 10);

for (i=0; i<mainList.length; i++) 
{  
  

          subDir = mainDir + mainList[i]; 
          subList = getFileList(subDir);  		  
		  open(subDir);

run("8-bit");
StackTitle = getTitle();
run("Duplicate...", "use");
template = getTitle();

selectWindow(StackTitle);
run("moco ", "value="+w+" downsample_value=1 template=template stack="+StackTitle+" log=[None] plot=[None]");
saveAs("Tiff", outputmoco+"\\"+StackTitle +"_moco_stack.tif");
//xyz = getTitle();

// STDmoco
//selectWindow(xyz);
//run("Z Project...", "start=begin stop=end projection=[Standard Deviation]");
//run("8-bit");
//saveAs("Tiff", outputSTDmoco+"\\"+StackTitle +"_STDmoco.tif");

//STD normal
//selectWindow(StackTitle);
//run("Z Project...", "start=begin stop=end projection=[Standard Deviation]");
//run("8-bit");
//saveAs("Tiff", outputSTD+"\\"+StackTitle +"_STD.tif");



} 





