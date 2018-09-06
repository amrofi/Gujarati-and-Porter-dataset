# download gujarati and porter eviews zip file
library(data.table)
setwd('C:\\Users\\amrof\\Documents\\disciplinas\\econometria\\livros e datasets\\gujarati\\r data\\')
# Como os arquivos estao compactados no formato zip, precisaremos depois descompactar
# 
download.file('http://highered.mheducation.com/sites/dl/free/0070660050/37004/eviews.zip', destfile='eviews.zip', mode='wb')
# descompactar
zipF<-file.choose() # lets you choose a file and save its file path in R (at least for windows)
#(WD <- getwd())
#if (!is.null(WD)) setwd(WD)
(outDir<-getwd()) # Define the folder where the zip file should be unzipped to 
unzip(zipF,exdir=outDir)  # unzip your file
# transformar wf1 em Rda
library(hexView)
# choose file to convert
wf1_file<-file.choose()
wf1.df<-readEViews(wf1_file,as.data.frame = TRUE)
View(wf1.df)
# agora salvar wf1.df em Rds
name <- basename(wf1_file)
filename=paste0(name,'.RDS')
saveRDS(wf1.df, filename)
my_data <- readRDS(filename)
View(my_data)
