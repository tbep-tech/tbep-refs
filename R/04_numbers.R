# preface report numbers with # -------------------------------------------

refs <- read.csv('tbep-refs.csv', stringsAsFactors = F) %>% 
  mutate(
    number = case_when(
      grepl('\\-', number) ~ paste0('#', number), 
      T ~ number
    ), 
    misc = case_when(
      grepl('\\-', misc) ~ paste0('#', misc), 
      T ~ misc
    )
  )

write.csv(refs, file = 'tbep-refs.csv', row.names = F)