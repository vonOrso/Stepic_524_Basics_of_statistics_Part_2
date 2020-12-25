# 3.6 Практические задания на R

# 1
# smart_hclust<-  function(test_data, cluster_number){
#   matr <- dist(test_data, method = "euclidean", diag = FALSE, upper = FALSE, p = 2)
#   fit <- hclust(matr, method = "complete", members = NULL)
#   test_data$cluster <- factor(cutree(fit, cluster_number))
#   return(test_data)
# }

# 2
# get_difference<-  function(test_data, n_cluster){
#   matr <- dist(test_data, method = "euclidean", diag = FALSE, upper = FALSE, p = 2)
#   fit <- hclust(matr, method = "complete", members = NULL)
#   cluster <- factor(cutree(fit, n_cluster))
#   pe <- apply(X = test_data, MARGIN = 2, FUN = function(x){anova(aov(x ~ cluster, test_data))$P[1]})
#   return(names(which(pe < 0.05)))
# }

# 3
# get_pc <- function(d){
#   xs <- prcomp(d)$x
#   d$PC1 <- xs[,1]
#   d$PC2 <- xs[,2]
#   return(d)
# }

# 4
# library(dplyr)
# get_pca2 <- function(data){
#   fit <- prcomp(data)
#   cumulative <- summary(fit)$importance[3,]
#   nums <- min(which((cumulative >= 0.9) == TRUE))
#   pcs <- as.data.frame(fit$x) %>% select(1:nums)
#   return(cbind(data, pcs))
# }

# 5
# is_multicol <- function(d){
#   corel <- cor(d)
#   diag(corel) <- 0
#   abss <- abs(corel)
#   truesi <- round(abss, digits = 2) == 1
#   rows <- rownames(which(truesi, arr.ind = T))
#   len <- length(rows)
#   if (len!=0){
#     return(rows)
#   }else{
#     return("There is no collinearity in the data")
#   }
# }

# 6
# library(ggplot2)
# 
# smart_hclust<-  function(test_data, cluster_number){
#   matr <- dist(test_data, method = "euclidean", diag = FALSE, upper = FALSE, p = 2)
#   fit <- hclust(matr, method = "complete", members = NULL)
#   test_data$cluster <- factor(cutree(fit, cluster_number))
#   return(test_data)
# }
# 
# swiss <- smart_hclust(swiss,2)
# my_plot <- ggplot(swiss, aes(Education, Catholic, col = cluster))+
#   geom_smooth(method = lm, formula = y~x)+
#   geom_point()
