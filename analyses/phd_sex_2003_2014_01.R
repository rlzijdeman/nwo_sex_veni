library(xlsx)
library(ggplot2)
library(reshape2)

df <- read.xlsx("~/git/nwo_sex_veni/data/Wetenschappelijk_ond_031015131350.xlsx", 
          sheetIndex = 1, startRow = 3)


# now for differences between men and women

df2 <- melt(df)
df3 <- dcast(df2, Perioden + Studierichting ~ Geslacht)
df3$saldoManVrouw = df3$Man - df3$Vrouw


p1 <- ggplot(df3[df3$Studierichting != "Studierichtingen totaal", ], 
       aes(x = Perioden, y = saldoManVrouw)) + geom_bar(stat = "identity", fill = "grey") + 
        geom_point(aes(y = Mannen), shape = 21, fill = "lightblue", size = 4) + 
        geom_point(aes(y = Vrouwen), shape = 21, fill = "pink", size = 4) + 
        #geom_point(aes(x = Perioden, y = saldoManVrouw), colour = "black", shape = 2) +
        facet_wrap(~Studierichting) + theme_bw(base_size = 16) +
        theme(axis.text.x = element_text(angle=45, hjust = 1)) +
        labs(list(title = "PhD's per richting en geslacht, Nederland 2003-2014",
                  y = "Aantal (mannen in blauw, vrouwen in roze, \nverschil (man-vrouw) in grijs)"))

p1


ggsave("~/git/nwo_sex_veni/graphs/sex_segregation_phd01.png", p1, scale = 2)

# old stuff
# ggplot(df, aes(x = Perioden, y = aantal)) +
#         geom_bar(stat = "identity", group = df$Geslacht, colour = df$Geslacht) + 
#         facet_wrap(~ Studierichting) 
# 
# ggplot(df, aes(Perioden, aantal), stat = "identity") +
#         geom_freqpoly(aes(group = Geslacht, colour = Geslacht))
# 
# ggplot(diamonds, aes(clarity)) +
#         geom_freqpoly(aes(group = cut, colour = cut))
# 
# df$Studierichting
# 
# p1 <- ggplot(df[df$Studierichting != "Studierichtingen totaal", ], 
#              aes(x = Perioden, y  = aantal, fill = Geslacht)) +
#         geom_bar(stat = "identity", position = "dodge") + 
#         facet_wrap(~ Studierichting) +
#         scale_fill_manual(values = c("blue", "red")) + 
#         theme_bw()  +
#         theme(axis.text.x = element_text(angle=45, hjust = 1))
# p1
# p2 <- ggplot(df[df$Studierichting != "Studierichtingen totaal", ], 
#              aes(x = Perioden, y  = aantal, group = Geslacht, colour = Geslacht)) +
#         geom_freqpoly(stat = "identity") +
#         scale_colour_manual(values = c("blue", "red")) +
#         facet_wrap(~ Studierichting) + theme_bw() +
#         theme(axis.text.x = element_text(angle=45, hjust = 1))
# p2
# 
# ggplot(df3[df3$Studierichting != "Studierichtingen totaal", ], 
#        aes(x = Perioden, y = saldoManVrouw)) +
#         geom_bar(stat = "identity") +
#         geom_freqpoly(aes(y = Mannen)) +
#         facet_wrap( ~ Studierichting)
# 
# 
# 
# ggplot(df3, aes(x = Perioden, y = Mannen)) + geom_point(colour = "blue") + 
#         geom_point(aes(y=Vrouwen), colour = "red") + 
#         facet_wrap(~Studierichting)
# 
# ggplot(df3[df3$Studierichting != "Studierichtingen totaal", ], 
#        aes(x = Perioden, y = Mannen)) + geom_point(colour = "blue") + 
#         geom_point(aes(y=Vrouwen), colour = "red") + 
#         geom_point(aes(x = Perioden, y = saldoManVrouw), colour = "black", shape = 2) +
#         facet_wrap(~Studierichting) + theme_bw() +
#         theme(axis.text.x = element_text(angle=45, hjust = 1))
# 

# EOF



