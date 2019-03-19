library(stringr)

rgb2hex <- function(r,g,b) sprintf('#%s',paste(as.hexmode(c(r,g,b)),collapse = ''))

kmer2colour <- function(kmer) {
    kk <- nchar(kmer)
    bases <- c(
        str_count(kmer, "A"),
        str_count(kmer, "C"),
        str_count(kmer, "G"),
        str_count(kmer, "T")
    )
    aa <- round((bases[1]/kk)*c(0, 255, 0))
    cc <- round((bases[2]/kk)*c(0, 0, 255))
    gg <- round((bases[3]/kk)*c(255, 255, 0))
    tt <- round((bases[4]/kk)*c(255, 0, 0))
    rgb <- aa + cc + gg + tt
    mycolour <- rgb2hex(rgb[1], rgb[2], rgb[3])
    return(mycolour)
}

normcnt <- readRDS("~/selex2019/kmer_cnt_R_PCRBIAS/Trulig147v1III-Arin2-PCRbias-4DiffCycle-Phusion-2xx16dilu-0cycPCR-IIIc1-E1-ZhuBar96p1-bTAGTGTTG_S49_R1_001.peared_trimmed.fq.gz.RDS", refhook=NULL)

kmercolourslist <- vapply(normcnt$kmer, kmer2colour, FUN.VALUE=character(1))
saveRDS(kmercolourslist, file="~/github/selex2019/analysis/kmercolours.RDS", refhook=NULL)