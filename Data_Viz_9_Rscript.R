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
ggplot(data=sable) +aes(y=Weight..gm., x=Length..mm.) + geom_point() +theme_cowplot(14)+facet_wrap(~Sex) +theme(text=element_text(family="Times New Roman"))+
  labs(x="Length(mm)", y="Weight(gm)")
#save the figure
dev.new (width=2.75, height=1.83, unit= "in", noRStudioGD = T); lastplot()
ggsave("Assigment9_fig1.eps", width=dev.size()[1], height=dev.size()[2]);dev.off()
#save as what file type?
#eps(adobe illustratior), tiff, or psd(photoshop. I'll try tiff


#plot two, count the number of species
ggplot(data=goa)+aes(x=Common.Name)+ geom_bar() +
  coord_flip()+
  #scale_y_continuous(limits=c(0,14000), expand=expansion(mult =c(0.05,0)))+
  theme_cowplot(14) +theme(text=element_text(family="Times New Roman"))+
  labs(y = "Abundance", x="Species")
#save the figure
dev.new (width=2.75, height=1.83, unit= "in", noRStudioGD = T); lastplot()
ggsave("Assigment9_fig2.eps", width=dev.size()[1], height=dev.size()[2]);dev.off()


#to do:
#expand x-and y-axes to encompass end of things
