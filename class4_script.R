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

