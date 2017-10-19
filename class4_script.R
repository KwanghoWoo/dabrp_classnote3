# 2017. 10. 19 lecture, class4

if (!require(devtools)) install.packages("devtools") 
if (!require(DBI)) devtools::install_github("rstats-db/DBI")
if (!require(RSQLite)) devtools::install_github("rstats-db/RSQLite")
if (!require(bigrquery)) devtools::install_github("rstats-db/bigrquery")
if (!require(data.table)) install.packages("data.table")
if (!require(bigrquery)) devtools::install_github("tidyverse/tidyverse")
if (!require(dtplyr)) devtools::install_github("hadley/dtplyr")
pack<-c("DBI","RSQLite","bigrquery","data.table","tidyverse","dtplyr")

lapply(pack, library, character.only = TRUE)


if (!require(nycflights13)) install.packages("nycflights13")

library(dplyr)
library(nycflights13)
head(airports, 3)


# 끝자리가 숫자로 끝나는 공항이름(name variable)
airports %>%
  filter(grepl("New", name))

# 숫자가 포함되어 있는 공항이름 찾기
airports %>%
  filter(grepl("[0-9]", name))

airports %>%
  filter(grepl("[0-9]$", name))

airports %>%
  filter(grepl("[[:digit:]]$", name))


# stringr 
if (!require(tidyverse)) install.packages("tidyverse")
library(tidyverse)
library(stringr)

str_length(c("abc","한글","ㅎㄱㅏ"))

names(iris)[5] <- "Category"
names(iris)

strings <- c(
  "apple",
  "219 733 8965",
  "329-293-8753",
  "Work: 579-499-7527; Home: 543.355.3679"
)

phone <- "([2-9][0-9]{2})[- .]([0-9]{3})[- .]([0-9]{4})"
str_subset(strings, phone)

strings[grep(phone, strings)]
str_detect(strings, phone)

# 패턴이 나온 횟수
str_count(strings, phone)

str_locate(strings, phone)

str_locate_all(strings, phone)
str_extract_all(strings, phone, simplify = T)

#데이터 프레임으로 변환 
my_data <- do.call(rbind.data.frame, str_match_all(strings, phone))

strings <- c(
  "543-355-3679",
  "219-733-8965",
  "329-293-8753",
  "579-499-7527"
  )


lapply(tem, function(x) x[1])

getFirst <- function(x) {x[1]}
lapply(tem, getFirst)
