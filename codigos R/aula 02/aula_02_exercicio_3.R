library(dplyr)

data(iris)

# questão 1 --------------------------------------------------------------------

#P(A|B)=P(A e B)/P(B)
#A = sepal.length < 6
#B = virginica

# Numero de ocorrencia de A e B
n_A_e_B <-
iris %>%
  filter(Sepal.Length < 6 & Species == "virginica") %>%
  nrow()


Pr_A_e_B <- n_A_e_B/nrow(iris)

# NUmero de ocorrencias de B

n_B <- iris %>%
  filter(Species == "virginica") %>%
  nrow()

P_B <- n_B/nrow(iris)

Pr_A_dado_B <- Pr_A_e_B/P_B

# Questão 2

iris %>%
  filter(Petal.Length > 4.5 & Species == "versicolor") %>%
  nrow()/iris %>%
  filter(Species == "versicolor") %>%
  nrow()
