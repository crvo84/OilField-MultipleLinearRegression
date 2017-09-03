# loads csv file
oilData <- read.csv("./tarea3.csv")

# attaches database to R search path
attach(oilData)

#fit linear model
lm(formula = y ~ x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8, data = subset(oilData, 
                                                                      X...year <= 2001))
