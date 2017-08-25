library(hash)
library(dplyr)

# speed test
mylist <- 1:10000
names(mylist) <- as.character(1:10000)
system.time(replicate(10000, mylist[['10000']]))

mydict <- hash(keys=as.character(1:10000), values=1:10000)
system.time(replicate(10000, mydict[['10000']]))



count_words <- function(fname){
  # read in and preprocess text
  mytext <- readLines(fname) %>% strsplit(" ")
  mytext <- mytext[[1]] %>% tolower
  print(mytext)
  
  # make a dictionary to keep track of words
  word_dict <- hash()
  for(i in 1:length(mytext)){
    word <- mytext[i]
    if(word %in% keys(word_dict)){
      word_dict[[word]] = word_dict[[word]] + 1
    } else {
      word_dict[[word]] = 1
    }
  }
  return(word_dict)
}

email_words = count_words('britney_email.txt')
sometimes_words = count_words('britney_sometimes.txt')