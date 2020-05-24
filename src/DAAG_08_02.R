# ex 2

library(DAAG)

# load dataset
data <- head.injury

# perform glm
model_glm <- glm(clinically.important.brain.injury ~ ., 
                 family = binomial(link = "logit"),
                 data = data)

#summary
summary(model_glm)
