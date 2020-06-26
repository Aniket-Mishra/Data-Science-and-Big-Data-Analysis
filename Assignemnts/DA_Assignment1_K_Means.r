getwd()
library(ggplot2)

#set dataset to a dataframe
yearly_sales_data <- read.csv('yearly_sales.csv',row.names<-1)

#convert characters in gender to numeric
yearly_sales_data$gender <- ifelse(yearly_sales_data$gender == 'M', 1, 0)

#view the dataset
View(yearly_sales_data)

#view graphs
ggplot(yearly_sales_data)

#get internal structure of the dataframe
str(yearly_sales_data)

#summary of dataframe
summary(yearly_sales_data)

#Plotting Graphs
plot(yearly_sales_data$sales_total, yearly_sales_data$num_of_orders)


#calculating optimal number of clusters
k.max = 10
wss <-rep(NA,k.max)
n_clusters <- list()
for(i in 1:k.max){
  drive_classes <- kmeans(yearly_sales_data, i)
  wss[i] <- drive_classes$tot.withinss
  n_clusters[[i]] <- drive_classes$size
}
plot(1:k.max, wss, type='b', xlab='No. Of Clusters', ylab="Sum Of Squares: Sales")

#applying kmeans on dataframe
sales_data <- kmeans(yearly_sales_data, 2)

#viewing clustering information
sales_data