
readStates <- function(states)
{
    states <- states[-1, ]
    num.row <- nrow(states)
    states <- states[-lastrow, ]
    
    states <- states[ , -1:-4]
    
    
    return(states)
}

cleanCensus <- readStates(raw_data)
str(cleanCensus)
