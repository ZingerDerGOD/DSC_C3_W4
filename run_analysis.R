## This function is built as a solutuion to "Peer-graded Assignment: Getting and Cleaning Data Course Project" 
## of Week 4 Coursera course "Getting and Cleaning Data".

## Main target: illustrate ability to collect, clean and process data.

## Main workflow actions are marked as ##>. Please follow them to see step-by-step correlation of implementation against actual tasks.

## This function is designed to be used without any parameters, but as it was not forbidden - I added few to makes things simplier.

## This function was not ever designed to be efficient, as it was not defined. 
## Main target for this function is: fulfill tasks in most transparent way possible, for later usage as a code reference.

##Params:
  ##@includeActivityLabels (OPTIONAL)// Adds human readable activity labels to a resulting dataset. FALSE by default.
  ##@rootFolder (OPTIONAL)// A relative path to the required dataset, in case if you wouldn't like to change your working directiry to run this script( like me ). REQUIRES ENCLOSING SLASH.

run_analysis <- function(includeActivityLabels = FALSE,rootFolder = ""){
  ##load dictionaries for later use.
  featureLabels <- read.table(paste(rootFolder,"features.txt",sep=""),header = FALSE,strip.white = TRUE,stringsAsFactors = F,col.names = c("ID","FeatureName"));

	##>1 Merges the training and the test sets to create one data set.
  ##>3 Uses descriptive activity names to name the activities in the data set
  ##>4 Appropriately labels the data set with descriptive variable names.
    ## Load test data.
    raw_Test_Body <- read.table(paste(rootFolder,"test/X_test.txt",sep=""),header = F,strip.white = T , stringsAsFactors = F , col.names = featureLabels$FeatureName) %>%
    cbind( read.csv(paste(rootFolder,"test/y_test.txt",sep=""),header = F,col.names = c("Activity") , stringsAsFactors = F)) %>%
    cbind( read.csv(paste(rootFolder,"test/subject_test.txt",sep=""),header = F,col.names = c("Person") , stringsAsFactors = F));
  	## Load train data
  	raw_Train_Body  <- read.table(paste(rootFolder,"train/X_train.txt",sep=""), header = F, strip.white = T ,stringsAsFactors = F , col.names = featureLabels$FeatureName) %>%
  	cbind( read.csv(paste(rootFolder,"train/y_train.txt",sep=""),header = F,col.names = c("Activity") , stringsAsFactors = F)) %>%
    cbind( read.csv(paste(rootFolder,"train/subject_train.txt",sep=""),header = F,col.names = c("Person") , stringsAsFactors = F));
  	##merge, clean
    rawData <- rbind(raw_Train_Body,raw_Test_Body);
  	##>2 Extracts only the measurements on the mean and standard deviation for each measurement.
  	rawData <- rawData[,c("Person","Activity"
  	                      ,grep("*mean()*",colnames(rawData),value = T)
  	                      ,grep("*std()*",colnames(rawData),value = T)
  	                   )];
  ##>5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  	##Aggregate, Tidy
  	result <- aggregate(rawData,by = list(rawData$Person,rawData$Activity),FUN = mean)[,c(-1,-2)] %>% 
  	  gather(ObservationType,ObservationValue,3:81);
    ##add labels, if requested.
  	if(includeActivityLabels){
  	  activityLabels <- read.table(paste(rootFolder,"activity_labels.txt",sep=""),header = FALSE,strip.white = TRUE,stringsAsFactors = F,col.names = c("ID","ActivityName"));
  	  result <- merge(x = result, y = activityLabels, by.x = "Activity",by.y = "ID" );
  	}
  ##return result
	return(result);
}
## Usage examples:
## result <- run_analysis(); ## simple call, works if you're in the same dir as data.
## result <- run_analysis(includeActivityLabels = T); ## dataset defined in Task + human readable labels for Actions.
## result <- run_analysis(rootFolder = "REPO/COURSERA/C_3/W_4/Data/UCI HAR Dataset/"); ## my env., directory displacement in action.

##Actual task states: The output should be the tidy data set you submitted for part 1.
run_analysis();