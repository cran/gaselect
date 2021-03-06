% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fitness.R
\name{fitness}
\alias{fitness}
\title{Get the fitness of a variable subset}
\usage{
fitness(object)
}
\arguments{
\item{object}{The \code{\link{GenAlg}} object returned by \code{\link{genAlg}}}
}
\value{
A vector with the estimated fitness for each solution
}
\description{
Get the internal fitness for all variable subsets
}
\details{
This method is used to get the fitness of all variable subsets
found by the genetic algorithm.
}
\examples{
ctrl <- genAlgControl(populationSize = 100, numGenerations = 15, minVariables = 5,
    maxVariables = 12, verbosity = 1)

evaluator <- evaluatorPLS(numReplications = 2, innerSegments = 7, testSetSize = 0.4,
    numThreads = 1)

# Generate demo-data
set.seed(12345)
X <- matrix(rnorm(10000, sd = 1:5), ncol = 50, byrow = TRUE)
y <- drop(-1.2 + rowSums(X[, seq(1, 43, length = 8)]) + rnorm(nrow(X), 1.5));

result <- genAlg(y, X, control = ctrl, evaluator = evaluator, seed = 123)

fitness(result) # Get fitness of the found subsets

h <- fitnessEvolution(result) # Get average fitness as well as the fitness of the
                              # best chromosome for each generation (at raw scale!)

plot(h[, "mean"], type = "l", col = 1, ylim = c(-7, -1))
lines(h[, "mean"] - h[, "std.dev"], type = "l", col = "gray30", lty = 2)
lines(h[, "mean"] + h[, "std.dev"], type = "l", col = "gray30", lty = 2)
lines(h[, "best"], type = "l", col = 2)
}
