## Descarguemos unos datos de spatialLIBD de SingleCellExperiment para 7 capas (columnas) del cerebro y rows=genes
sce_layer <- spatialLIBD::fetch_data("sce_layer")
head(assay(rse))
# Explorar los datos
iSEE::iSEE(sce_layer)

# ENSG00000168314
assay(sce_layer)["ENSG00000168314",]
iSEE::iSEE(sce_layer["ENSG00000168314",])

# ENSG00000183036
assay(sce_layer)["ENSG00000183036",]
iSEE::iSEE(sce_layer["ENSG00000183036",])

# ENSG00000197971
assay(sce_layer)["ENSG00000197971",]
iSEE::iSEE(sce_layer["ENSG00000197971",])

# Clustering
heatmap(assay(sce_layer[c("ENSG00000168314","ENSG00000197971","ENSG00000183036"),]))

# Mayor expresión
which.max(assay(sce_layer["ENSG00000168314"]))
# [1] 62
colnames(assay(sce_layer["ENSG00000168314"]))[62]
# [1] "151674_WM"
## Obtener índices de las capas según la expresión del gen de manera descendiente
order(assay(sce_layer["ENSG00000168314"]), decreasing = TRUE)
