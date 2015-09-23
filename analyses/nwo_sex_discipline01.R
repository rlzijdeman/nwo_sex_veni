# File: nwo_sex_discipline01.R
# Date: 2015-09-23T10:27:03A
# Last change: none
# This file uses data from http://www.pnas.org/content/suppl/2015/09/16/1510159112.DCSupplemental/pnas.201510159SI.pdf
# to show that any gender segregation in applications and award differences should be studied
# at the discipline level.

# load libraries
library(ggplot2)

# clear working space and load directory
rm(list = ls())
setwd("/Users/RichardZ/git/nwo_sex_veni/")

# read in the data, manually entered from pdf
df <- read.csv("./data/lee_ellemers_pnas2015_s1.csv")

g1 <- ggplot(df, aes(x = round, y = men)) + geom_bar(stat = "identity", colour = "blue", fill = "blue", 
                                               alpha = 0.3) +
        facet_grid(. ~ discipline) +
                geom_bar(aes(x = round, y = women), stat = "identity", colour = "red", 
                         fill = "red", alpha = 0.3) +
        
        labs(list(title = "Sex segregation in VENI application and award",
                  x = "'Round' (applications vs. awards)",
                  y = "Number (men = blue, women = red)"))

ggsave("./graphs/sex_segregation_veni01.png", g1, scale = 2)

# EOF