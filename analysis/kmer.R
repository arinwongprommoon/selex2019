library(ggplot2)

normcnt <- readRDS("~/selex2019/kmer_cnt_R_PCRBIAS/Trulig147v1III-Arin2-PCRbias-4DiffCycle-Phusion-2xx16dilu-0cycPCR-IIIc1-E1-ZhuBar96p1-bTAGTGTTG_S49_R1_001.peared_trimmed.fq.gz.RDS", refhook=NULL)
xcnt <- readRDS("~/selex2019/kmer_cnt_R_EMSASELEX/Trulig147v1III-Arin1-NuEMSA-DreamTaq-AllmC-bound-OctDNA0-09-IIIc1-C5-ZhuBar96p1-bCTAATTAT_S125_R1_001.peared_trimmed.fq.gz.RDS", refhook=NULL)
ycnt <- readRDS("~/selex2019/kmer_cnt_R_EMSASELEX/Trulig147v1III-Arin1-NuEMSA-DreamTaq-AllmC-bound-OctDNA0-09-IIIc2-G5-ZhuBar96p1-bCTCCGCTT_S173_R1_001.peared_trimmed.fq.gz.RDS", refhook=NULL)

xcnt_norm <- data.frame(normcnt$kmer, xcnt$counts/normcnt$counts)
ycnt_norm <- data.frame(normcnt$kmer, ycnt$counts/normcnt$counts)

mydata <- data.frame(xcnt_norm$xcnt.counts.normcnt.counts, ycnt_norm$ycnt.counts.normcnt.counts)
colnames(mydata) <- c("x_normcounts", "y_normcounts")

ggplot(mydata, aes(x=x_normcounts, y=y_normcounts)) + 
    geom_point(shape=1)