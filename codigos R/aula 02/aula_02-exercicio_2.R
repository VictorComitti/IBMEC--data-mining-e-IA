library(dplyr)

data(iris)

iris

n_sepal_width <- iris %>%
  filter(Sepal.Width > 3.2) %>%
  nrow()

prob_sepal_width <- n_sepal_width/nrow(iris)
n_sepal_width
n_petal_length <- iris %>%
  filter(Petal.Length < 1.5) %>%
  nrow()


prob_petal_length <- n_petal_length/nrow(iris)



