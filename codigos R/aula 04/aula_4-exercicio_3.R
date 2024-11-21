set.seed(11012024)

# Passo 1 ----------------------------------------------------------------------
dados_populacao <- rnorm(10000, mean = 10, sd = 10)

# Passo 2 -----------------------------------------------------------------------
amostras <- matrix(sample(dados_populacao, 100 * 50, replace = TRUE), ncol = 50)

# Inicializar um contador para contar quantos intervalos de confiança
# contêm a média populacional verdadeira

contagem_contem_media <- 0

# Passo 3: Calcular o intervalo de confiança para a média de cada amostra usando a variância amostral
for (i in 1:100) {

  media_amostral <- mean(amostras[i,])
  desvio_padrao_amostral <- sd(amostras[i,])
  tamanho_amostra <- length(amostras[i,]) #fixamos em 50

  # Calcular o erro padrão da média
  erro_padrao <- desvio_padrao_amostral / sqrt(tamanho_amostra)

  # Calcular o intervalo de confiança usando a distribuição t de Student
  # Note que estou usando os quantis 0.025 e 0.975 para calcular os limites inferior e superior.
  # Se você quiser usar apenaso quantil 0.975, vai ter que inverter o sinal da média amostral.

  intervalo_confianca_inf <- qt(0.025, df = tamanho_amostra - 1) * erro_padrao + media_amostral
  intervalo_confianca_sup <- qt(0.975, df = tamanho_amostra - 1) * erro_padrao + media_amostral

  # Verificar se o intervalo de confiança contém a média populacional verdadeira
  if (intervalo_confianca_inf <= 10 && intervalo_confianca_sup >= 10) {
    contagem_contem_media <- contagem_contem_media + 1
  }
}


# Imprimir o resultado --------------------------------------------------------
cat("Quantidade de intervalos de confiança que contêm a média populacional verdadeira:", contagem_contem_media, "\n")
