#Read the data file

csv_data <- read.csv("hw1_data.csv")


#Extract the first 2 rows of the data frame and print them to the console

first_two_rows <- head(csv_data,2)


#How many observations (i.e. rows) are in this data frame?

num_rows <- nrow(csv_data)


#Extract the last 2 rows of the data frame and print them to the console

last_two_rows <- tail(csv_data,2)


#What is the value of Ozone in the 47th row?

value <- csv_data[47,1]


#How many missing values are in the Ozone column of this data frame?

ozone <- csv_data[,1]

missing_count <- sum( is.na( ozone ) )


#What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.

bad <- is.na(ozone)

ozone_without_na <- ozone[!bad]

mean_ozone <- mean(ozone_without_na)


#Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?

column_means <- colMeans(subset(csv_data,(Ozone > 31 & Temp > 90)))

mean_solar <- column_means[2]


#What is the mean of "Temp" when "Month" is equal to 6?

column_means <- colMeans(subset(csv_data,(Month == 6)))

mean_temp <- column_means[4]


#What was the maximum ozone value in the month of May (i.e. Month = 5)?

columns <- subset(csv_data,(Month == 5))

tmp <- na.omit(columns)

max_ozone <- max(tmp[1])

