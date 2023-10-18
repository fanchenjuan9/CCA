if (!require('vegan')) install.packages('vegan')
if (!require('ggplot2')) install.packages('ggplot2')
library(vegan)
library(ggplot2)


spe25 <- read.delim("E:/小论文/东印度洋相关信息/分析方法/CCA分析/25-species.csv", 
                  row.names = 1, sep = ',', stringsAsFactors = FALSE, check.names = FALSE)
env25 <- read.delim("E:/小论文/东印度洋相关信息/分析方法/CCA分析/25-environment.csv", 
                  row.names = 1, sep = ',', stringsAsFactors = FALSE, check.names = FALSE)

scale.env25 <- scale (env25, center = TRUE, scale = TRUE)#执行scale是为了消除量纲影响
spp=decostand(spe25,method = "hellinger")#0数据多，或想消除极值影响,做h转化

otu_cca <- cca (spp, scale.env25)# 进行分析

otu_cca.scaling2 <- summary(otu_cca, scaling = 2)#选择Ⅱ型标尺
otu_cca.scaling2#查看分析结果

plot(otu_cca)
otu_cca_sp.scaling <- scores(otu_cca, choices = 1:2, scaling = 2, display = 'sp')
species<- otu_cca_sp.scaling
plot(otu_cca, scaling = 2, display = c('sp', 'cn'), xlim = c(-0.5, 0.5),ylim = c(-0.5, 0.5))
points(species[ ,1:2], pch = 2, cex = 1, col = 'red')


decorana(spe)#判断用CCA还是RDA


rm(list = ls())#清除
