#This file is help file to access mysql database using R.
install.packages ( "RMySQL")
library (RMySQL)
#try and connect to the genome mysql server that is provided by UCSC.
#https://genome.ucsc.edu/goldenPath/help/mysql.html

ucscDB <- dbConnect (MySQL(), user="genome", host="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDB, "show databases;")
result
dbDisconnect(ucscDB)

#If we want to access the particular databse in the list of databases.

ucsvDB <- dbConnect(MySQL(), user="genome", db="hg19", host="genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(ucsvDB)
length(allTables)
allTables[1:10]
#if we want to list the attributes in a particular table

dbListFields(ucsvDB, "affyExonProbeFree")
dbGetQuery( ucsvDB, "select count(*) from affyExonProbeFree")
#executing a query on a particular db handler.
query<-dbSendQuery(ucsvDB, "select * from affyU133Plus2 where misMatches  between 1 and 3")

affyMis <- fetch(query); quantile(affyMis$misMatches)
#fetching particular number of rows from the query.
affyMisSall <-fetch(query, n=10)
dbClearResult(query)
dbClearResult(dbListResults(ucsvDB)[[1]])
dbDisconnect(ucsvDB)

#How to access HDF5 
#Installing the packages 
source ("http://bioconductor.org/biocLite.R")
biocLite ("rhdf5")
library (rhdf5)
#Creating a HDF5 file.
create = h5createFile("example.h5")
#Creating some sub groups.
create = h5createGroup(file="example.h5", group="foo")
create = h5createGroup (file="example.h5", group="bar")
create = h5createGroup(file="example.h5", group ="foo/subgrpfoo")
h5ls(file="example.h5")
#Inserting datainto the example.h5 file.
A = matrix (data=1:10, nrow=5, ncol=2)
h5write(obj=A, file="example.h5", name="foo/A")
h5ls("example.h5")
B = array (data=seq(0.1, 2.0 , by = 0.1), dim =c(5,2,2))
h5write (obj=B, file ="example.h5", name="foo/B")
h5ls("example.h5")

#Reading the data from the H5 file
readA = h5read(file="example.h5", "foo/A")
readA
readB = h5read (file="example.h5", "foo/B")
readB