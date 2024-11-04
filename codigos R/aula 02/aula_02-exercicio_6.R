library(dplyr)

data(iris)

# Probabilidade a priori: P(Versicolor) ------------------------------

prob_priori <- iris %>%
  filter(Species == 'versicolor') %>%
  nrow() / nrow(iris)

# ou usando base R

prob_priori <- sum(iris$Species == 'versicolor') / nrow(iris)

# Probabilidade a priori: P(Sepal.width < 2.7)----------------------------------

prob_sepal_width <- sum(iris$Sepal.Width < 2.7) / nrow(iris)

# Probabilidade condicional: P(Sepal.width < 2.7 | Versicolor) -----------------

prob_cond_sepal_width_given_versicolor <- sum(iris$Species == 'versicolor' & iris$Sepal.Width < 2.7) / sum(iris$Species == 'versicolor')

# Aplicando o Teorema de Bayes
prob_conditional <- (prob_cond_sepal_width_given_versicolor * prob_priori) / prob_sepal_width

# Exibindo o resultado
cat("P(Species = Versicolor | Sepal.width < 2.7) =", prob_conditional, "\n")
