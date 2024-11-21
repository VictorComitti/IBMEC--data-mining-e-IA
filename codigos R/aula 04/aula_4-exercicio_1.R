set.seed(11012024)
library(ggplot2)
# 1) Gerar 10000 observações de uma distribuição normal N(10,16) ---------------

dados_populacao <- rnorm(10000, mean = 10, sd = 4)

# 2) Criar 1000 amostras de 10 observações do vetor de 10000 criado anteriormente

amostras <- matrix(sample(dados_populacao, 1000 * 10,
                          replace = TRUE),
                   ncol = 10)

# 3) Calcular a média amostral de cada amostra de 10 observações ---------------

medias_amostrais <- apply(amostras, 1, mean)

# 4) Criar o histograma das médias amostrais obtidas

ggplot(data.frame(MediasAmostrais = medias_amostrais),
       aes(x = MediasAmostrais)) +
  geom_histogram(binwidth = 0.5,
                 fill = "lightblue",
                 color = "black",
                 alpha = 0.7) +
  geom_vline(xintercept = 10, linetype = "dashed", color = "red", size = 1) +
  labs(title = "Histograma das Médias Amostrais",
       x = "Média Amostral", y = "Frequência") +
  theme_minimal()

# Média e variância amostrais --------------------------------------------------

mean(medias_amostrais)
var(medias_amostrais)

