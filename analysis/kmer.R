library(ggplot2)

# Load data
normcnt <- readRDS("~/selex2019/kmer_cnt_R_PCRBIAS/Trulig147v1III-Arin2-PCRbias-4DiffCycle-Phusion-2xx16dilu-0cycPCR-IIIc1-E1-ZhuBar96p1-bTAGTGTTG_S49_R1_001.peared_trimmed.fq.gz.RDS", refhook=NULL)
kmercolours <- readRDS("~/github/selex2019/analysis/kmercolours.RDS", refhook=NULL)

xcnt <- readRDS("~/selex2019/kmer_cnt_R_EMSASELEX/Trulig147v1III-Arin1-NuEMSA-Phusion-CpGmC-bound-OctDNA0-74-IIIc4-H8-ZhuBar96p1-bAGGGCCCC_S284_R1_001.peared_trimmed.fq.gz.RDS", refhook=NULL)
ycnt <- readRDS("~/selex2019/kmer_cnt_R_EMSASELEX/Trulig147v1III-Arin1-NuEMSA-Phusion-CpGmC-unbound-OctDNA1-48-IIIc4-H7-ZhuBar96p1-bGCTGCTTC_S283_R1_001.peared_trimmed.fq.gz.RDS", refhook=NULL)

# Define axis labels here
# (trust me, this is easier than extracting this info from the filenames)
xlabel = "CpGmC_bound fold change"
ylabel = "CpGmC_unbound fold change"

kmers <- nrow(normcnt)

# Normalise data
xcnt_norm <- data.frame(normcnt$kmer, xcnt$counts/normcnt$counts)
colnames(xcnt_norm) <- c("kmer", "x_normcounts")
ycnt_norm <- data.frame(normcnt$kmer, ycnt$counts/normcnt$counts)
colnames(ycnt_norm) <- c("kmer", "y_normcounts")

#plotorder <- sample(kmers) # random order for plotting

# Prepare data frame for plotting
mydata <- data.frame(normcnt$kmer, xcnt_norm$x_normcounts, ycnt_norm$y_normcounts, kmercolours, plotorder)
colnames(mydata) <- c("kmer", "x_normcounts", "y_normcounts", "kmer_colour", "plotorder")

# rr <- cor.test(mydata$x_normcounts, mydata$y_normcounts, method="pearson", conf.level=0.95)

## Stuff about correlation
# Function to calculate correlation
corr_eqn <- function(x,y, digits = 3) {
    corr_coef <- round(cor(x, y), digits = digits)
    paste("R = ", corr_coef)
}
# Put labels and coordinates into data frame to enhance resolution
rrlabel = corr_eqn(mydata$x_normcounts, mydata$y_normcounts)

# Plotting!
ggplot(mydata, aes(x=x_normcounts, y=y_normcounts, colour=kmercolours)) + 
    geom_point(alpha=1, shape=".") +
    annotate("text", label=rrlabel, x=0.5, y=1) +
    scale_x_continuous(name=xlabel, limits=c(0, 1)) +
    scale_y_continuous(name=ylabel, limits=c(0, 1)) +
    scale_colour_identity() +
    theme_bw() +
    theme(
        plot.background = element_blank()
        ,panel.grid.major = element_blank()
        ,panel.grid.minor = element_blank()
        ,panel.border = element_blank()
    ) +
    theme(axis.line.x = element_line(color="black", size = 0.5),
          axis.line.y = element_line(color="black", size = 0.5))