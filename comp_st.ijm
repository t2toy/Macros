mainDir = getDirectory("Choose a main directory "); 
mainList = getFileList(mainDir); 
run("Close All"); 


mainDirName = File.getName(mainDir);
output= mainDir + "/Composite_brg_"+mainDirName+"/";
File.makeDirectory(output);

begin=1;
stim_start=50;
stim_end=80;
end=getNumber("Enter total no. of slices:", 130);

for (i=0; i<mainList.length; i++) 
{  
          subDir = mainDir + mainList[i]; 
          subList = getFileList(subDir);  		  
		  open(subDir);

StackTitle = getTitle();
// blank period

selectWindow(StackTitle);
run("Z Project...", "start=begin stop=stim_start projection=[Standard Deviation]");
off=getTitle();

// stimulus period

selectWindow(StackTitle);
run("Z Project...", "start=stim_start stop=stim_end projection=[Standard Deviation]");
on=getTitle();

// post stim

selectWindow(StackTitle);
run("Z Project...", "start=stim_end stop=end projection=[Standard Deviation]");
after=getTitle();

run("Merge Channels...", "c1="+on+" "+" c2="+after+" "+"c3="+off+" create keep");
saveAs("Tiff", output+"\\"+StackTitle +" "+"composite.tif");
} 





