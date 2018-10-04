
readStates <- function(states)
{
    states <- states[-1,]
    last_row <- nrow(states)
    states <- states[,-lastrow]
    states <- states[ , -c(1:-4)]
    colnames(states) <- ("statename","population","populationover18","percentover18")
    return(states)
}

cleanCensus <- readStates(raw_data)
str(cleanCensus)
