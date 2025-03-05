#Question 1

###A###

# possum data read as data frame
possum_data <- read.table("possum.csv",
                      header = TRUE,      
                      sep = ","  )  #Because of data are separated by commas, "," was used in the sep parameter.

#found highest overall length and its gender
highest_length <- possum_data[which.max(possum_data$total.length),] #with which.max function return highest value
gender <- highest_length$sex
print(highest_length)
print(paste("Gender of possum with highest overall lenght:" , gender))

###B###

#A graph was drawn to show the relationship between tail and head length
attach(possum_data)
plot(tail.length, head.length, main = "Relationship Between Tail Length and Head Length",
     xlab = "Tail Length", ylab = "Head Length", type = "n")
#The points in the graph are shown in two separate ways: possums from the Victoria region and those from other regions.
points(tail.length[Pop == "Vic"], head.length[Pop == "Vic"], pch = 16, col = "red")
points(tail.length[Pop != "Vic"], head.length[Pop != "Vic"], pch = 17, col = "blue")

#With the added legend, the group to which the points belong was shown.
legend("topright", legend = c("Victoria", "Other"), pch = 16:17, col = c("red","blue"), cex = 0.7, text.font = 2, bty = "n")

###C###

#The genders with the longest and shortest tail lengths were determined
#Using the tapply() function, tail lengths and total lengths were averaged in a single row and grouped by gender
mean_tail_length <- tapply(possum_data$tail.length, possum_data$sex, mean) 
smallest_tail_gender <- names(mean_tail_length)[which.min(mean_tail_length)] #The column name of the data was returned using the names() function
print(paste("Gender of possum with smallest average tail length:" , smallest_tail_gender))

mean_total_length <- tapply(possum_data$total.length, possum_data$sex, mean)
smallest_total_gender <- names(mean_total_length)[which.min(mean_total_length)] #with which.min function return minimum value
print(paste("Gender of possum with smallest average total length:" , smallest_total_gender))

#analyzes were repeated using dplyr
install.packages("dplyr")
library(dplyr)

possum_genders <- group_by(possum_data, sex) #data grouped by gender

mean_tail <- summarise(possum_genders, mean(tail.length)) #summarized data grouped by the average of tail lengths
smallest_tail <- mean_tail$sex[which.min(mean_tail$`mean(tail.length)`)]
print(mean_tail)
print(paste("Gender of possum with smallest average tail length:" , smallest_tail))


mean_total <- summarise(possum_genders, mean(total.length))#summarized data grouped by the average of total lengths
smallest_total <- mean_total$sex[which.min(mean_total$`mean(total.length)`)]
print(mean_total)
print(paste("Gender of possum with smallest average total length:" , smallest_total))


###D###

#Tail lengths of possums were analyzed according to regions and gender
#In the possum data set, the tail lengths were averaged by giving sex and pop columns as factors, using the tapply() function
mean_tail_Pop_sex <- tapply(possum_data$tail.length, list(possum_data$sex, possum_data$Pop), mean) 
print("Results of mean of tail lengths male and female that from Victoria ans from other regions:" )
print(mean_tail_Pop_sex)

#The operation was carried out by grouping the sex and pop columns in the possum data set using dplyr
possum_Pop_sex <- group_by(possum_data, sex, Pop)
mean_tail_ps <- summarise(possum_Pop_sex, mean(tail.length), .groups = "drop") #The result was returned containing the results with additional information about the groups removed
print("Results of mean of tail lengths male and female that from Victoria ans from other regions with use dplyr:" )
print(mean_tail_ps)

###E###

# Average values were calculated according to regions in the possum dataset
mean_site <- aggregate(possum_data, list(site = possum_data$site), mean, na.rm = TRUE)#Grouping was done for each site
#according to sites with the longest and shortest total length were determined
longest_site <- mean_site[which.max(mean_site$total.length),]
print(paste("Longest possums on average according to site:", longest_site$site))

smallest_site <- mean_site[which.min(mean_site$total.length),]
print(paste("Smallest possums on average according to site:", smallest_site$site))

