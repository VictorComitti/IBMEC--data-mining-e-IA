

# Dados ------------------------------------------------------------------------

amostra <- c(9.1, 9.3, 7.2, 7.5, 13.3, 10.9, 7.2, 9.9, 8, 8.6)
media_amostral <- mean(amostra)
n <- length(amostra)
media_populacional <- 8
desvio_padrao_populacional <- 2

# Teste z-----------------------------------------------------------------------
estatistica_z <- (media_amostral - media_populacional) / (desvio_padrao_populacional / sqrt(n))

# Valor crítico para um teste bilateral ----------------------------------------

valor_critico <- qnorm(c(0.025, 0.975))

# Decisão ----------------------------------------------------------------------

decisao <- if (any(abs(estatistica_z) > abs(valor_critico))) {
  decisao <- "Rejeitar H0"
} else {
  decisao <- "Aceitar H0"
}
decisao



