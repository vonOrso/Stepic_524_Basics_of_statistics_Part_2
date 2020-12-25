# 2.8 Практические задания на R

# 1
# get_coefficients <- function(dataset){
#   return(exp(glm(y~x,data = dataset,family = "binomial")$coef))
# }

# 2
# centered <- function(test_data, var_names){
#   means <- colMeans(test_data[var_names])
#   transp <- t(t(test_data[var_names])-means)
#   test_data[var_names] <- transp
#   return(test_data)
# }

# 3
# get_features <- function(dataset){
#   dataset$is_prohibited <- factor(dataset$is_prohibited)
#   dataset$type <- factor(dataset$type)
#   fit <- glm(is_prohibited ~ ., data = dataset, family = "binomial")
#   result <- anova(fit, test = "Chisq")[5]
#   otvet <- rownames(result)[result<0.05 & is.na(result)!=T]
#   if (length(otvet)==0){
#     return("Prediction makes no sense")
#   } else{
#     return(otvet)
#   }
# }

# 4
# most_suspicious <- function(test_data, data_for_predict){
#   fit <- glm(is_prohibited ~ ., data = test_data, family = "binomial")
#   pred <- exp(predict(fit,data_for_predict))
#   return(data_for_predict$passangers[c(which.max(pred))])
# }

# 5
# normality_test <- function(dataset){
#   return(unlist(sapply(dataset[sapply(dataset, is.numeric)], shapiro.test)["p.value",]))
# }

# 6
# smart_anova <- function(test_data){
#   nm <- names(table(test_data$y))
#   oden <- test_data$x[test_data$y == nm[1]]
#   dva <- test_data$x[test_data$y == nm[2]]
#   tre <- test_data$x[test_data$y == nm[3]]
#   
#   tes <- all(c(shapiro.test(oden)$p > 0.05,
#                shapiro.test(dva)$p > 0.05,
#                shapiro.test(tre)$p > 0.05,
#                bartlett.test(x ~ y, test_data)$p.value > 0.05) == T)
#   
#   if (tes == T){
#     fit <- aov(x ~ y, test_data)
#     p <- summary(fit)[[1]]$'Pr(>F)'[1]
#     names(p) <- "ANOVA"
#     return(p)
#   } else{
#     p <- kruskal.test(x ~ y, test_data)$p.value
#     names(p) <- "KW"
#     return(p)
#   }
# }

# 7
# library(dplyr)
# normality_by <- function(test){
#   nm <- names(test)
#   tabl <- test %>%
#     group_by(y, z) %>%
#     summarise(shapiro.test(x)$p)
#   names(tabl) <- c(nm[2],nm[3],"p_value")
#   return(tabl)
# }

# 8
# library(ggplot2)
# ggplot(iris, aes(Sepal.Length))+
#   geom_density(aes(fill = Species),alpha = 0.2)