#A plot was created to observe the relationship of head and tail lengths between groups separated according to sites
plot(mean_site$tail.length, mean_site$head.length, 
     main ="Relationship Between Average Tail Length and Head Length",
     xlab ="Average Tail Length", ylab = "Average Head Length", 
     pch = 16, cex= 0.7 , col = "red" ) 
text(mean_site$tail.length, mean_site$head.length, labels =mean_site$site, pos = 3, cex=0.6)

#analyses repeated using dpylr
mean_site_dplyr <- possum_data %>%
  group_by(site) %>% #grouped by site and averaged
  summarise(across(where(is.numeric), mean, na.rm = TRUE),data_points = n()) #where(is.numeric) function used the average of columns containing only numerical data.
print(mean_site_dplyr)
# Total lengths were filtered with the filter() function and maximum and minimum values were found
longest_site_dplyr <- mean_site_dplyr %>%
  filter(total.length == max(total.length))
print(longest_site_dplyr)

smallest_site_dplyr <- mean_site_dplyr %>%
  filter(total.length == min(total.length))
print(smallest_site_dplyr)

###F###

#The average of the age information in the data set was taken
average_age <- mean(possum_data$age, na.rm = TRUE)

#With the ifelse() and mutate() functions, a column "young" was added for data below the average age and "old" was added for data above the average age.
possum_data_age <- possum_data %>%
  mutate(age.groups = ifelse(age < average_age, "young", "old")) 
print(possum_data_age)
# Checked the maximum skull width of young and old possums
max_skull_width <- possum_data_age %>%
  filter(!is.na(age.groups)) %>%  #NA results that may be present in age data are not included
  group_by(age.groups) %>%
  summarise(max_skull_width = max(skull.width, na.rm = TRUE))
print(max_skull_width)

#The genders of young and old opossums were also grouped and the maximum skull width was checked.
max_skull_width_gender <- possum_data_age %>%
  filter(!is.na(age.groups)) %>%
  group_by(age.groups, sex) %>%
  summarise(max_skull_width = max(skull.width, na.rm = TRUE), .groups = "drop")
print(max_skull_width_gender)



#Question 2 

A <- matrix(c(-3.2, 0, 0.1, 2.4, 7.5,
              0.27, -4.3, -0.03, -0.07, 0,
              -9, 0, 6.2, -1, -1.2), nrow = 3, byrow = TRUE)
print(A)
# With Vectorization 
num_positive <- sum(A > 0) #Positive numbers were summed with the sum() function
abs_value <- ifelse(A < -0.5, abs(A), A) #Numbers less than -0.5 with the ifelse() function and their absolute values were taken.
result_A <- replace(abs_value,  abs_value == 0, -10) #-10 was replaced instead of 0 values in the new matrix
print(result_A)
#Without vectorization
num_pos <- 0
for (i in 1:nrow(A)) { #loop in each row of the matrix
  for (j in 1:ncol(A)) { #loop in each column of the matrix
    if (A[i, j] > 0) { #refers to the index in the matrix
      num_pos<- num_pos + 1 #If the element in the index is positive, it is added to the num_pos variable.
    }
  }
}
print(num_pos)

abs_A <- matrix(0, nrow = nrow(A), ncol = ncol(A)) # absolute value elements were assigned to the new matrix
for (i in 1:nrow(A)) {
  for (j in 1:ncol(A)) {
    if (A[i, j] < -0.5) {
      abs_A[i, j] <- abs(A[i, j]) # If the value in the index is less than 0.5, the absolute value is taken.
    } else {
      abs_A[i, j] <- A[i, j] #otherwise the element remains the same
    }
  }
}
print(abs_A)

result_A_mat <- matrix(0, nrow = nrow(abs_A), ncol = ncol(abs_A))
for (i in 1:nrow(abs_A)) {
  for (j in 1:ncol(abs_A)) {
    if (abs_A[i, j] == 0) {
      result_A_mat[i, j] <- -10 #-10 was replaced instead of 0 values in the new matrix
    } else {
      result_A_mat[i, j] <- abs_A[i, j]
    }
  }
}
print(result_A_mat)