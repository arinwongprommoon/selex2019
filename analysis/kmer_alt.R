library(ggplot2)
library(gtable)
library(gridExtra)
library(RColorBrewer)

# Load data
normcnt <- readRDS("~/selex2019/kmer_cnt_R_PCRBIAS/Trulig147v1III-Arin2-PCRbias-4DiffCycle-Phusion-2xx16dilu-0cycPCR-IIIc1-E1-ZhuBar96p1-bTAGTGTTG_S49_R1_001.peared_trimmed.fq.gz.RDS", refhook=NULL)
kmerbasefreqs <- readRDS("~/github/selex2019/analysis/kmerbasefreqs.RDS", refhook=NULL)

xcnt <- readRDS("~/selex2019/kmer_cnt_R_EMSASELEX/Trulig147v1III-Arin1-NuEMSA-Phusion-CpGmC-bound-OctDNA0-74-IIIc4-H8-ZhuBar96p1-bAGGGCCCC_S284_R1_001.peared_trimmed.fq.gz.RDS", refhook=NULL)
ycnt <- readRDS("~/selex2019/kmer_cnt_R_EMSASELEX/Trulig147v1III-Arin1-NuEMSA-Phusion-CpGmC-unbound-OctDNA1-48-IIIc4-H7-ZhuBar96p1-bGCTGCTTC_S283_R1_001.peared_trimmed.fq.gz.RDS", refhook=NULL)

# Define axis labels here
# (trust me, this is easier than extracting this info from the filenames)
xlabel = "CpGmC bound fold change"
ylabel = "CpGmC unbound fold change"

kmers <- nrow(normcnt)

# Normalise data
xcnt_norm <- data.frame(normcnt$kmer, xcnt$counts/normcnt$counts)
colnames(xcnt_norm) <- c("kmer", "x_normcounts")
ycnt_norm <- data.frame(normcnt$kmer, ycnt$counts/normcnt$counts)
colnames(ycnt_norm) <- c("kmer", "y_normcounts")

# Prepare data frame for plotting
mydata <- data.frame(normcnt$kmer, xcnt_norm$x_normcounts, ycnt_norm$y_normcounts, kmerbasefreqs)
colnames(mydata) <- c("kmer", "x_normcounts", "y_normcounts", "no_a", "no_c", "no_g", "no_t")

# Extend colour palettes to cover 10 values (0-9)
NewGreens <- colorRampPalette(brewer.pal(9,"Greens"))(10)
NewBlues <- colorRampPalette(brewer.pal(9,"Blues"))(10)
NewPurples <- colorRampPalette(brewer.pal(9,"Purples"))(10)
NewReds <- colorRampPalette(brewer.pal(9,"Reds"))(10)

# Define plots
plot_a <- ggplot(mydata, aes(x=x_normcounts, y=y_normcounts)) + 
    geom_point(aes(colour=factor(no_a)), shape=".") +
    scale_colour_manual(values=NewGreens, name="As in kmer") +
    scale_x_continuous(name=xlabel, limits=c(0, 1)) +
    scale_y_continuous(name=ylabel, limits=c(0, 1)) +
    guides(colour = guide_legend(override.aes = list(shape=15))) +
    theme_bw() +
    theme(
        plot.background = element_blank()
        ,panel.grid.major = element_blank()
        ,panel.grid.minor = element_blank()
        ,panel.border = element_blank()
    ) +
    theme(axis.line.x = element_line(color="black", size = 0.5),
          axis.line.y = element_line(color="black", size = 0.5))

plot_c <- ggplot(mydata, aes(x=x_normcounts, y=y_normcounts)) + 
    geom_point(aes(colour=factor(no_c)), shape=".") +
    scale_colour_manual(values=NewBlues, name="Cs in kmer") +
    scale_x_continuous(name=xlabel, limits=c(0, 1)) +
    scale_y_continuous(name=ylabel, limits=c(0, 1)) +
    guides(colour = guide_legend(override.aes = list(shape=15))) +
    theme_bw() +
    theme(
        plot.background = element_blank()
        ,panel.grid.major = element_blank()
        ,panel.grid.minor = element_blank()
        ,panel.border = element_blank()
    ) +
    theme(axis.line.x = element_line(color="black", size = 0.5),
          axis.line.y = element_line(color="black", size = 0.5))

plot_g <- ggplot(mydata, aes(x=x_normcounts, y=y_normcounts)) + 
    geom_point(aes(colour=factor(no_g)), shape=".") +
    scale_colour_manual(values=NewPurples, name="Gs in kmer") +
    scale_x_continuous(name=xlabel, limits=c(0, 1)) +
    scale_y_continuous(name=ylabel, limits=c(0, 1)) +
    guides(colour = guide_legend(override.aes = list(shape=15))) +
    theme_bw() +
    theme(
        plot.background = element_blank()
        ,panel.grid.major = element_blank()
        ,panel.grid.minor = element_blank()
        ,panel.border = element_blank()
    ) +
    theme(axis.line.x = element_line(color="black", size = 0.5),
          axis.line.y = element_line(color="black", size = 0.5))

plot_t <- ggplot(mydata, aes(x=x_normcounts, y=y_normcounts)) + 
    geom_point(aes(colour=factor(no_t)), shape=".") +
    scale_colour_manual(values=NewReds, name="Ts in kmer") +
    scale_x_continuous(name=xlabel, limits=c(0, 1)) +
    scale_y_continuous(name=ylabel, limits=c(0, 1)) +
    guides(colour = guide_legend(override.aes = list(shape=15))) +
    theme_bw() +
    theme(
        plot.background = element_blank()
        ,panel.grid.major = element_blank()
        ,panel.grid.minor = element_blank()
        ,panel.border = element_blank()
    ) +
    theme(axis.line.x = element_line(color="black", size = 0.5),
          axis.line.y = element_line(color="black", size = 0.5))

plot_a <- ggplot(mydata, aes(x=x_normcounts, y=y_normcounts)) + 
    geom_point(aes(colour=factor(no_a)), shape=".") +
    scale_colour_manual(values=NewGreens, name="As in kmer") +
    scale_x_continuous(name=xlabel, limits=c(0, 1)) +
    scale_y_continuous(name=ylabel, limits=c(0, 1)) +
    guides(colour = guide_legend(override.aes = list(shape=15))) +
    theme_bw() +
    theme(
        plot.background = element_blank()
        ,panel.grid.major = element_blank()
        ,panel.grid.minor = element_blank()
        ,panel.border = element_blank()
    ) +
    theme(axis.line.x = element_line(color="black", size = 0.5),
          axis.line.y = element_line(color="black", size = 0.5))

# Putting them all together
grid.arrange(plot_a, plot_c, plot_g, plot_t, nrow = 2)

# Spit out correlation
cor.test(mydata$x_normcounts, mydata$y_normcounts, method="pearson", conf.level=0.95)