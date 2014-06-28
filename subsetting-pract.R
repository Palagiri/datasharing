#This is my practice while I am listening to subsetting 
#Create a data.frame
sample(1:5)
df = data.frame ( "var1" = sample(1:5), "var2" = sample(6:10), "var3"= sample(11:15) )
df
df = df[sample(1:5), ];df$var2[c(2,3)] = NA
df
#Subsetting 
#subset the first column in df
df[,1]
#subsetting with name of the column
df[,"var1"]
#Subsetting the first and second row only
df[1:2,]
df[c(1,2),]

#first and second row elements of the column using the variable name (var2)
df[1:2, "var2"]
df[1:2, 2]
#first row and column elements 1 and 2.
df[1,1:2]
#Subsetting the first row in the data frame
df[1,]

#Subset all the variables from the data.frame with the condition
df[(df$var1 <=3 & df$var3 > 11),]

df[(df$var1 <=3 | df$var3 > 11),]

#prints the NA from the data frame
df[is.na(df)]

#If we want to print all the elements except NA
df[!is.na(df)]