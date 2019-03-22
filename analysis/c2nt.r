library(ggplot2)
library(reshape2)
library(viridis)

c2nt <- read.csv("~/github/selex2019/analysis/2nt.csv")
plot_data <- melt(c2nt[,c(1,2:5)], id="kmer")

viridis <- viridis(4)
ggplot(plot_data, aes(x=kmer, y=value, col=variable)) + 
    #geom_point() + 
    geom_jitter(width=0.4, size=1.5) +
    theme_classic() + 
    theme(plot.background = element_blank(),
                               panel.grid.major = element_blank(),
                               panel.grid.minor = element_blank() ) +
    scale_x_discrete(name="Dinucleotide") +
    scale_y_continuous(name="Count of dinucleotide in bound library \nrelative to unbound library", breaks=seq(0.8,1.2,0.1), limits=c(0.8,1.2)) +
    theme(panel.border= element_blank()) +
    theme(axis.line.x = element_line(color="black", size = 0.5),
          axis.line.y = element_line(color="black", size = 0.5)) +
    labs(colour="Group") +
    scale_colour_manual(labels=c("All-C-methylated", "Half-C-methylated", "CpG-methylated", "Plain DNA"), values=viridis) +
    geom_hline(yintercept=1, linetype="dashed")