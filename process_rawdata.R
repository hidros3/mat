library(plyr)
library(reshape)
ps <- read.csv("~/Documents/Projects/mat/processed_data.csv", header=FALSE)
names(ps)<-c("created", "platform", "publisher.detail","type","id1", "id2", "publisher")
ps$date <- as.Date(ps$created, format = "%Y-%m-%d")

df <- data.frame(ps$date, ps$publisher, ps$type)
names(df) <- c("date", "publisher", "type")

df.melt <- melt(df, measure="type")
df.cast <- cast(df.melt, ...~ variable + value)

processed_df <- data.frame(df.cast$date, df.cast$publisher, df.cast$type_referrer, df.cast$type_fingerprint)
names(processed_df) <- c("date", "publisher", "referrer", "fingerprint")

write.csv(processed_df, file="processed_data.csv")
