# ex 2

library(DAAG)

# load dataset
data <- head.injury

# exploiting data
str(data)
summary(data)

# perform glm
model_glm <- glm(clinically.important.brain.injury ~ ., 
                 family = binomial(link = "logit"),
                 data = data)

#summary
summary(model_glm)

# turn the result into a decision rule for use of CT
judge_function <- function(patient, threshold){
  n_coeff <- length(model_glm$coefficients) # number of estimated coefficients
  
  p <- model_glm$coefficients[1] + patient %*% model_glm$coefficients[2:n_coeff]
  logistic_prob <- exp(p) / (1 + exp(p))
  
  return(logistic_prob < threshold) # return the if condition on the threshold
}

# check correctness of the judge function
x <-  sapply(data,'[[', 1)[-11] # a possible patient

if(judge_function(patient = x, threshold = 0.025)){
  print("Patient should not being sent to CT")
}else{
  print("Patient should being sent to CT")
}
