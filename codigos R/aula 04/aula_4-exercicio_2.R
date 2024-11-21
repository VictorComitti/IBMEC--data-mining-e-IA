
# Dados do problema ------------------------------------------------------------

media_amostral <- 72
desvio_padrao_conhecido <- 5  # raiz quadrada da variância conhecida
tamanho_amostra <- 30
nivel_confianca <- 0.95

# Calcular o erro padrão da média ----------------------------------------------

erro_padrao <- desvio_padrao_conhecido / sqrt(tamanho_amostra)

# Calcular o intervalo de confiança usando a distribuição normal padrão
intervalo_confianca <- qnorm(c((1 - nivel_confianca) / 2, 1 - (1 - nivel_confianca) / 2)) * erro_padrao + media_amostral

# Plota os resultados ----------------------------------------------------------

x <- seq(media_amostral - 3 * desvio_padrao_conhecido/sqrt(30), media_amostral + 3 * desvio_padrao_conhecido/sqrt(30),
         length = 1000)
y <- dnorm(x, mean = media_amostral, sd = desvio_padrao_conhecido/sqrt(30))

# Criar o data frame para o ggplot ---------------------------------------------
df <- data.frame(x = x, y = y)

# Criar o gráfico em ggplot ----------------------------------------------------
ggplot(df, aes(x, y)) +
  geom_line() +
  geom_ribbon(aes(ymax = y, ymin = 0), fill = "gray", alpha = 0.5,
              data = subset(df, x >= intervalo_confianca[1] & x <= intervalo_confianca[2])) +
  geom_vline(xintercept = media_amostral, linetype = "dashed", color = "blue") +
  labs(title = "Distribuição Normal com Intervalo de Confiança",
       y = "Densidade de Probabilidade",
       x = "Pontuação no Teste") +
  theme_minimal()
