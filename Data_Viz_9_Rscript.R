#oh, so I don;t need to use markdown
#choose a dataset
#make two figures
#format to submit to american fisheries society.
library(ggplot2)
library(tidyverse)
library(dplyr)
library(cowplot)
library(ggthemes)
library(grid)


goa <- read.csv("/Users/alexandrareich/Desktop/Fish 622 QuanFish/HW/HW3/goa_race_specimen.csv", header=TRUE, skip=6)
sable <- goa %>% filter(Common.Name=="sablefish",
                         !is.na(Age..years.), !is.na(Length..mm.),
                         Sex!="Unknown")


#plot one: sablefish length by weight
p1 <- ggplot(data=sable) +aes(y=Weight..gm., x=Length..mm.) + geom_point()+facet_wrap(~Sex) +theme(text=element_text(family="Times New Roman"))+
  labs(x="Length(mm)", y="Weight(gm)") +theme_cowplot(14)
p1

ggplot(data=sable) +aes(y=Weight..gm., x=Length..mm.) + geom_point()+facet_wrap(~Sex) +theme(text=element_text(family="Times New Roman"))+
  labs(x="Length(mm)", y="Weight(gm)") + scale_x_continuous (limits=c(250,1000), expand=expansion (mult = c(0.05,0))) +
  scale_y_continuous(limits=c(-10, 6000), expand=c(0,0))  +theme_cowplot(14)+
  theme(plot.margin=margin(t=9, r=13, unit="pt"))

#the real deal attempt 1 -BAD
p1+ scale_x_continuous (limits=c(250,1000), expand=expansion (mult = c(0.05,0))) +
  scale_y_continuous(limits=c(0, 6000), expand=c(0,0))  +theme_cowplot(14)+
  theme(plot.margin=margin(t=9, r=18, b=9, l=9, unit="pt"), panel.spacing=unit(1.1, "lines"))+ #the margins and space between plots
  theme(text=element_text(family="Times New Roman"))

#the real deal attempt 2
#separate into male and femalae plots
sable_f <- sable %>% filter(Sex=="Female")
sable_m <- sable %>% filter(Sex=="Male")
#make individual graphs
p1.0 <- ggplot(data=sable) +aes(y=Weight..gm., x=Length..mm.) + geom_point() +
  labs(x="Length(mm)", y="Weight(gm)") +theme_cowplot(14) + theme(text=element_text(family="Times New Roman"))
p1.0

p1.f <- ggplot(data=sable_f) +aes(y=Weight..gm., x=Length..mm.) + geom_point() +
  labs(x="Length(mm)", y="Weight(gm)") +theme_cowplot(14) + theme(text=element_text(family="Times New Roman")) +
  scale_x_continuous (limits=c(200,1000), expand=expansion (mult = c(0.05,0))) +
  scale_y_continuous(limits=c(0, 6000), expand=c(0,0))  +theme_cowplot(14)+ #need to add in margin expander
  theme(plot.margin=margin(t=9, r=16, l=9, b=9, unit="pt"))
  theme(text=element_text(family="Times New Roman")) #control the fond size? 6 or 9 points
p1.f #really good draft figure
#print the really good draft figure?
dev.new (width=5.62, height=4.22, unit= "in", noRStudioGD = T); p1.f
ggsave("Assigment9_fig1_f.eps", width=dev.size()[1], height=dev.size()[2]);dev.off()


p1.m <- ggplot(data=sable_m) +aes(y=Weight..gm., x=Length..mm.) + geom_point() +
  labs(x="Length(mm)", y="Weight(gm)") +theme_cowplot(14) + theme(text=element_text(family="Times New Roman"))
p1.m

#combine graphs
plot_grid (p1.f, p1.m, scale=0.95)

#save the figure
dev.new (width=2.75, height=1.83, unit= "in", noRStudioGD = T); lastplot()
ggsave("Assigment9_fig1.tiff", width=dev.size()[1], height=dev.size()[2]);dev.off()
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
