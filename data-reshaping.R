#this R script is while practising in keeping the data clean
#loading the data from the standard R package
data(mtcars)
head(mtcars)
str(mtcars)
summary(mtcars)

table(mtcars$cyl)
nrow(mtcars)
colnames(mtcars)
mtcars[mtcars$mpg >20,]
#package reshape
install.packages("reshape")
library(reshape)

#using the melt() function on the data.frame
mtcars$carname = rownames(mtcars)
meltcars <- melt (data=mtcars,id =c("carname", "gear", "cyl"), measure.vars = c("mpg", "hp"))
nrow(meltcars)
head(meltcars)
tail(meltcars)

cylData <- dcast (meltcars, cyl ~ variable)