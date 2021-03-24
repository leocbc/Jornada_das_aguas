################# Leitura de dados #########

## BIOMASSA
# Leitura do arquivo biomassa:
dados = read.csv("biomassa.csv", dec = ",", sep = ";")

# Visualizando o arquivo:
dados

# IRIS

dados_iris = read.table("iris.txt", sep = ",", header = TRUE)

dados_iris

# TARTARUGA

dados_tartaruga = read.table("tartaruga.txt", header = TRUE)
dados_tartaruga

# PEIXE 1

dados_peixe1 = read.csv("peixe1.csv", header = TRUE, sep = ",")

# BRIZALINA

dados_brizalina = read.table("Brizalina.txt", header = FALSE)

# PEIXE 2

dados_peixe2 = read.table("peixe2.csv", header = TRUE)
