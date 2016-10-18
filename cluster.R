library(datasets)
library(ggplot2)
tutor <- read.csv("online-tutor.csv")
colnames(tutor) <- c("id","height","glasses","score","hint")

data.cluster <- function(Data,Seed,Nclust){
  colnames(Data) <- c("x","y")
  set.seed(Seed)
  data_clust <- kmeans(Data, Nclust)
  data_clust$cluster <- as.factor(data_clust$cluster)
  data_clust_plot <- ggplot(Data, aes(x, y, color = data_clust$cluster)) + geom_point()
  return(data_clust_plot)
}

data3 <- data.frame(tutor$score,tutor$hint)
data.cluster(data3, 30, 3)

#cluster could only due with two dimentions
#this method is to group potention related point