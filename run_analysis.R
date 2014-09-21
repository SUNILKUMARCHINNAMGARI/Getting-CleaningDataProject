#url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#dfile<-download.file(url,"dfile.zip",mode="wb") 
trainx <- read.table(file="X_train.txt",header=F,sep="")
trainy <- read.table(file="y_train.txt",header=F,sep="")
trainsubject <- read.table(file="subject_train.txt",header=F,sep="")
testx <- read.table(file="X_test.txt",header=F,sep="")
testy <- read.table(file="y_test.txt",header=F,sep="")
testsubject <- read.table(file="subject_test.txt",header=F,sep="")
fulltrain <- cbind(trainx,trainy,trainsubject)
fulltest <- cbind(testx,testy,testsubject)
fulldata <- rbind(fulltrain,fulltest)
actnames <- read.table(file="activity_labels.txt",header=F,sep="")
colnames(fulldata)[562] <- "activityid"
colnames(actnames) <- c("activityid","activityname")
library(plyr)
fulldata <- join(fulldata,actnames,by="activityid",type="inner")
fulldata[,562] <- fulldata[,564]
fulldata <- fulldata[,-564]
columnnames <- read.table(file="features.txt",header=F)
colnames(fulldata) <- columnnames[,2]
colnames(fulldata)[562:563] <- c("activity","subject")
fulldata <- fulldata[,c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166,201,202,214,215,227,228,240,241,253,254,266,267,268,269,270,271,345,346,347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,530,542,543,562,563)]
results<-ddply(fulldata, .(subject,activity), numcolwise(mean))
colnames(results) <- paste("Avg", colnames(results), sep = "_")
colnames(results)[1] <- "subject"
colnames(results)[2] <- "activity"
write.table(results,"tidydata.txt",row.name=FALSE)