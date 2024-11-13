# Probabilidade de ganhar 4 e 10 vezes seguidas considerando p = 0.5 -----------

p_4 = 0.5^4

p_10 = 0.5^10

# Distribuição binomial com n = 20 e p =0.5 ------------------------------------

# Prob teórica

set.seed(10012024)

n = 20
p = 0.5
x = 10

prob_teorica_10_vitorias = dbinom(x, n, p)

# Prob Empírica

set.seed(10012024)

sample_binom <- rbinom(10000000, n, p)

prob_empirica <- length(sample_binom[sample_binom == 10])/10000000

# Exercicio anterior com p = 0,4864

n = 20
p = 0.4864
x = 10

prob_teorica_10_vitorias = dbinom(x, n, p)

# Prob Empírica

sample_binom <- rbinom(1000000, n, p)

prob_empirica <- length(sample_binom[sample_binom == 10])/1000000


# Para o jogador ter mais dinheiro ao final de 30 rodadas do que tinha no início ele
# deve ganhar mais do que perder. Portanto devemos calcular a probabilidade de  a pessoa
#ganhar pelo menos 16 das 30 rodadas. Ou seja, queremos P(X>=16)

prob_teorica_16 <- pbinom(q = 25,
                          size = 50,          # Note que como queremos P(X>=16) devemos usar a opção
                          prob = .5,          # lower.tail = FALSE para somar os valores da cauda direita
                          lower.tail = FALSE) # da distribuição. Além disso, como queremos que a probabilidade
                                              # acumulada inclua o numero 16, devemos fazer q = 15

# Cálculo Empírico

n = 30
p = 0.5

sample_binom_30 <- rbinom(1000000, n, p)

prob_empirica_16 <- length(sample_binom_30[sample_binom_30 >= 16])/1000000



