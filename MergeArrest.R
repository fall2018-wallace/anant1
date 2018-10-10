
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

ggplot(merged_data,aes(x=population))+geom_histogram(bins=50,color="black", fill="black")

