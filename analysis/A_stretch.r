library(ggplot2)
library(reshape2)
library(viridis)

A_stretch_counts_ratios <- read.csv("~/github/selex2019/analysis/A_stretch_counts_ratios.csv")
plot_data <- melt(A_stretch_counts_ratios[,c(1,2:5)], id="Astretch_length")

viridis <- viridis(4)
ggplot(plot_data, aes(x=Astretch_length, y=value, col=variable)) + 
    #geom_point() + 
    geom_jitter(width=0.25, size=2.5) +
    theme_classic() + 
    theme(plot.background = element_blank(),
                               panel.grid.major = element_blank(),
                               panel.grid.minor = element_blank() ) +
    scale_x_continuous(name="Length of A stretch") +
    scale_y_continuous(name="Count of A stretch in bound library \nrelative to unbound library", breaks=seq(0,1.2,0.1), limits=c(0,1.2)) +
    theme(panel.border= element_blank()) +
    theme(axis.line.x = element_line(color="black", size = 0.5),
          axis.line.y = element_line(color="black", size = 0.5)) +
    labs(colour="Group") +
    scale_colour_manual(labels=c("All-C-methylated", "Half-C-methylated", "CpG-methylated", "Plain DNA"), values=viridis) +
    geom_hline(yintercept=1, linetype="dashed")