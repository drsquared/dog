
fname <- "./Dog_1/Dog_1_interictal_segment_0480.mat"
mname <- "Interictal Raw Data"
fname <- "./Dog_1/Dog_1_preictal_segment_0001.mat"
mname <- "Preictal Raw Data"
df <- readMat(fname)

tt <- df[[1]]
tt <- tt[[1]]
dim(tt)
n <- dim(tt)[2]
tmdf <- tt[2,]
length(tmdf)

kk <- 1:30000
dd <- tmdf[kk]
# plot(dd, type = "l",
#      ylim = c(min(dd), max(dd)), main = "Raw data",
#      xlab = "")

library (EMD)
try <- emd(dd, kk, boundary="wave", max.imf = 5)
par(mfrow=c(try$nimf+2, 1), mar=c(2,1,2,1))
plot(dd, type = "l",
     ylim = c(min(dd), max(dd)), main = mname,
     xlab = "")

rangeimf <- range(try$imf)
for(i in 1:try$nimf) {
  plot(kk, try$imf[,i], type="l", xlab="", ylab="", ylim=rangeimf,
       main=paste(i, "-th IMF", sep="")); abline(h=0)
}
plot(kk, try$residue, xlab="", ylab="", main="residue", type="l", axes=FALSE); box()

