setwd("/Users/hpalagiri/Documents/Proj-R/Coursera/class-datasharing")
getwd()
setwd ("../")
getwd()

#The following code snippet checks if we have an existing file by name "class-datasharing"
#If not it creates it.
if (! file.exists("class-datasharing") ) {
        dir.create("class-datasharing")
}
setwd("class-datasharing")
dir.create("data")
fileurl = "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file (url =fileurl, method="curl", destfile="./data/cameradata.csv")

list.files("./data")
dateDownloaded <- date()
dateDownloaded

setwd("./data")
cameradata = read.csv ("cameradata.csv", sep = ',', header=TRUE)
head (cameradata)
colnames(cameradata)

#Reading the xlsx files 

library("xlsx")
library ("XLConnect")
fileurl = "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file(fileurl, method = "curl", dest = "cameras.xlsx")
dateDownloaded <- date()
cameradataXLSX = readWorksheet (object="cameras.xlsx", sheet=1, header=TRUE)
#I am having problem in reading the xlsx file, have tried other options as well.

#Reading the 