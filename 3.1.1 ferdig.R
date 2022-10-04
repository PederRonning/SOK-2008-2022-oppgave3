library(readr)
library(tidyverse)
library(data.table)
library(PxWebApiData)
library(janitor)
library(readxl)

SSB <- ApiData("https://data.ssb.no/api/v0/no/table/11155/",
               Kjonn ="0",
               Alder = c("15-24", "20-64"),
               UtdNivaa = "TOT",
               ContentsCode = "Arbeidsledige (prosent)",
               Tid = "2020")


SSB <- as_tibble(SSB[[2]])

P1 <- ggplot (SSB, aes (x = Alder, y = value, fill = Alder)) +
  geom_col(col = "white") +
  geom_text(aes(label = value), vjust = -0.5) + 
  theme(axis.title.y = element_blank()) +
  labs(title = "Arbeidsløshet i prosent")
P1

