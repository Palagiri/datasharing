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

#sorting elements in the data.frame
sort (df$var1, decreasing=TRUE)
sort (df$var2, na.last=TRUE)

#order the data.frame w.r.t one column 
df [order(df$var1),]
#we cannot just use order function to print the order of elements in a particular column
order(df$var1)# does not work

#we can order data.frame using multiple columns
df[order(df$var1, df$var3),]

#there is this new package plyr that we can use for sorts 

library(plyr)
#arranges the data.frame w.r.t var1 in ascending order
arrange(df, var1)
#arranges the data.frame w.r.t var1 in descending order
arrange (df, desc(var1))
#arranges the data.frame w.r.t var1 in ascending order
arrange (df, -desc(var1))

#Adding a new column to the data.frame
df$var4 <- rnorm (5)
df
#using cbind command, the following command binds the new elements to the right side
df <- cbind (df, "var5"=dnorm(5))
df

df <- cbind ("var0" = pnorm(5), df)
df

#we can use rbind to add the rows 
df <- rbind (df, rnorm(6))
df




              
              
              