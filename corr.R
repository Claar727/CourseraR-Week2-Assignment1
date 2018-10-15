corr <- function(directory, threshold = 0) {
  filelist <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
  vector_of_corrs <- numeric()
  num_comp <- complete(directory)
  num_comp <- num_comp[num_comp$nobs >= threshold,]
  for (i in num_comp$id) {
    data <- read.csv(filelist[i])
    vector_of_corrs <- c(vector_of_corrs, cor(data$sulfate, data$nitrate, use = "pairwise.complete.obs"))
  }
  vector_of_corrs
}

