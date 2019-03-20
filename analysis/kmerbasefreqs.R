library(stringr)

normcnt <- readRDS("~/selex2019/kmer_cnt_R_PCRBIAS/Trulig147v1III-Arin2-PCRbias-4DiffCycle-Phusion-2xx16dilu-0cycPCR-IIIc1-E1-ZhuBar96p1-bTAGTGTTG_S49_R1_001.peared_trimmed.fq.gz.RDS", refhook=NULL)

aa <- vapply(normcnt$kmer, function(x) str_count(x, "A"), FUN.VALUE=numeric(1))
cc <- vapply(normcnt$kmer, function(x) str_count(x, "C"), FUN.VALUE=numeric(1))
gg <- vapply(normcnt$kmer, function(x) str_count(x, "G"), FUN.VALUE=numeric(1))
tt <- vapply(normcnt$kmer, function(x) str_count(x, "T"), FUN.VALUE=numeric(1))

kmerbasefreqs <- data.frame(aa, cc, gg, tt)
saveRDS(kmerbasefreqs, file="~/github/selex2019/analysis/kmerbasefreqs.RDS", refhook=NULL)