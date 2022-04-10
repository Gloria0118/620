# week 2 in class

# ######################
# SET WORKING DIRECTORY
# ######################

MyWorkingDirectory <- "/Users/Eileen/Documents"
setwd(MyWorkingDirectory)

alldata(drop.defaults = TRUE)
datasets()
df1 <- datasets()
df1

read_csv("a,b,c
         1,2,3
         4,5,6")
install.packages("tidyverse")

vec <- c("A", "B", "A", "D", "C", "B")  
class(vec)

# check the structure and type of the variable
str(df1)
class(df1)

# assign a new dataframe to avoid messing up the original dataset
df2 <- df1

# the '$' is used to specify a specific column
df1$Package
# does the same as above, shows the first column
df2[1]

# change the Package column from character to factor
df2$Package <- as.factor(df2$Package)
class(df2)

# add a new column to df2 named pkg
df1$pkg <- as.factor(df1$Package)

