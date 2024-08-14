# loading libraries
library(tidyverse)
library(GEOquery)


### load desired data sets
## mouse tb
mouse_tb <- getGEO("GSE140945", GSEMatrix = TRUE)
mouse_samp_df <- pData(mouse_tb[[1]])

mouse_samp_df <- mouse_samp_df[,c('title','geo_accession', 'source_name_ch1', 'description', 'day:ch1', 'dose:ch1', 'gender:ch1', 'mtb_strain:ch1')] #just keep the fields we want
colnames(mouse_samp_df) <- c('title','geo_accession', 'source', 'description', 'day', 'dose', 'gender', 'mtb_strain')
# samp_df <- samp_df %>% column_to_rownames('title')

write.csv(mouse_samp_df, file = "C:/Users/jeann/Desktop/sp24-urop/140945_mouse_samp_df.csv", row.names = TRUE)

mouse_count_file <- "C:/Users/jeann/Desktop/sp24-urop/GSE137092_GEO_mouse_blood_TB_DESEQ_normalised_values.txt"
mouse_count_df <- read.delim2(mouse_count_file)
mouse_count_df <- mouse_count_df %>% column_to_rownames('rowname')
head(mouse_count_df)

write.csv(mouse_count_df, file = "C:/Users/jeann/Desktop/sp24-urop/GSE137092_blood_count_df.csv", row.names = TRUE)

## downloading each of the subseries
### blood
mouse_blood <- getGEO("GSE137092", GSEMatrix = TRUE)
blood_samp_df <- pData(mouse_blood[[1]])

blood_samp_df <- blood_samp_df[,c('title','geo_accession', 'source_name_ch1', 'description', 'day:ch1', 'dose:ch1', 'gender:ch1', 'mtb_strain:ch1')] #just keep the fields we want
colnames(blood_samp_df) <- c('title','geo_accession', 'source', 'description', 'day', 'dose', 'gender', 'mtb_strain')

write.csv(blood_samp_df, file = "C:/Users/jeann/Desktop/sp24-urop/GSE137092_blood_samp_df.csv", row.names = TRUE)

### lung
mouse_lung <- getGEO("GSE137093", GSEMatrix = TRUE)
lung_samp_df <- pData(mouse_lung[[1]])

lung_samp_df <- lung_samp_df[,c('title','geo_accession', 'source_name_ch1', 'description', 'day:ch1', 'dose:ch1', 'gender:ch1', 'mtb_strain:ch1')] #just keep the fields we want
colnames(lung_samp_df) <- c('title','geo_accession', 'source', 'description', 'day', 'dose', 'gender', 'mtb_strain')

write.csv(lung_samp_df, file = "C:/Users/jeann/Desktop/sp24-urop/GSE137093_lung_samp_df.csv", row.names = TRUE)

lung_count_file <- "C:/Users/jeann/Desktop/sp24-urop/GSE137093_GEO_mouse_lung_TB_DESEQ2_normalised_values.txt"
lung_count_df <- read.delim2(lung_count_file)
lung_count_df <- lung_count_df %>% column_to_rownames('rowname')
head(lung_count_df)

write.csv(lung_count_df, file = "C:/Users/jeann/Desktop/sp24-urop/GSE137093_lung_count_df.csv", row.names = TRUE)

### blood array
mouse_array <- getGEO("GSE140943", GSEMatrix =TRUE, getGPL=FALSE)
array_samp_df <- pData(mouse_array[[1]])

array_samp_df <- array_samp_df[,c('title','geo_accession', 'source_name_ch1', 'agent:ch1', 'day:ch1', 'strain:ch1')] #just keep the fields we want
colnames(array_samp_df) <- c('title','geo_accession', 'source', 'agent', 'day', 'strain')

write.csv(array_samp_df, file = "C:/Users/jeann/Desktop/sp24-urop/GSE140943_array_samp_df.csv", row.names = TRUE)

mouse_array <- mouse_array[[1]]
ex <- exprs(mouse_array)
array_count_df <- as.data.frame(ex)

write.csv(array_count_df, file = "C:/Users/jeann/Desktop/sp24-urop/GSE140943_array_count_df.csv", row.names = TRUE)


## human tb
tb_london <- getGEO("GSE107991", GSEMatrix = TRUE)
london_samp_df <- pData(tb_london[[1]])
london_samp_df <- london_samp_df[, c('title', 'group:ch1', 'outlier:ch1')]
colnames(london_samp_df) <- c('title', 'group', 'outlier')

write.csv(london_samp_df, file = "C:/Users/jeann/Desktop/sp24-urop/GSE107991_london_samp_df.csv", row.names = TRUE)

# london_count_file <- "C:/Users/jeann/Desktop/sp24-urop/GSE107991_edgeR_normalized_Berry_London.csv"
# london_count_df <- read.csv(london_count_file, header=TRUE)
# london_count_df <- london_count_df %>% column_to_rownames('rowname')

tb_southafrica <- getGEO("GSE107992", GSEMatrix = TRUE)
sa_samp_df <- pData(tb_southafrica[[1]])
sa_samp_df <- sa_samp_df[, c('title', 'group:ch1', 'outlier:ch1')]
colnames(sa_samp_df) <- c('title', 'group', 'outlier')

write.csv(sa_samp_df, file = "C:/Users/jeann/Desktop/sp24-urop/GSE107992_sa_samp_df.csv", row.names = TRUE)

tb_leicester <- getGEO("GSE107993", GSEMatrix = TRUE)
lc_samp_df <- pData(tb_leicester[[1]])