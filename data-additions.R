#this file is practising adding the variables to the exiting data.frames
#this could be helpful while we need to do Machine learning
getwd()
setwd("/Users/hpalagiri/Documents/Proj-R/Coursera/class-datasharing/data")
urlRest <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
resturantData <- download.file( url=urlRest, destfile="baltimoreRest.csv", method="curl")
downLoadedDate <- date()
downLoadedDate
list.files()
restDF <- read.csv(file="baltimoreRest.csv", header=TRUE)
head(restDF)

#sequencing the values
s <- seq(1:10);s
s <- seq(from=1, to=10, by=2);s
#this seq creates the vector s1 and prints it, the number of vectors shall be of size 3
s1 <- seq(1,10, length=3);s1

#this creates the seq of vectors of size of vector x and 
x <- rnorm (10);seq(along = x)

#adding a variable to the data.frame by checking if its matching to some thing ?
colnames(restDF)
restDF$nearMe <- restDF$neighborhood %in% c("Roland Park", "Homeland")
table(restDF$nearMe)

#using ifelse to find the data's austerity
restDF$zipWrong = ifelse (restDF$zipCode < 0, TRUE, FALSE)
table (restDF$zipWrong)

#Categorical variables
?cut
restDF$zipGroups = cut (restDF$zipCode, breaks=quantile(restDF$zipCode))
table (restDF$zipGroups)
table (restDF$zipGroups, restDF$zipCode)

#easier way to categorize the values using Hmisc package
install.packages ("Hmisc")
library (Hmisc)
restDF$zipGroups = cut2(restDF$zipCode, g=4)
table (restDF$zipGroups)

#Converting into factor variables

restDF$zcf = factor(restDF$zipCode)
restDF$zcf[1:10]
class(restDF$zcf)




