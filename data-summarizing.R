#This work is while practising summarizing in R
#Collecting data from the URL : https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD
getwd()
setwd("/Users/hpalagiri/Documents/Proj-R/Coursera/class-datasharing/data")
urlRest <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
resturantData <- download.file( url=urlRest, destfile="baltimoreRest.csv", method="curl")
downLoadedDate <- date()
downLoadedDate
list.files()
restDF <- read.csv(file="baltimoreRest.csv", header=TRUE)
head(restDF)
colnames(restDF)
str(restDF)
summary (restDF)
quantile(restDF$councilDistrict)
#using the table command to get the counts of number of restaurants in a particular zipcode
table (restDF$zipCode, useNA="ifany")
#Checking for missing values
sum (is.na(restDF$councilDistrict))
any(is.na(restDF$councilDistrict))

#to check if there are any non-negative values
all (restDF$zipCode > 0)

#to find the column sums of the whole data frame
colSums ( is.na(restDF))

#any values those matching a particular value
#In this case lets find how many restaurants are there in a particular zipcode
table (restDF$zipCode == "21212")
table (restDF$zipCode %in% c("21212"))

#If we have multiple vector to be matched
table (restDF$zipCode %in% c("21212", "21218"))

#subsetting the dataframe restaurants which are in zipcode "21212"
rest21212 = subset (restDF, restDF$zipCode == "21212")
head(rest21212,n=3)
#subsetting using the []
restDF[restDF$zipCode == "21212", ]

#subsetting the dataframe to get all the resturants in multiple zip codes
rest21212_21218 = subset (restDF, restDF$zipCode %in% c("21212", "21218"))
restDF[restDF$zipCode %in% c("21212", "21218"),]
tail(rest21212_21218, n=3)

#Loading the datasets that come with R
data(UCBAdmissions)
adm <- as.data.frame(UCBAdmissions)
head(adm)
summary (adm)


#cross tabs
?xtabs
xt <- xtabs(formula=Freq ~ Gender + Admit, data=adm)
xt

#to know the size of the dataset
object.size(adm)
object.size(restDF)
print (object.size(restDF), units = "Mb")







