
readStates <- function(states)
{
    states <- states[-1,]
    last_row <- nrow(states)
    states <- states[,-lastrow]
}
