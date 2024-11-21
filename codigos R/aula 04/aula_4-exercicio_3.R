data_setosa <- subset(iris, Species == "setosa")

# Estatísticas descritivas
mean_setosa <- mean(data_setosa$Sepal.Length) # Média
sd_setosa <- sd(data_setosa$Sepal.Length)     # Desvio padrão
n_setosa <- nrow(data_setosa)                 # Tamanho da amostra

# Valor crítico da distribuição t para 95% de confiança
alpha <- 0.05
t_critical <- qt(1 - alpha / 2, df = n_setosa - 1)

# Erro padrão da média
se <- sd_setosa / sqrt(n_setosa)

# Intervalo de confiança
lower_bound <- mean_setosa - t_critical * se
upper_bound <- mean_setosa + t_critical * se

# Resultado manual
cat("Intervalo de confiança manual: [", lower_bound, ",", upper_bound, "]\n")

# Comparação com t.test
t_test_result <- t.test(data_setosa$Sepal.Length, conf.level = 0.95)

# Resultado do t.test
cat("Intervalo de confiança com t.test: [", t_test_result$conf.int[1], ",", t_test_result$conf.int[2], "]\n")
