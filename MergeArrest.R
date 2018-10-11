
census <- State_data
census
#1)	Copy the USArrests dataset into a local variable (similar to HW 2)
arrest <- USArrests
#2) Create a merged dataframe -- with the attributes from both dataframes
arrest=cbind(rownames(arrest),arrest)
arrest
colnames(arrest) <- c("statename")
arrest
merged_data <- merge(census,arrest)
merged_data
colnames(merged_data) <- c("Statename","Murder","Assault","UrbanPop", "Rape","population","popover18", "percentover18")
merged_data
#3) Create a histogram using GGPLOT for the population and a different histogram for the murder rate
library(ggplot2)
plot_population <- ggplot(merged_data,aes(x=population))+geom_histogram(bins=50,color="red", fill="blue")
plot_population

plot_murder <- ggplot(merged_data,aes(x=Murder))+geom_histogram(bins=50,color="black", fill="black")
plot_murder 
#4) Create a boxplot for the population, and a different boxplot for the murder rate.

box_population <- ggplot(merged_data,aes(x=factor(0),y=population))+geom_boxplot()
box_murder <- ggplot(merged_data,aes(x=factor(0),y=Murder))+geom_boxplot()

#7) Calculate the number of murders per state
new=merged_data$population*merged_data$Murder
no_of_murders=new/100000
no_of_murders
#8) Generate a bar chart, with the number of murders per state
per_state_murder <- ggplot(merged_data,aes(x=Statename,y=no_of_murders))+geom_col()+theme(axis.text.x=element_text(angle=180, hjust=1))
rotate_title_bar <- ggplot(merged_data,aes(x=Statename,y=no_of_murders))+geom_col()+theme(axis.text.x=element_text(angle=90, hjust=1))+ggtitle("Total Murders")
rotate_title_bar_sorted <- ggplot(merged_data,aes(x=reorder(Statename, no_of_murders),y=no_of_murders))+geom_col()+theme(axis.text.x=element_text(angle=90, hjust=1))+ggtitle("Total murders")
percent_over_18_bar <- ggplot(merged_data,aes(x=reorder(Statename, no_of_murders),y=no_of_murders))+geom_col(aes(fill=percentover18))+theme(axis.text.x=element_text(angle=90, hjust=1))+ggtitle("Total Murders")


Scatter_plot <- ggplot(merged_data, aes(x=population, y=percentover18)) + geom_point(aes(size=Murder, color="Murder Rate"))
