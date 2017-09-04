# loads csv file
oilData <- read.csv("./tarea3.csv")

# attaches database to R search path
attach(oilData)

# ---------------------
# auto multiple linear regression calc


#fit linear model (no need for normalizing intercept x0)
lm(formula = y ~ x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8, data = subset(oilData, 
                                                                      X...year <= 2001))

# ---------------------
# manual multiple linear regression calc

# Data for training
trainingData <- subset(oilData, X...year <= 2001)

# Get X
varsToExcludeForX <- names(trainingData) %in% c("X...year", "y")
XData <- trainingData[!varsToExcludeForX]
X <- as.matrix(sapply(XData, as.numeric)) 

# Get Y
YData <- trainingData["y"]
Y <- as.matrix(sapply(YData, as.numeric))

# calculation
Xt = t(X)
XtX = Xt %*% X
XtXdet = det(XtX)

if (XtXdet != 0) {
  XtXInv = solve(XtX)
  XtXInvXt = XtXInv %*% Xt
  B = XtXInvXt %*% Y
  print(B)
} else {
  print("No existe matriz pseudoinversa de Moore-Penrose.")
}
