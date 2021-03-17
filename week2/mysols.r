normData <- rnorm(10000,0,1)

median(normData)
mean(normData)
sd(normData)

cutoff <- median(normData) + 3 * mad(normData)
uniData <- runif(1000, min = 0, max = 1)

simData <- rnorm(1000,0,)

x <- c(8,3,3,7,15,9,12,4,9,10,5,1)
m <- matrix(x,6,2)
colnames(m) <- c("c1", "c2")
col <- seq(1,12,2)
m = cbind(m,col)
m[1,] = sort(m[1,])

rand.Circle = function(n,x_0=0,y_0=0,r) {
    theta = 2 * pi * runif(n,0,1);
    x = x_0 + r * cos(theta)
    y = y_0 + r * sin(theta)

    return (cbind(x,y))
}

plot(rand.Circle(50,0,0,0.8))
