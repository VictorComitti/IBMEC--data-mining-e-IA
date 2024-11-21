
data(iris)
# Teste t para uma média hipotética de 4
t_test <- t.test(iris$Petal.Length, mu = 4, conf.level = 0.99)

# Resultados
cat("Estatística t: ", t_test$statistic, "\n")
cat("Valor-p: ", t_test$p.value, "\n")
cat("Intervalo de confiança de 99%: [", t_test$conf.int[1], ",", t_test$conf.int[2], "]\n")

# Avaliação da hipótese nula
if (t_test$p.value < 0.01) {
  cat("Com um nível de significância de 1%, rejeitamos a hipótese nula (H0).\n")
} else {
  cat("Com um nível de significância de 1%, não há evidência suficiente para rejeitar a hipótese nula (H0).\n")
}

