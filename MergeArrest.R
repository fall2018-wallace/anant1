
census <- State_data
census
#2)	Copy the USArrests dataset into a local variable (similar to HW 2)
arrest <- USArrests
#3) Create a merged dataframe -- with the attributes from both dataframes
arrest=cbind(rownames(arrest),arrest)
arrest
colnames(arrest) <- c("statename")
arrest
merged_data <- merge(census,arrest)
merged_data
colnames(merged_data) <- c("Statename","Murder","Assault","UrbanPop", "Rape","population","popover18", "percentover18")
merged_data
#4) Create a histogram using GGPLOT for the population and a different histogram for the murder rate
library(ggplot2)
plot_population <- ggplot(merged_data,aes(x=population))+geom_histogram(bins=50,color="red", fill="blue")
plot_population

plot_murder <- ggplot(merged_data,aes(x=Murder))+geom_histogram(bins=50,color="black", fill="black")
plot_murder 

plot_assult <- ggplot(merged_data,aes(x=Assault))+geom_histogram(bins=10,color="black", fill="orange")

plot_rape <- ggplot(merged_data,aes(x=Rape))+geom_histogram(bins=10,color="black", fill="yellow")

plot_urbanpop <- ggplot(merged_data,aes(x=UrbanPop))+geom_histogram(bins=10,color="black", fill="green")

#5) Create a boxplot for the population, and a different boxplot for the murder rate.
box_population <- ggplot(merged_data,aes(x=factor(0),y=population))+geom_boxplot()
box_murder <- ggplot(merged_data,aes(x=factor(0),y=Murder))+geom_boxplot()

#6)Create a block comment explaining which visualization (boxplot or histogram) you thought was more helpful (explain why)
####################################################################################
# Histograms are better than boxplot for visualization because the data set we have is very big
# and wide variance exists among the observed frequencies. With BoxPlots the values average one another
# out.
####################################################################################

#7) Calculate the number of murders per state
new=merged_data$population*merged_data$Murder
no_of_murders=new/100000
no_of_murders

#8) Generate a bar chart, with the number of murders per state
per_state_murder <- ggplot(merged_data,aes(x=Statename,y=no_of_murders))+geom_col()+theme(axis.text.x=element_text(angle=180, hjust=1))

#9) Generate a bar chart, with the number of murders per state. Rotate text (on the X axis), so we can see x labels, also add a title named “Total Murders”.
rotate_title_bar <- ggplot(merged_data,aes(x=Statename,y=no_of_murders))+geom_col()+theme(axis.text.x=element_text(angle=90, hjust=1))+ggtitle("Total Murders")

#10) Generate a new bar chart, the same as in the previous step, but also sort the x-axis by the murder rate
rotate_title_bar_sorted <- ggplot(merged_data,aes(x=reorder(Statename, no_of_murders),y=no_of_murders))+geom_col()+theme(axis.text.x=element_text(angle=90, hjust=1))+ggtitle("Total murders")

#11) Generate a third bar chart, the same as the previous step, but also showing percentOver18 as the color of the bar
percent_over_18_bar <- ggplot(merged_data,aes(x=reorder(Statename, no_of_murders),y=no_of_murders))+geom_col(aes(fill=percentover18))+theme(axis.text.x=element_text(angle=90, hjust=1))+ggtitle("Total Murders")

#12) Generate a scatter plot – have population on the X axis, the percent over 18 on the y axis, and the size & color represent the murder rate
Scatter_plot <- ggplot(merged_data, aes(x=population, y=percentover18)) + geom_point(aes(size=Murder, color="Murder Rate"))
