\name{M3D_Clean_Data}
\alias{M3D_Clean_Data}
\title{Filter Expression Data}
\description{
	Removes low quality cells and undetected genes, and normalizes counts to counts per million. 
}
\usage{M3D_Clean_Data(expr_mat, labels = NA, is.counts = TRUE, suppress.plot = FALSE, pseudo_genes = NA, min_detected_genes = NA)}
\arguments{
  \item{expr_mat}{a numeric matrix of expression values, columns = samples, rows = genes.}
  \item{labels}{a vector of length equal to the number of columns of expr_mat with names or group IDs for each cell.}
  \item{is.counts}{logical, whether the provided data is unnormalized read/fragment counts}
  \item{suppress.plot}{logical, whether to plot the distribution of number of detected genes per cell.}
  \item{pseudo_genes}{a vector of gene names of known pseudogenes which will be removed from the cleaned data.}
  \item{min_detected_genes}{minimum number of genes/cell for a cell to be included in the cleaned data.}
}
\details{Retains genes detected (expression>0) in more than 3 cells and with mean normalized expression >= 10^-5. If min_detected_genes is defined all cells not reaching the threshold are removed. Otherwise, fits a normal distribution to the distribution of detected genes/cell and removes those cells with significantly few detected genes (FDR 5\%). This fit is plotted for visual inspection. If is.counts==TRUE then each column is converted to counts per million (ignoring ercc spike-ins if present).}
\value{list with elements: data, the normalized filtered expression matrix; and labels, labels of the remaining cells.}
\examples{
  M3D_Clean_Data(Test_Cleaned$data, Test_Cleaned$labels, is.counts=FALSE, min_detected_genes=2000)
}
\seealso{bg__filter_cells}
\keyword{normalization, quality control}