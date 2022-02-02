## Se cargan paquetes al inicio
library("sessioninfo")
library("here") ## Para compartir código relativo
library("ggplot2")

## Hello world
print("Soy Daianna")

## Directorios se crean para el proyecto
dir_plots <- here::here("figuras")
dir_rdata <- here::here("processed-data")

## Crear directorio para las figuras y archivos
dir.create(dir_plots, showWarnings = TRUE) # Si existe da error
dir.create(dir_rdata, showWarnings = FALSE) # No da error(no sobreescribe)

## Hacer una imagen de ejemplo: dirección, nombre
pdf(file.path(dir_plots, "mtcars_gear_vs_mpg.pdf"),
    useDingbats = FALSE
)
## Se visualizan datos, variables, tipo de gráfica
ggplot(mtcars, aes(group = gear, y = mpg)) +
  geom_boxplot()
dev.off()

#Guardar datos
save(mtcars, file=file.path(dir_rdata, "mtcars.Rdata"))

## Para reproducir mi código en 120 char
options(width = 120)
## Mostrar la información para reproducir los resultados
sessioninfo::session_info()

# - Session info ------------------------------------------------------
#   setting  value
# version  R version 4.1.1 (2021-08-10)
# os       Windows 10 x64 (build 19042)
# system   x86_64, mingw32
# ui       RStudio
# language (EN)
# collate  Spanish_Mexico.1252
# ctype    Spanish_Mexico.1252
# tz       America/Mexico_City
# date     2022-02-01
# rstudio  1.2.5001 (desktop)
# pandoc   NA
#
# - Packages ----------------------------------------------------------
#   package     * version date (UTC) lib source
# cli           3.1.1   2022-01-20 [1] CRAN (R 4.1.2)
# crayon        1.4.2   2021-10-29 [1] CRAN (R 4.1.2)
# ellipsis      0.3.2   2021-04-29 [1] CRAN (R 4.1.2)
# fansi         1.0.2   2022-01-14 [1] CRAN (R 4.1.2)
# fs            1.5.2   2021-12-08 [1] CRAN (R 4.1.2)
# glue          1.6.1   2022-01-22 [1] CRAN (R 4.1.2)
# here          1.0.1   2020-12-13 [1] CRAN (R 4.1.2)
# lifecycle     1.0.1   2021-09-24 [1] CRAN (R 4.1.2)
# magrittr      2.0.2   2022-01-26 [1] CRAN (R 4.1.2)
# pillar        1.6.5   2022-01-25 [1] CRAN (R 4.1.2)
# pkgconfig     2.0.3   2019-09-22 [1] CRAN (R 4.1.2)
# purrr         0.3.4   2020-04-17 [1] CRAN (R 4.1.2)
# rlang         1.0.0   2022-01-26 [1] CRAN (R 4.1.2)
# rprojroot     2.0.2   2020-11-15 [1] CRAN (R 4.1.2)
# rstudioapi    0.13    2020-11-12 [1] CRAN (R 4.1.2)
# sessioninfo   1.2.2   2021-12-06 [1] CRAN (R 4.1.2)
# tibble        3.1.6   2021-11-07 [1] CRAN (R 4.1.2)
# usethis       2.1.5   2021-12-09 [1] CRAN (R 4.1.2)
# utf8          1.2.2   2021-07-24 [1] CRAN (R 4.1.2)
# vctrs         0.3.8   2021-04-29 [1] CRAN (R 4.1.2)
#
# [1] C:/Users/hp/Documents/R/win-library/4.1
# [2] C:/Program Files/R/R-4.1.1/library
#
