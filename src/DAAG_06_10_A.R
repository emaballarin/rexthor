library(MPV)
library(lattice)

dataset <- table.b3

par(mfrow=c(1,1))
plot_fit <- function(fitted_model, x, y, xlab, subtitle){
  plot(x, y, main = "fitted model", xlab = xlab, sub = subtitle)
  lines(x, as.vector(fitted_model$fitted.values), col ="red")
  text(13,3, "y = b0+b1*x", col="red")
}

# scatter plot
plot(dataset$x1, dataset$y, main="Scatterplot x1 versus y",
     xlab="x_1 (displacement)", ylab="y (mpg)", pch=19)