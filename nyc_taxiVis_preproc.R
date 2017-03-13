setwd("~/Desktop/GitHub/taxiVis/data/")
rm(list = ls())

# load libraries
library(data.table)
library(dplyr)

# create fuc for converting .csv to .rds
csv_to_rds <- function(csv_path, rds_path, overwrite = FALSE) {
  if(!overwrite && file.exists(rds_path)) {
    cat(rds_path, "exists,", csv_path, "skipped")
  } else {
    taxi_data <- fread(csv_path,
                       sep = ",",
                       header = TRUE,
                       # Only select time, geo, passengerNum
                       select = c(2,3,4,6,7,10,11))  
    saveRDS(object = taxi_data, 
            file = rds_path)
    rm(taxi_data)
    cat("saved", csv_path, "as", rds_path)
  }
}

# iterate .csv and save in .rds
for(csv_path in dir()[grepl("yellow_tripdata_", dir())]) {
  rds_path = sub(pattern = "yellow_tripdata", 
                 replacement = "taxi", 
                 x = sub(pattern = ".csv", 
                         replacement = ".rds", 
                         x = csv_path))
  csv_to_rds(csv_path = csv_path,
             rds_path = rds_path)
}
