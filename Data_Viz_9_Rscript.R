#oh, so I don;t need to use markdown
#choose a dataset
#make two figures
#format to submit to american fisheries society.
library(ggplot2)
library(tidyverse)
library(dplyr)
library(cowplot)
library(ggthemes)


goa <- read.csv("/Users/alexandrareich/Desktop/Fish 622 QuanFish/HW/HW3/goa_race_specimen.csv", header=TRUE, skip=6)
sable <- goa %>% filter(Common.Name=="sablefish",
                         !is.na(Age..years.), !is.na(Length..mm.),
                         Sex!="Unknown")

#I'm going to use either the star dataset or a dataset from Quantitative fish pop. dynamics
pol.dat <- read.csv(file="/Users/alexandrareich/Desktop/Fish 622 QuanFish/HW/HW3/pollock_race_specimen.csv", header=TRUE, skip=6)
#this is a dataset on pollock from Quan fish class
names(pol.dat)
pol.dat <- pol.dat %>% filter(!is.na(Age..years.),
                              !is.na(Length..mm.),
                              !is.na(Weight..gm.),
                              !is.na(Gonad.Weight))


#plot one: sablefish length by weight
g1 <- ggplot(data=sable) +aes(y=Weight..gm., x=Length..mm.) + geom_point() +theme_cowplot(14)+facet_wrap(~Sex) +theme(text=element_text(family="Times New Roman"))+
  labs(x="Length(mm)", y="Weight(gm)")

#plot two, count the number of species

g2 <- gplot(data=goa)+aes(x=Common.Name)+ geom_bar() +
  coord_flip()+
  theme_cowplot(14) +theme(text=element_text(family="Times New Roman"))+
  labs(y = "Abundance", x="Species")

