library(rvest)
library(dplyr)
gasprice <- "https://gasprices.aaa.com/state-gas-price-averages/"
GPpage <- read_html(gasprice)

GPpage


# body_nodes <- html_children(html_node(GPpage,"body"))

body_nodes <- GPpage %>% 
  html_node("body") %>% 
  html_children()
body_nodes
# //*[@id="sortable"]/tbody/tr[1]/td[1]/a
# //*[@id="sortable"]/tbody/tr[2]/td[1]/a
# //*[@id="sortable"]/tbody/tr[1]/td[2]

df1 <- GPpage %>%
  rvest::html_nodes('body') %>%
  xml2::xml_find_all('//*[@id="sortable"]/tbody/tr[*]/td[1]/a') %>%
  rvest::html_text()
df2 <- GPpage %>%
  rvest::html_nodes('body') %>%
  xml2::xml_find_all('//*[@id="sortable"]/tbody/tr[*]/td[2]/a') %>%
  rvest::html_text()
df3 <- GPpage %>%
  rvest::html_nodes('body') %>%
  xml2::xml_find_all('//*[@id="sortable"]/tbody/tr[*]/td[3]/a') %>%
  rvest::html_text()
df4 <- GPpage %>%
  rvest::html_nodes('body') %>%
  xml2::xml_find_all('//*[@id="sortable"]/tbody/tr[*]/td[4]/a') %>%
  rvest::html_text()
df5 <- GPpage %>%
  rvest::html_nodes('body') %>%
  xml2::xml_find_all('//*[@id="sortable"]/tbody/tr[*]/td[5]/a') %>%
  rvest::html_text()

df <- data.frame(df1, df2, df3, df4, df5)

names(df)[1] <- "state"
names(df)[2] <- "Regular"
names(df)[3] <- "MidGrade"
names(df)[4] <- "Premium"
names(df)[5] <- "Diesel"

knitr::kable(df)

#sortable > tbody > tr:nth-child(1) > td:nth-child(1) > a
#sortable > tbody > tr:nth-child(1) > td.regular
#sortable > tbody > tr:nth-child(1) > td.mid_grade
#sortable > tbody > tr:nth-child(1) > td.premium
#sortable > tbody > tr:nth-child(1) > td.diesel