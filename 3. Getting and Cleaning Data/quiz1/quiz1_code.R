#The American Community Survey distributes downloadable data about 
#United States communities. Download the 2006 microdata survey about 
#housing for the state of Idaho using download.file() from here: 
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 
#and load the data into R.

#How many housing units in this survey were worth more than $1,000,000?
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

fileName <- "data_hid.csv"

if(! file.exists("data_hid.csv"))
{
  download.file(fileURL, destfile=fileName)

  dateDownloaded <- date()
}

file <- read.csv(file=fileName, header=TRUE)

VAL_column <- file[,'VAL']

VAL_table <- table(VAL_column)

more_than_1million <- VAL_table[names(VAL_table) == 24]




#Download the Excel spreadsheet on Natural Gas Aquisition Program here: 
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx 
#Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:
#  dat 
#What is the value of:
#  sum(dat$Zip*dat$Ext,na.rm=T) 

library(xlsx)

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"

fileName <- "DATA.gov_NGAP.xlsx"

if(! file.exists(fileName))
{
  download.file(fileURL, destfile=fileName)
  
  dateDownloaded <- date()
}

dat <- read.xlsx(fileName, sheetIndex=1, header=TRUE)







