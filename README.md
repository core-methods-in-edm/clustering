# clustering
Clustering example

```{r,eval=FALSE}
#installed ggplot 2
library(ggplot2)
```

```{r,eval=FALSE}
#read the dataset
D1 <- read.csv("~/Desktop/FALL_2016/clustering/online-tutor.csv", header = TRUE, sep = ",")
View(D1)
```

```{r,eval=FALSE}
#looked at how the datasets looked like
head(D1)
```

```{r,eval=FALSE}
#numbed the id (to meaningless numbers)
D1$id <- as.factor(D1$id)
```

```{r,eval=FALSE}
#Running different ggplots to see which seems to have relation
ggplot(D1, aes(height, score, color = glasses)) + geom_point()
ggplot(D1, aes(height, hints, color = glasses)) + geom_point()
ggplot(D1, aes(score, hints, color = glasses)) + geom_point()
```

```{r,eval=FALSE}
#just randomly ran plot fuction and figured out there might be more centered relationship between height,score/ height,hints/ and score,hints
Cluster1<-kmeans(D1,4)
plot(D1, pch = Cluster1$cluster)
```
```{r,eval=FALSE}
#meanwhile redownloaded cluster package
install.packages("cluster")
library(cluster)
#just watned to see how each variables are distributed so ran the plots for each variables
plot(D1$height)
plot(D1$glasses)
plot(D1$score)
plot(D1$hints)
seems all centered...
```
```{r,eval=FALSE}
#Removed the id variable and scaled it; created new dataset D2
D2<-scale(D1[,-1])
View(D2)
fit <- kmeans(D2,5)
summary(fit)
fit$centers
head(D1)
```
```{r,eval=FALSE}
#after centering and comparing with original data,no interesting relationship on the plot coming up
plot(D1$height,D2[,1])
plot(D1$height,D2[,3])
plot(D1$height,D2[,4])
```
```{r,eval=FALSE}
#saw what information is in each cluster and how much information is in each cluster
fit$cluster
fit$size
```
```{r,eval=FALSE}
#tmp01 <-as.data.frame(fit$centers)
View(tmp01)
plot(tmp01$height,tmp01$score)
plot(tmp01$height,tmp01$hints)
plot(tmp01$score,tmp01$hints)
> cor(tmp01$score,tmp01$hints)
[1] -0.05590473
> cor(tmp01$height,tmp01$score)
[1] 0.03893907
> cor(tmp01$height,tmp01$hints)
[1] -0.07791537
the plots and the correlation result suggests that score and hints, height and hints have negative relationship and height and score have positive relationship but both of them in mariginal correlation.
```
```{r,eval=FALSE}
# and ended up in this clusterplot code and ran it
clusplot(D2, clust$cluster, color=TRUE, shade=TRUE,labels=13, lines=0)
```
