\name{M3DropTraditionalDE}
\alias{M3DropTraditionalDE}
\alias{bg__get_mean2disp}
\title{Perform Traditional Differential Expression}
\description{
	Performs traditional (i.e. compare defined groups) differential expression using a negative binomial model with MM zero-inflation.
}
\usage{
	M3DropTraditionalDE(expr_mat, groups, batches=rep(1, times=length(expr_mat[1,])))
	bg__get_mean2disp(expr_mat)
}
\arguments{
  \item{expr_mat}{a numeric matrix of library-size normalized expression values, columns = samples, rows = genes.}
  \item{groups}{a vector of biological group IDs for each cell(columns).}
  \item{batches}{a vector of technical batch IDs for each cell(columns)}
}
\details{
THIS FUNCTION SHOULD BE CONSIDERED UNSTABLE.

\code{M3DropTraditionalDE} Uses a log-likelihood ratio test to perform model selection between a model of constant mean expression vs a model of different mean expression across the biological groups. Probabilities of observing the data given the model are calculated using a zero-inflated negative binomial distribution. Global relationships between mean and dispersion (power-law) as well as mean and dropouts (Michaelis-Menten) for genes are fit independently for each batch. Significance is evaluated using the chi-square distribution.

\code{bg__get_mean2disp} fits a power-law relationship between the squared coefficient of variation and mean expression of each gene, which is used to calculate the expected dispersion parameter for the negative binomial distribution from a given mean expression value.
}
\value{
	\code{M3DropTraditionalDE} : a table of observed mean expression levels for each biological group and each batch with raw p-values and FDR corrected p-values for each gene.
	\code{bg__get_mean2disp} : a function which calculates the expected dispersion given the mean expression.
}
\examples{
library(M3DExampleData)
Normalized_data <- M3DropCleanData(Mmus_example_list$data,
                  labels = Mmus_example_list$labels,
                  is.counts=TRUE, min_detected_genes=2000)
DE_output <- M3DropTraditionalDE(Normalized_data$data[1:100,], Normalized_data$labels)
DE_output_batches <- M3DropTraditionalDE(Normalized_data$data[1:100,], Normalized_data$labels, batches=Normalized_data$labels)
}
\keyword{differential expression}
