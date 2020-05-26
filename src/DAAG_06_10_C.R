# fit models according the group x11: y = beta_0 + beta_1 * x1 + eps
fitted_model_x1_1 <- lm(y ~ x1, data = dataset[dataset$x11 == 0, ])
fitted_model_x1_2 <- lm(y ~ x1, data = dataset[dataset$x11 == 1, ])

# diagnostics
summary(fitted_model_x1_1) # group x11 = 0
summary(fitted_model_x1_2) # group x11 = 1

# residuals plots group x11 = 0
par(mfrow=c(2,2))
plot(fitted_model_x1_1)

# residuals plots group x11 = 1
par(mfrow=c(2,2))
plot(fitted_model_x1_2)

# fitted model plots
par(mfrow=c(1,2))
plot_fit(fitted_model_x1_1, 
         dataset[dataset$x11 == 0, ]$x1, 
         dataset[dataset$x11 == 0, ]$y, 
         xlab = "x1", 
         subtitle = "group x11 = 0")

# the plot of the fitted model shows us that the linear regressor could be a 
# reasonable regressor, moreover the observation with small x1 could be the 
# critical point of the residual vs laverage analysis and it could be an
# outlier because by removing it from, the fitted model should be the same.

plot_fit(fitted_model_x1_2, 
         dataset[dataset$x11 == 1, ]$x1, 
         dataset[dataset$x11 == 1, ]$y,
         xlab = "x1", 
         subtitle = "group x11 = 1")

# the fitted model looks quite good!

###

# fit models according the group x11: y = beta_0 + beta_1 * x7 + eps
fitted_model_x7_1 <- lm(y ~ x7, data = dataset[dataset$x11 == 0, ])
fitted_model_x7_2 <- lm(y ~ x7, data = dataset[dataset$x11 == 1, ])

# diagnostics
summary(fitted_model_x7_1) # group x11 = 0
summary(fitted_model_x7_2) # group x11 = 1

# residuals plots group x11 = 0
par(mfrow=c(2,2))
plot(fitted_model_x7_1)

# residuals plots group x11 = 1
par(mfrow=c(2,2))
plot(fitted_model_x7_2)

# fitted model plots
par(mfrow=c(1,2))
plot_fit(fitted_model_x7_1, 
         dataset[dataset$x11 == 0, ]$x7, 
         dataset[dataset$x11 == 0, ]$y,
         xlab = "x7", 
         subtitle = "group x11 = 0")

plot_fit(fitted_model_x7_2, 
         dataset[dataset$x11 == 1, ]$x7, 
         dataset[dataset$x11 == 1, ]$y,
         xlab = "x7", 
         subtitle = "group x11 = 1")