README.md
==================

This repo contains an example R script, "run_analysis.R", which utilizes data collected from accelerometers on the Samsung Galaxy S smartphone. 

Overall, the script makes the data "tidy" by merging  training and test signals, pulling only measurements that show the mean and standard deviation, assigning variable and column names, then outputting a txt file with the mean over several observations. 

Running the "run_analysis.R" script while in the "/UCI HAR Dataset-2" working directory will output a "tidyDT.txt" file. The output includes 180 observations for 66 averaged measurements for different activities performed with the accelerometer. 