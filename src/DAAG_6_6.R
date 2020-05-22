# LIBRARIES:
library(lattice)
library(DAAG)

# DATA:
data(nihills)


# Fit models (no row removal)
nihills_lm1 <- lm(time ~ dist+climb,            data=nihills)
nihills_lm2 <- lm(time ~ dist+climb+dist:climb, data=nihills)

# ANOVA (no row removal)
anova(nihills_lm1, nihills_lm2)



# Remove some "problematic" datapoints!
rows_to_remove <- c("Seven Sevens")
nihills_pruned <- nihills[!(row.names(nihills) %in% rows_to_remove),]


# Fit models (1-row removal)
nihills_lm1_pruned <- lm(time ~ dist+climb,            data=nihills_pruned)
nihills_lm2_pruned <- lm(time ~ dist+climb+dist:climb, data=nihills_pruned)

# ANOVA (1-row removal)
anova(nihills_lm1_pruned, nihills_lm2_pruned)



# Once we learned the trick, we wanted to do it once more ;)


# Remove some "problematic" datapoints!
rows_to_remove      <- c("Seven Sevens", "Annalong Horseshoe")
nihills_pruned_more <- nihills[!(row.names(nihills) %in% rows_to_remove),]


# Fit models (2-row removal)
nihills_lm1_pruned_more <- lm(time ~ dist+climb,            data=nihills_pruned)
nihills_lm2_pruned_more <- lm(time ~ dist+climb+dist:climb, data=nihills_pruned)

# ANOVA (2-row removal)
anova(nihills_lm1_pruned_more, nihills_lm2_pruned_more)



# MEMENTO: Logarithmic transform is your friend.
