#basic statistical analysis for first git trial run

#import iris data set
iris
#select sepal length
iris$Sepal.Length
#assign data to new variable
x<-iris$Sepal.Length
#mean and median of sepal length
mean(x)
median(x)
#pearson's correlation between sepal length and petal length
cor(iris$Sepal.Length,iris$Petal.Length, method="pearson")
#plot out the data
plot(iris$Sepal.Length,iris$Petal.Length)
#hence strong positive correlation between the two
#linear regression model
model<-lm(iris$Petal.Length~iris$Sepal.Length,data=iris)
summary(model)
plot(iris$Sepal.Length,iris$Petal.Length)
abline(lm(iris$Petal.Length~iris$Sepal.Length,data=iris))
#data not near abline in plot
#r^2=.75, predictors explain 75% of the variation
#comparison t-test
data1<-subset(iris$Petal.Length,iris$Species=="setosa")
data2<-subset(iris$Petal.Length,iris$Species=="virginica")
t.test(data1,data2)
#ANOVA
anova.model<-aov(iris$Petal.Length~iris$Species,data=iris)
summary(anova.model)
#p-value very low, conclude there is significant difference
#visualisation: heatmap with hierarchical clustering
install.packages("pheatmap")
library(pheatmap)
pheatmap(iris,
         cluster_rows=TRUE,
         cluster_cols=TRUE,
         clustering_method="complete")
#sepal width and petal length are more closely related
#sepal length is farthest from the other parameters
#visualisation: principle component analysis with FactorMineR
install.packages(c("FactorMineR","factoextra"))
library(FactoMineR)
library(factoextra)
iris.pca<-PCA(iris,scale.unit=TRUE,ncp=5)
fviz_pca_ind(iris.pca,col.ind=iris$Species)
#versicolor and virginia are close in terms of flower pattern while setosa is further away

