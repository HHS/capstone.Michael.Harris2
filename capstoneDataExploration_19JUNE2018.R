library(tidyverse)

my_ggtheme = theme_bw() +                     
  theme(axis.title = element_text(size = 20),
        axis.text = element_text(size = 16),
        legend.text = element_text(size = 16),              
        legend.title = element_text(size = 18),             
        plot.title = element_text(size = 25),               
        plot.subtitle = element_text(size = 18))     

tbp = read.csv("AZ_170analysisSet_snpReport.variants.csv", header = TRUE, stringsAsFactors = TRUE, colClasses = c("character", rep("numeric", 136), "character"))

clin_data = read.table(file = "sequence_clinical_20JUNE2018.txt", header = TRUE, stringsAsFactors = TRUE, sep = "\t")

lineage_cols = c(lineage, ncbi_sra, country)
str(tbp)
clin_lineage <- select(clin_data, lineage_cols )
str(clin_lineage)
summary(clin_lineage)


boxplots = ggplot(clin_lineage,   #<- set the base plot + data
                  aes(x = lineage,  #<- map `variable` to x-axis
                      y = count(ncbi_sra)) +  #<- map `value` to y-axis
  geom_boxplot() +          #<- add boxplot geom
  my_ggtheme)                #<- add pre-saved theme

# View plot.
boxplots




str(tbp)
summary(tbp)
View(tbp)
boxplot(tbp)

plot(sumtbp$Rv1482c.fabG1_.17G.T)

#compute the sum for each 
sum(tbp$Rv1482c.fabG1_.17G.T)

?lapply

freq = lapply(tbp[,2:136], sum)


class(freq)
print(freq)

summary(freq)

freq_vec = as.vector(freq) 
class(freq_vec)

which(freq == 0)

freq_df = as.data.frame(freq)

zero_cols = which(freq_df == 0)

labels = colnames(tbp[2:137])
plot(x = labels, y = freq)

freq_val = c()

for (i in 1:135) {
   freq_val = c(freq_val, freq[[i]])  
}


class(freq_val)

freq_vec <- lapply()

print(freq_val)

which(freq_val > 0)

?read.table
clin_data = read.table(file = "sequence_clinical_20JUNE2018.txt", header = TRUE, stringsAsFactors = TRUE, sep = "\t")
View(clin_data)
summary(clin_data)
str(clin_data)

?merge
?l_join

tbp = read.csv("AZ_170analysisSet_snpReport.variants.csv", header = TRUE, stringsAsFactors = TRUE, colClasses = c("character", rep("numeric", 136), "character"))

tbp_clin  = inner_join(x = tbp, y = clin_data, by = c("ncbi_sra"), copy = TRUE)

colnames(tbp)[1] <- "ncbi_sra"
str(tbp)

View(tbp_clin)
