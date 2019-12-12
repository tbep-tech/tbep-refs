# remove non-ascii characters ---------------------------------------------

library(tidyverse)
library(stringi)

refs <- read.csv('tbep-refs.csv', stringsAsFactors = F) %>% 
  mutate_if(is.character, stri_trans_general, id = 'latin-ascii')

write.csv(refs, 'tbep-refs.csv', row.names = F)
