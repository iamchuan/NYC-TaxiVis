setwd("~/Workspace/flexdashboard/taxiVis/data/")
rm(list = ls())
library(data.table)
library(dplyr)

csv_to_rds <- function(csv_path, rds_path, overwrite = FALSE) {
  if(!overwrite && file.exists(rds_path)) {
    cat(rds_path, "exists,", csv_path, "skipped")
  } else {
    taxi_data <- fread(csv_path,
                       sep = ",",
                       header = TRUE,
                       select = c(2,3,4,6,7,10,11))
    saveRDS(object = taxi_data, 
            file = rds_path)
    rm(taxi_data)
    cat("saved", csv_path, "as", rds_path)
  }
}

for(csv_path in dir()[grepl("yellow_tripdata_", dir())]) {
  rds_path = sub(pattern = "yellow_tripdata", 
                 replacement = "taxi", 
                 x = sub(pattern = ".csv", 
                         replacement = ".rds", 
                         x = csv_path))
  csv_to_rds(csv_path = csv_path,
             rds_path = rds_path)
}

taxidata[,tpep_pickup_datetime := as.POSIXct(taxidata$tpep_pickup_datetime[1:100])]


%>%
  setkey(, tpep_pickup_datetime)
