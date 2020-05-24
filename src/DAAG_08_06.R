# LIBRARIES:
library(MASS)       # For the confint package (using prof. likelihood; cfr. Richard, 2013)
library(lattice)
library(DAAG)


x_grid <- seq(from=0.00, to=1.00, by=0.01)


# (a) Generation
poiss_a <- DAAG::poissonsim(x_grid, a = 2, b = -4)

# (a) Fit
poiss_a_fit <- glm(poiss_a$y~poiss_a$x, family = poisson)                       # Poisson

print("POISSON OVER POISSON:")
summary(poiss_a_fit)
confint(poiss_a_fit)
print("# # # # # #")



# # #

# (b) Generation
poiss_b <- DAAG::poissonsim(x_grid, a = 2, b = -4, slope.sd = 4)

# (b) Fit
poiss_b_fit  <- glm(poiss_b$y~poiss_b$x, family = poisson)                      # Poisson
qpoiss_b_fit <- glm(poiss_b$y~poiss_b$x, family = quasipoisson)                 # QuasiPoisson

print("POISSON OVER DISPERSED POISSON:")
summary(poiss_b_fit)
confint(poiss_b_fit)
print("# # # # # #")

print("QUASIPOISSON OVER DISPERSED POISSON:")
summary(qpoiss_b_fit)
confint(qpoiss_b_fit)
print("# # # # # #")
