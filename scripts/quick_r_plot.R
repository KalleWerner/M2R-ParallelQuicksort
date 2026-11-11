library(ggplot2)
setwd("/home/karl/Uni_Grenoble/SMPE/M2R-ParallelQuicksort") # set this to your working directory
file <- file.choose()
df <- read.csv(file, header=T, stringsAsFactors = T)
ggplot(df, aes(x = Size, y = Time, color = Type)) +
  geom_point() +
  geom_line(stat = "summary", fun = mean) +
  theme_minimal()
