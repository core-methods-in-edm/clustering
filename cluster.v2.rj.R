library(cluster)

### opening the dataset in the csv ###
OT1 <- read.csv("online-tutor.csv")

### the column for ID sense we're looking for feature groupings not predicting anything ####

OT2 <- OT1
OT2 <- OT1$id <- NULL

# standardize variables
OT2 <- scale(OT2) 

OTR <- kmeans(OT2, 4,)



