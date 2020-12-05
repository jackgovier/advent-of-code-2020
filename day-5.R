library(tidyverse)

bp <- read_tsv("day-5.txt", col_names = F)

bp <- bp %>% separate(X1, into = paste0("c",1:10), sep = 1:10)

for(i in 1:nrow(bp)){
  
  x <- 0:127
  
  for(j in 1:7){
    
    if(bp[i,j] == "F"){ 
      x <- x[1:(length(x)/2)]
    } else {
      x <- x[((length(x)/2)+1):length(x)]
    }
    
  }
  
  y = 0:7
  
  for(j in 8:10){
    
    if(bp[i,j] == "L"){ 
      y <- y[1:(length(y)/2)]
    } else {
      y <- y[((length(y)/2)+1):length(y)]
    }
    
  }
  
  bp[i, "rn"] <- x
  bp[i, "cn"] <- y
  bp[i, "sid"] <- x*8 + y
  
}

max(bp$sid)

hist(bp$sid, breaks = 50)
