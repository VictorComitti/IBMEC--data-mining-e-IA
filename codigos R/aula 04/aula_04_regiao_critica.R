library(ggplot2)

# Defina a distribuição normal padrão
x <- seq(-3, 3, 0.01)
y <- dnorm(x)

# Crie um data frame para o ggplot
df <- data.frame(x = x, y = y)

# Defina as regiões críticas
regiao_critica1 <- data.frame(x = seq(-3, -1.96, 0.01), y = dnorm(seq(-3, -1.96, 0.01)))
regiao_critica2 <- data.frame(x = seq(1.96, 3, 0.01), y = dnorm(seq(1.96, 3, 0.01)))

# Crie o gráfico em ggplot
ggplot(df, aes(x, y)) +
  geom_line() +
  geom_ribbon(data = regiao_critica1, aes(ymax = y, ymin = 0), fill = "blue", alpha = 0.5) +
  geom_ribbon(data = regiao_critica2, aes(ymax = y, ymin = 0), fill = "blue", alpha = 0.5) +
  annotate("text", x = -1.25, y = 0.15, label = "Região de Aceitação", hjust = 0, size = 4) +
  annotate("text", x = 1, y = 0.3, label = "Regiões Críticas", hjust = 0, size = 4, color = "blue") +
  labs(title = "Distribuição Normal Padrão",
       x = "Escores Z",
       y = "Densidade de Probabilidade") +
  theme_minimal()

