inf1="input-pathfile/"
inf2='inputcsv'
out1="outputdir"
out2="AnalysisGroup"




############################

from ij import IJ
from ij.plugin.frame import RoiManager
from ij.plugin.filter import ParticleAnalyzer, BackgroundSubtracter, EDM
from ij.measure import ResultsTable
from ij.io import DirectoryChooser
import os
import csv


def Analysis(imagepath,savefilepath):
   imp = IJ.openImage(imagepath)
   imp.show()

   IJ.run("8-bit");
   IJ.run("Subtract Background...", "rolling=200");
   IJ.setAutoThreshold(imp,"Mean dark");

   IJ.run("Threshold...");
   IJ.setThreshold(14, 255,"BlackBackground");

   IJ.run("Convert to Mask");
   IJ.run("Watershed");
   IJ.run("Analyze Particles...", "display exclude clear add");
   IJ.saveAs("Results", savefilepath);
   IJ.log("Finish")

def ana2(int1path,int2path,result,result2):

  os.chdir(int1path)
  f = open(int2path, 'r')
  reader = csv.reader(f)
  header = next(reader)
  l = [row for row in reader]
  l_T = [list(x) for x in zip(*l)]
  f1=l_T[3]
  f2=l_T[4]

  n=len(f1)
  for i in range(n) :
    os.chdir(f1[i])
    path = os.path.join(f1[i], f2[i])
    j=i+1
    resulta=result2
    resultb=resulta+"%01.f"%(j)+".csv"
    resultpath=os.path.join(result,resultb)
    Analysis(path,resultpath);

##############
  
ana2(inf1,inf2,out1,out2)
