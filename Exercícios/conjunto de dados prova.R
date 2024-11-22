set.seed(123)

# Número de observações --------------------------------------------------------
n_observacoes <- 150

# Probabilidades para as idades
prob_idades <- c(0.1, 0.15, 0.15, 0.2, 0.1, 0.05, 0.05, 0.05, 0.05, 0.03, 0.03, 0.03, 0.01)

# Gerar idades com probabilidades especificadas
idades <- sample(c(18:30), n_observacoes, replace = TRUE, prob = prob_idades)

# Função para gerar notas
gerar_notas <- function(sexo) {
  if (sexo == "F") {
    return(rnorm(1, mean = 6.8, sd = 1))
  } else {
    return(rnorm(1, mean = 6.4, sd = 1.1))
  }
}

# Gerar sexo aleatoriamente
sexo <- sample(c("M", "F"), n_observacoes, replace = TRUE)

# Gerar as notas com base no sexo
notas <- sapply(sexo, gerar_notas)

# Criar o dataframe
dados <- data.frame(
  nota = notas,
  idade = idades,
  sexo = sexo
)



