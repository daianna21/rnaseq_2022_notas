## Lets build our first SummarizedExperiment object
## Cargar el paquete de se
library("SummarizedExperiment")
## ?SummarizedExperiment
## Creamos los datos para nuestro objeto de tipo SummarizedExperiment para 200 genes a lo largo de 6 muestras
nrows <- 200
ncols <- 6
## Fijar la semilla para generar números aleatorios para que sea reproducible
set.seed(20210223)
# Generar los assays: 1200 datos en 200 renglones con ~uniforme de rango 1 a 10000
counts <- matrix(runif(nrows * ncols, 1, 1e4), nrows)

## Información de nuestros genes
rowRanges <- GRanges(
  # 50 del chr1 y 150 del chr2 (seqnames)
  rep(c("chr1", "chr2"), c(50, 150)),
  # Ranges en pb (enteros) o 200 posiciones de inicio y fin
  IRanges(floor(runif(200, 1e5, 1e6)), width = 100),
  # Cadena de los genes
  strand = sample(c("+", "-"), 200, TRUE),
  #Id de los genes con 3 dígitos entre 1 y 200
  feature_id = sprintf("ID%03d", 1:200)
)
## Ver info de los genes
rowRanges

# Nombre (número) de los genes
names(rowRanges) <- paste0("gene_", seq_len(length(rowRanges)))

## Información de nuestras 6 muestras en las columnas
colData <- DataFrame(
  Treatment = rep(c("ChIP", "Input"), 3),
  # Nombres de las columnas: A, B, C, D, E, F
  row.names = LETTERS[1:6]
)
## Juntamos ahora toda la información en un solo objeto se de R
rse <- SummarizedExperiment(
  assays = SimpleList(counts = counts),
  rowRanges = rowRanges,
  colData = colData
)

## Exploremos el objeto resultante
rse
## Número de genes y muestras
dim(rse)
# [1] 200   6
## IDs de nuestros genes y muestras
dimnames(rse)

## Nombres de tablas de cuentas que tenemos (RPKM, CPM, counts, logcounts, etc)
assayNames(rse)
## [1] "counts"

## El inicio de nuestra tabla de cuentas
## Assay es para recuperar 1 sola tabla assay(rse, "logcounts")
head(assay(rse))

## Información de los genes en un objeto de Bioconductor
rowRanges(rse)

## Tabla con información de los genes
rowData(rse) # es idéntico a 'mcols(rowRanges(rse))'

## Tabla con información de las muestras -> da un DataFrame que imprime los primeros y últimos renglones de la tabla, data.frame todos
colData(rse)

## Comando 1: solo tomar los primeros dos renglones/genes
rse[1:2, ]

## Comando 2: tomar solo las columnas A, D y F
rse[, c("A", "D", "F")]

## Vector lógico de las muestras que tienen un tratamiento Input
rse[,rse$treatment=='Input']
## Ver qué muestras son
which(rse$treatment=='Input')
