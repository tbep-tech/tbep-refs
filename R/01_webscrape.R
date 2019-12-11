library(tidyverse)
library(rvest)

# pdftab <- read_html("https://tbeptech.org/data/tech-pubs") %>% 
#   html_nodes('p')

txt <- pdftab %>%
  html_text() %>% 
  .[1:263]

# writeLines(txt, 'C:/Users/Marcus.SCCWRP2K/Desktop/strings.txt')

# ref <- pdftab %>%
#   html_nodes('a') %>%
#   html_attr('href')

auths <- gsub('^.*\\((.*)\\).*$|^.*(Prepared by.*\\.).*$', '\\1\\2', txt)

txt <- gsub('\\(.*\\)|Prepared by.*', '', txt)

num <- gsub('^.*\\#([0-9]*\\-[0-9]*).*$|^.*\\#\\s([0-9]*\\-[0-9]*).*$', '\\1\\2', txt)

writeLines(txt, 'C:/Users/Marcus.SCCWRP2K/Desktop/unclean.txt')
writeLines(auths, 'C:/Users/Marcus.SCCWRP2K/Desktop/authunclean.txt')
writeLines(num, "C:/Users/Marcus.SCCWRP2K/Desktop/numunclean.txt")
