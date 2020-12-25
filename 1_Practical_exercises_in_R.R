# 1.9 Практические задания на R

# 1
# NA_position <- function(x, y){
#   all(is.na(x) == is.na(y))
# }

# 2
# smart_test <-  function(x){
#   t <- table(x)
#   if (min(t) >= 5){
#     chi <- chisq.test(t)
#     print(c(chi$statistic, chi$parameter, chi$p.value))
#   }else {
#     fisher.test(t)[1]
#   }
# }

# 3
# most_significant <-  function(x){
#   vec <- as.vector(x)
#   sap <- sapply(vec,  function(vec) chisq.test(table(vec))$p.value)
#   return(names(sap[sap==min(sap)]))
# }

# 4
# dat <- iris[, 1:4]
# means <-colMeans(dat)
# t_f <- t(t(dat)>means)
# rowss <- rowSums(t_f)
# iris$important_cases <- factor(ifelse(rowss>=3,"Yes","No"))

# 5
# get_important_cases <- function(x){
#   means <- colMeans(x)
#   t_f <- t(t(x)>means)
#   rowss <- rowSums(t_f)
#   x$important_cases <- factor(ifelse(rowss>=ncol(x)%/%2+1,"Yes","No"))
#   return(x)
# }

# 6
# stat_mode <- function(x){
#   tablo <- table(x)
#   return(as.numeric(names(tablo[tablo == max(tablo)])))
# }

# 7
# max_resid <- function(x){
#   chi_t <- chisq.test(table(x))$stdres
#   ind <-  which(chi_t == max(chi_t), arr.ind = T)
#   return(c(rownames(ind), rownames(t(chi_t))[ind[2]]))
# }

# 8 (Цвета у графика не те, что в задании, но так даже лучше)
# library("ggplot2")
# ggplot(diamonds,aes(x = color, fill = cut))+
#   geom_bar(position = "dodge")