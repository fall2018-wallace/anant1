
census <- State_data
census
arrest <- USArrests
arrest=cbind(rownames(arrest),arrest)
arrest
colnames(arrest) <- c("statename")
arrest
merged_data <- merge(census,arrest)
merged_data
colnames(merged_data) <- c("Statename","Murder","Assault","UrbanPop", "Rape","population","popover18", "percentover18")
merged_data
library(ggplot2)

plot1 <- ggplot(merged_data,aes(x=population))+geom_histogram(bins=50,color="red", fill="blue")
plot1
ggplot(merged_data,aes(x=Murder))+geom_histogram(bins=50,color="orange", fill="black")

ggplot(merged_data,aes(x=factor(0),y=population))+geom_boxplot()
ggplot(merged_data,aes(x=factor(0),y=Murder))+geom_boxplot()



