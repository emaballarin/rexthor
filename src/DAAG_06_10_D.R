# x7 versus residuals
par(mfrow=c(1,2))
plot(dataset[dataset$x11 == 0, ]$x7, 
     fitted_model_x7_1$residuals, main="Scatterplot x7 versus Residuals",
     xlab="x7", ylab="Residuals", pch=19) 

plot(dataset[dataset$x11 == 1, ]$x7, 
     fitted_model_x7_2$residuals, main="Scatterplot x7 versus Residuals",
     xlab="x7", ylab="Residuals", pch=19)