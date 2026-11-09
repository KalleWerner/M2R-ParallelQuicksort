file <- "data/karl-Latitude-E7450_2026-11-09/measurements_17:52.txt"
df <- read.csv(file, header=T)
plot(df$Size,df$Time,col=c("red","blue","green")[df$Type])
