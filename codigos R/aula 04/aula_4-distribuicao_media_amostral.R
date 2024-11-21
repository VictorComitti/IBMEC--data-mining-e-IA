
library(ggplot2)

# Definição dos parâmetros -----------------------------------------------------

media_populacional <- 10
desvio_padrao_populacional <- 4
tamanhos_amostra <- c(10, 20, 50, 100, 200, 500)
num_simulacoes <- 1000

# Cria data frame para armazenar resutados -------------------------------------

df <- data.frame()

# Realize as simulações e armazene os resultados no data frame -----------------

for (n in tamanhos_amostra) {
  for (i in 1:num_simulacoes) {
    amostra <- rnorm(n,
                     mean = media_populacional,
                     sd = desvio_padrao_populacional)
    media_amostral <- mean(amostra)
    df <- rbind(df, data.frame(TamanhoAmostra = as.factor(n),
                               MediaAmostral = media_amostral))
  }
}


# Cria visualização ------------------------------------------------------------

ggplot(df, aes(x = MediaAmostral, fill = TamanhoAmostra)) +
  geom_histogram(binwidth = 0.1,
                 position = "identity",
                 alpha = 0.7,
                 color = "black") +
  facet_wrap(~TamanhoAmostra, scales = "free_y") +
  geom_vline(xintercept = media_populacional,
             linetype = "dashed",
             color = "red",
             size = 1) +
  labs(title = "Distribuição das Médias Amostrais para Diferentes Tamanhos de Amostra",
       x = "Média Amostral", y = "Frequência") +
  theme_minimal() +
  theme(legend.position = "top")
