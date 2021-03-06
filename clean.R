
readStates <- function(states)
{
    states <- states[-1, ]
    states
    num.row <- nrow(states)
    states <- states[-num.row, ]
    
    states <- states[,-1:-4]
    colnames(states) <- c("statename", "population", "populationover18", "percentover18")

    return(states)
}

cleanCensus <- readStates(raw_data)
cleanCensus
clean_data <- cleanCensus


