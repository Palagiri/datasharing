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

#Reading the in XML format
library (XML)
fileUrl = "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse( fileUrl, useInternal=TRUE )
rootNode <- xmlRoot (doc)
xmlName (rootNode)
names(rootNode)
dateDownloaded <- date()
#Now we have all the XML file into the memory and we can access this as how we acess a list.
rootNode[[1]]
rootNode[[3]]
rootNode[[1]][[1]]
rootNode[[1]][[1]][[1]]
rootNode

#Apply sapply function on the rootNode - xml document and trying to extract all the data which is in the 
#tags.
xmlSApply ( rootNode, FUN=xmlValue)


#data.table()
install.packages("data.table")
library (data.table)

?data.table
DT = data.table(x=rnorm (9), y=rep(c("a", "b", "c"),each = 3), z = dnorm(9))
head(DT, 3)
DT[DT$y == "a"]
DT[c(2,3),]
DT[,c(2,3)] #In data.table subsetting column its not same as dataframes.
tables()

DF = data.frame( x = rnorm(9), y = rep(c("a", "b", "c"), each = 3), z = dnorm (9))
DF
DF[c(2,3), ]
DF[,c(2,3)]
k = {print (10); 5}
print (k)
ls()
k