library('praznik')
library(dplyr)
library(caret)

data = read.csv(file = 'data.csv', header=TRUE)

labels = data[, ncol(data), drop = FALSE]
labels = as.factor(labels$target)

X = data[,-ncol(data)]

# normalizing data
ss <- preProcess(as.data.frame(X), method=c("range"))

X <- predict(ss, as.data.frame(X))
X <- X[,-1]

# Run mrmr
res = MRMR(X,labels,100)

print(res$selection)

for (i in 1:length(res$selection)){
  print(res$selection[i][1])
  print(res$score[i][1])
}
