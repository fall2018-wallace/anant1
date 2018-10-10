
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

plot_population <- ggplot(merged_data,aes(x=population))+geom_histogram(bins=50,color="red", fill="blue")
plot_population

plot_murder <- ggplot(merged_data,aes(x=Murder))+geom_histogram(bins=50,color="black", fill="black")
plot_murder 

box_population <- ggplot(merged_data,aes(x=factor(0),y=population))+geom_boxplot()
box_murder <- ggplot(merged_data,aes(x=factor(0),y=Murder))+geom_boxplot()

new=merged_data$population/merged_data$Murder
no_of_murders=new/100000
no_of_murders

per_state_murder <- ggplot(merged_data,aes(x=Statename,y=no_of_murders))+geom_col()+theme(axis.text.x=element_text(angle=90, hjust=1))
y <- ggplot(merged_data,aes(x=reorder(Statename, no_of_murders),y=no_of_murders))+geom_col()+theme(axis.text.x=element_text(angle=90, hjust=1))+ggtitle("Total murders")
z <- ggplot(merged_data,aes(x=reorder(Statename, no_of_murders),y=no_of_murders))+geom_col(aes(fill=percentover18))+theme(axis.text.x=element_text(angle=90, hjust=1))+ggtitle("Total murders")


Scatter_plot <- ggplot(merged_data, aes(x=population, y=percentover18)) + geom_point(aes(size=Murder, color="Murder Rate"))
