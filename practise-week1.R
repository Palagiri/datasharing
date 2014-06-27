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
DT[, list(mean(x), sum(z))] # we can pass the functions to be acted on the coulmns
DT[list(mean(x)),] # gives an error
DT[,list(mean(x))] # executes as this is in the column part of the DT
DT[, table(y)]
DT[,w:= z^2] #Adding a new column is easy and fast 
DT
tables()

DT2 <- DT # If we copy the data.table(DT2) to another data.table(DT) and modify the DT it will take an 
#effect on both the data.frames as the copy is not made, just we got 2 handles to one data.table
DT 
DT2[,hafeez:=2]
DT2
DT
DT[,m:= list(mean(hafeez))]
DT
DT2
#If you want to copy the data table there is a copy() to do it.
dtCp = copy(DT)
dtCp
dtCp[,R := list(mean(x))] # the new row will just be added onto the dtCP data.table not onto the other DT 
# and DT2 as this dtCp is created of copy() function.
dtCp
DT
DT[,m:= {tmp <- (x+z); log2(tmp + 5)}]
DT
DT2
DT[,a:= hafeez > m]
DT
#count the occurances of the particular variable in a list
set.seed(123)
DT <- data.table ( x= sample(letters[1:3], 1E5, TRUE)) # Creating a data.table (DT )that has 100K- a,b,c 
DT[, .N, by = x] # Count the occurance of letters (a,b,c)
table(DT)
#setting keys in data.table()
DT <- data.table(x=rep(c("a", "b", "c"), each = 100), y = rnorm (300))
head(DT, 103)
DT[99:103, ]
setkey(DT, x )
DT['a']# this will print out all the values of data.table that has the index as 'a'
#we can merge the data.tables using the keys.
DT1 <- data.table (x=c('a', 'b', 'c', 'dt1'), y=1:4)
DT2 <- data.table (x=c('a', 'b', 'c', 'dt2'), z = 1:4)
DT1
DT2
setkey( DT1, x);setkey (DT2, x)
merge (DT1, DT2)




DF = data.frame( x = rnorm(9), y = rep(c("a", "b", "c"), each = 3), z = dnorm (9))
DF
DF[c(2,3), ]
DF[,c(2,3)]
k = {print (10); 5}
print (k)
ls()
k