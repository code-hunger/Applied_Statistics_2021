square.approx.Pi <- function (trials) {
    x = runif(trials, min = -1, max = +1)
    y = runif(trials, min = -1, max = +1)

    m = matrix(c(x,y),,2)
    inner = m[m[,1] ^2 + m[,2]^2 <= 1]
    outer = m[m[,1] ^2 + m[,2]^2 > 1]
    plot(matrix(outer,,2), col = "red")
    points(matrix(inner,,2), col = "green")

    return (4*sum(sqrt(x^2 + y^2) <= 1)/trials)
}

square.approx.Pi(5000)
