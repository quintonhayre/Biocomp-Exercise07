setwd("/Users/Quintonhayre/Desktop/R Biocomp/Biocomp-Exercise07/")
library(dplyr)
#Biocomp Exercise 7 Quinton Hayre 

#Question 1: 
  #insert file name
filename = readline(prompt ="Enter filename: ") #"test.txt"
original_file <- readLines(paste0("/Users/Quintonhayre/Desktop/R Biocomp/Biocomp-Exercise07/", filename), warn = FALSE)
a = as.integer(readline(prompt = "What is the first line you want printed: ")) #ENTER NUMBER: what is the first line you want printed 
b= as.integer(readline(prompt = "What is the last line you want printed: ")) #ENTER NUMBER: what is the last line you want printed
head_custom <- function(x){
  lines <- x[a:b]
  return(lines)
}
head_custom(original_file)

#Question 2 
iris = read.table(file = "iris.csv", header = TRUE, stringsAsFactors = FALSE, sep = ",")
  #print the last two rows in the last two columns 
last_two = iris[149:150, 4:5]
  #get the number of observations for each species included in the data set
observations = iris %>% group_by(Species) %>% summarise(Observations = n())
  #get rows with Sepal.Width > 3.5
iris3.5 = iris[iris$Sepal.Width > 3.5, ]
  #write the data for the species setosa to a comma-delimited file names ‘setosa.csv’
setosa = filter(iris, Species == "setosa")
write.table(x=setosa, file = "setosa.csv", row.names = FALSE, col.names = TRUE, sep =",")
  #calculate the mean, minimum, and maximum of Petal.Length for observations from virginica
virginica = filter(iris, Species == "virginica") 
iris %>% summarise(mean = mean(virginica$Petal.Length), minimum = min(virginica$Petal.Length), maximum = max(virginica$Petal.Length))

