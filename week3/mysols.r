# Task 1
in.circle <- function (x, y, r) {
    return (x^2 + y^2 <= r)
}

square.approx.Pi <- function (trials) {
    x = runif(trials, min = -1, max = +1)
    y = runif(trials, min = -1, max = +1)

    m = matrix(c(x,y),,2)
    inner = m[in.circle(m[,1], m[,2], 1)]
    outer = m[!in.circle(m[,1], m[,2], 1)]
    plot(matrix(outer,,2), col = "red")
    points(matrix(inner,,2), col = "green")

    return (4*sum(in.circle(x,y,1))/trials)
}

square.approx.Pi(5000)

# Task 2

data(sleep)

group1 = sleep$extra[sleep$group == 1]
group2 = sleep$extra[sleep$group == 2]

count.plus = sum(group1 - group2 >= 0)
binom.test(count.plus, 10, p = 0.5)

# Task 3
data(pi2000, package ="UsingR")
barplot(table(pi2000) / 2e3)
abline(1 / 10, 0)
