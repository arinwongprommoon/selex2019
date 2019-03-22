library(ggplot2)
library(gtable)
library(gridExtra)
library(RColorBrewer)

mydata <- read.csv("~/github/selex2019/analysis/vendor.csv")

plot_a <- ggplot(mydata[mydata$base=='A',], aes(x=dNTP, y=fraction, col=polymerase)) + 
    ggtitle("Adenines (A)") +
    geom_jitter(width=0.5, size=1) +
    theme_classic() + 
    theme(plot.background = element_blank(),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank() ) +
    scale_x_discrete(name="dNTP vendor") +
    scale_y_continuous(name="Fraction of nucleotide in library\nfor dNTP-polymerase combination", breaks=seq(0.18,0.32,0.05), limits=c(0.18,0.32)) +
    theme(panel.border= element_blank()) +
    theme(axis.line.x = element_line(color="black", size = 0.5),
          axis.line.y = element_line(color="black", size = 0.5)) +
    labs(colour="Polymerase\n vendor") +
    scale_colour_brewer(palette="Set1") +
    geom_hline(yintercept=0.25, linetype="dashed")

plot_c <- ggplot(mydata[mydata$base=='C',], aes(x=dNTP, y=fraction, col=polymerase)) + 
    ggtitle("Cytosines (C)") +
    geom_jitter(width=0.5, size=1) +
    theme_classic() + 
    theme(plot.background = element_blank(),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank() ) +
    scale_x_discrete(name="dNTP vendor") +
    scale_y_continuous(name="Fraction of nucleotide in library\nfor dNTP-polymerase combination", breaks=seq(0.18,0.32,0.05), limits=c(0.18,0.32)) +
    theme(panel.border= element_blank()) +
    theme(axis.line.x = element_line(color="black", size = 0.5),
          axis.line.y = element_line(color="black", size = 0.5)) +
    labs(colour="Polymerase\n vendor") +
    scale_colour_brewer(palette="Set1") +
    geom_hline(yintercept=0.25, linetype="dashed")

plot_g <- ggplot(mydata[mydata$base=='G',], aes(x=dNTP, y=fraction, col=polymerase)) + 
    ggtitle("Guanines (T)") +
    geom_jitter(width=0.5, size=1) +
    theme_classic() + 
    theme(plot.background = element_blank(),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank() ) +
    scale_x_discrete(name="dNTP vendor") +
    scale_y_continuous(name="Fraction of nucleotide in library\nfor dNTP-polymerase combination", breaks=seq(0.18,0.32,0.05), limits=c(0.18,0.32)) +
    theme(panel.border= element_blank()) +
    theme(axis.line.x = element_line(color="black", size = 0.5),
          axis.line.y = element_line(color="black", size = 0.5)) +
    labs(colour="Polymerase\n vendor") +
    scale_colour_brewer(palette="Set1") +
    geom_hline(yintercept=0.25, linetype="dashed")

plot_t <- ggplot(mydata[mydata$base=='T',], aes(x=dNTP, y=fraction, col=polymerase)) + 
    ggtitle("Thymines (T)") +
    geom_jitter(width=0.5, size=1) +
    theme_classic() + 
    theme(plot.background = element_blank(),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank() ) +
    scale_x_discrete(name="dNTP vendor") +
    scale_y_continuous(name="Fraction of nucleotide in library\nfor dNTP-polymerase combination", breaks=seq(0.18,0.32,0.05), limits=c(0.18,0.32)) +
    theme(panel.border= element_blank()) +
    theme(axis.line.x = element_line(color="black", size = 0.5),
          axis.line.y = element_line(color="black", size = 0.5)) +
    labs(colour="Polymerase\n vendor") +
    scale_colour_brewer(palette="Set1") +
    geom_hline(yintercept=0.25, linetype="dashed")

grid.arrange(plot_a, plot_c, plot_g, plot_t, nrow = 2)

