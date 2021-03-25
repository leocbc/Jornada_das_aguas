library(Momocs)

load("nsfishes.Rdata")
nsfishes


# Visualização dos dados:
panel(nsfishes, col="green")


# Transformando os dados
fish_out <- nsfishes %>% coo_slide(ldk = 3) %>% fgProcrustes()
stack(fish_out) 

## Captura da forma
osc <- coo_oscillo(fish_out[20], "efourier")
calibrate_reconstructions_efourier(fish_out, id = 1,range = c(1, 2, 4, 8, 14, 20))


# seleção das harmonicas
hpow <- calibrate_harmonicpower_efourier(fish_out, nb.h=20)
hpow$minh
boxplot(hpow$q)

## Obtenção das elipticas
fish_fourier <- efourier(fish_out, norm = FALSE, nb.h = 13)

str(fish_fourier)
fish_efa[,2]

### PCA
fish_pca <- PCA(fish_fourier)

# Contribuição das variáveis
PCcontrib(fish_pca,nax = 1:3)

## Grafico final
plot(fish_pca)


