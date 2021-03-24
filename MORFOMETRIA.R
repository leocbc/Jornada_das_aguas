library(Momocs)
load("nsfishes.Rdata")
nsfishes


# Visualização dos dados:
panel(nsfishes, col="grey")


# Transformando os dados
fish_out <- nsfishes %>% coo_slide(ldk = 3) %>% fgProcrustes()
stack(fish_out) 

## Captura da forma
osc <- coo_oscillo(fish_out[17], "efourier")
calibrate_reconstructions_efourier(fish_out, id = 17, 
                                   range = c(1, 2, 4, 8, 14, 20))


# seleção das harmonicas
hpow <- calibrate_harmonicpower_efourier(fish_out, nb.h=30)
print(hpow$minh)
boxplot(hpow$q)

## Obtenção das elipticas
fish_efa <- efourier(fish_out, norm = FALSE, nb.h = 14)

str(fish_efa)
ncol(fish_efa)
fish_efa[,2]

### PCA
fish_pca <- PCA(fish_efa)
plot(fish_pca)

# Contribuição das variáveis
PCcontrib(fish_pca,nax = 1:3)

