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
judge_function_1 <- function(patient, threshold){
  n_coeff <- length(model_glm$coefficients) # number of estimated coefficients
  
  p <- model_glm$coefficients[1] + patient %*% model_glm$coefficients[2:n_coeff]
  logistic_prob <- exp(p) / (1 + exp(p))
  
  return(logistic_prob < threshold) # return the if condition on the threshold
}

judge_function_2 <- function(patient, threshold){
  logit <-log(threshold/(1 - threshold))
  intercept <- model_glm$coefficients[1]
  
  CT_data <- data.frame("patient" = patient, "coeff" = model_glm$coefficients[-1]); print(CT_data)
  CT_rule <- data.frame("CT_threshold" = logit - intercept, 
                        "Patient_risk" = patient %*% model_glm$coefficients[-1], 
                        "CT" = patient %*% model_glm$coefficients[-1] > logit - intercept)
  rownames(CT_rule) <- NULL; print(CT_rule)
  
  return(!CT_rule$CT)
}

# check correctness of the judge function
x <-  sapply(data,'[[', 1)[-11] # a possible patient

if(judge_function_2(patient = x, threshold = 0.025)){
#if(judge_function_1(patient = x, threshold = 0.025)){
  print("Patient should not being sent to CT")
}else{
  print("Patient should being sent to CT")
}

