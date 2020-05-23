# LIBRARIES:
library(lattice)
library(DAAG)


x_grid <- seq(from=0.00, to=1.00, by=0.01)


# (a) Generation
poiss_a <- DAAG::poissonsim(x_grid, a = 2, b = -4)

# (a) Fit
poiss_a_fit <- glm(poiss_a$y~poiss_a$x, family = poisson)                       # Poisson
summary(poiss_a_fit)


# # #

# (b) Generation
poiss_b <- DAAG::poissonsim(x_grid, a = 2, b = -4, slope.sd = 5)

# (b) Fit
poiss_b_fit  <- glm(poiss_b$y~poiss_b$x, family = poisson)                      # Poisson
qpoiss_b_fit <- glm(poiss_b$y~poiss_b$x, family = quasipoisson(link = log))     # QuasiPoisson

summary(poiss_b_fit)
summary(qpoiss_b_fit)
