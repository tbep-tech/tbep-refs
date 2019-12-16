# add complete URL --------------------------------------------------------

refs <- read.csv('tbep-refs.csv', stringsAsFactors = F)

refs <- refs %>% 
  mutate(
    url = case_when(
      grepl('^/TBEP\\_TECH\\_PUBS/', url) ~ paste0('https://tbeptech.org', url),
      T ~ url
    )
  )

write.csv(refs, 'tbep-refs.csv', row.names = F)
