# remove non-ascii characters ---------------------------------------------

library(tidyverse)
library(stringi)

refs <- read.csv('tbep-refs.csv', stringsAsFactors = F) %>% 
  mutate_all(as.character) %>% 
  mutate_all(stri_trans_general, id = 'latin-ascii') %>% 
  mutate_all(str_trim)

write.csv(refs, 'tbep-refs.csv', row.names = F)
