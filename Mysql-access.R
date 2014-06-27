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

