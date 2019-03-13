library(ggplot2)
library(reshape2)

A_stretch_counts_ratios <- read_csv("~/github/selex2019/analysis/A_stretch_counts_ratios.csv")
plot_data <- melt(A_stretch_counts_ratios[,c(1,2:5)], id="Astretch_length")

plot <- ggplot(plot_data, aes(x=Astretch_length, y=value, col=variable)) + 
    geom_point()

plot + theme_classic() + theme(plot.background = element_blank(),
                               panel.grid.major = element_blank(),
                               panel.grid.minor = element_blank() )+
    theme(panel.border= element_blank())+
    theme(axis.line.x = element_line(color="black", size = 0.5),
          axis.line.y = element_line(color="black", size = 0.5))