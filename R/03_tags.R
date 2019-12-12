
# generate tags -----------------------------------------------------------

library(tidyverse)
library(stringi)

refs <- read.csv('tbep-refs.csv', stringsAsFactors = F) %>% 
  mutate(
    tag = case_when(
      !is.na(number) ~ paste0('tbep', number), 
      !is.na(misc) ~ paste0('tbep', misc)
    ), 
    tag = gsub('\\-', '', tag)
  ) %>% 
  select(index, type, tag, everything())

write.csv(refs, 'tbep-refs.csv', row.names = F)
