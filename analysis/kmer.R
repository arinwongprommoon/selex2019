library(ggplot2)

normcnt <- readRDS("~/selex2019/kmer_cnt_R_PCRBIAS/Trulig147v1III-Arin2-PCRbias-4DiffCycle-Phusion-2xx16dilu-0cycPCR-IIIc1-E1-ZhuBar96p1-bTAGTGTTG_S49_R1_001.peared_trimmed.fq.gz.RDS", refhook=NULL)
xcnt <- readRDS("~/selex2019/kmer_cnt_R_EMSASELEX/Trulig147v1III-Arin1-NuEMSA-DreamTaq-AllmC-bound-OctDNA0-09-IIIc1-C5-ZhuBar96p1-bCTAATTAT_S125_R1_001.peared_trimmed.fq.gz.RDS", refhook=NULL)
ycnt <- readRDS("~/selex2019/kmer_cnt_R_EMSASELEX/Trulig147v1III-Arin1-NuEMSA-DreamTaq-AllmC-bound-OctDNA0-09-IIIc2-G5-ZhuBar96p1-bCTCCGCTT_S173_R1_001.peared_trimmed.fq.gz.RDS", refhook=NULL)
kmercolours <- readRDS("~/github/selex2019/analysis/kmercolours.RDS", refhook=NULL)
kmers <- nrow(normcnt)

xcnt_norm <- data.frame(normcnt$kmer, xcnt$counts/normcnt$counts)
ycnt_norm <- data.frame(normcnt$kmer, ycnt$counts/normcnt$counts)

plotorder <- sample(kmers) # random order for plotting
mydata <- data.frame(normcnt$kmer, xcnt_norm$xcnt.counts.normcnt.counts, ycnt_norm$ycnt.counts.normcnt.counts, kmercolours, plotorder)
colnames(mydata) <- c("kmer", "x_normcounts", "y_normcounts", "kmer_colour", "plotorder")

cor.test(mydata$x_normcounts, mydata$y_normcounts, method="pearson", conf.level=0.95)
ggplot(mydata, aes(x=x_normcounts, y=y_normcounts, colour=kmercolours, order=plotorder)) + 
    geom_point(alpha=0.2) +
    scale_colour_identity()