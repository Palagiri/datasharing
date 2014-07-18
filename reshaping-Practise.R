#this is Practise for re-shaping the data
library(reshape2)
data(mtcars)
head(mtcars)
#Naming a new variable 
mtcars$carnames = rownames(mtcars)
head(mtcars)
carMelt = melt(data=mtcars,id.vars=c("carnames", "gear", "cyl"), measure.vars=c("mpg", "hp"))
head (carMelt)
tail (carMelt)

#Creating a new data frame with the variables set by Casting functions
cylData = dcast(data=carMelt, cyl ~ variable)
#It means there are 11 observations of 4 cylinder and 11 hp for 4 cyl
cylData

gearData = dcast(data=carMelt, gear ~ variable)
gearData

#we can even run the mean of the variables
cylData = dcast(data=carMelt, cyl ~ variable, mean)
cylData

#apply functions
data(InsectSprays)
head(InsectSprays)
tapply (InsectSprays$count, InsectSprays$spray, mean)
tapply (InsectSprays$count, InsectSprays$spray, sum)
splitInsect = with (InsectSprays, split( count, spray))
#we get a list of insect Spray sum together each.
temp = lapply( splitInsect, sum)
#we can unlist and make a single vector by unlist 
unlist( temp)

sapply ( temp, sum)
#Using the plyr function
library(plyr)
ddply ( InsectSprays, .(spray), summarize, sum = sum(count))

#there are other functions 
acast() similar to dcast() used above
arrange() similar to order()
mutate() to add new variables
 



