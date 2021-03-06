library(xts)
library(forecast)
library(fpp)
library(rucm)
data <- list()
data[["Top N Complaints"]] <- "/home/samarth/workspaces/datakind-workspace/analytics/time-series/data/topNComplaints"

loadData <- function(dataFolder) {
  files <- list.files(dataFolder)
  data <- list()
  for(file in files) {    
    df <- read.csv(paste0(dataFolder, "/", file), stringsAsFactors=F)    
    minYear <- min(df$Year)
    complaintType <- substr(file,1,(nchar(file))-4)    
    tsObject <- ts(df$Complaints, start=c(minYear, 1), frequency = 12)
    data[[complaintType]] <- tsObject
  }
  data
}

datasets <- list()
for(d in names(data)) {
  location <- data[[d]]
  print(paste0("Loading data ", d, "from location ", location))
  one <- loadData(location)
  for(t in names(one)) {
    datasets[[paste0(d, " - ", t)]] <- one[[t]]
  }
}