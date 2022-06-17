# Toby Lister

## 6/11/2022


library(tidyverse)
library(ggplot2)
library(stargazer)
library(readxl)
library(tmap)            # Thematic Mapping
library(tmaptools) 
library(tigris)          # Get Census Geography Poloygons
library(sf)
library(usmap)
library(dplyr)

# Importing and mapping expiration dates of pandemic UI benefits

UI_exp <- read.csv("UI_ben_exp_by_state.csv")

UI_exp <- UI_exp[order(UI_exp$State), ]

UI_exp$fips <- statepop$fips
UI_exp$abbr <- statepop$abbr

p0 <- plot_usmap(data = UI_exp,
                 values = "Month",
                 labels= F,
                 exclude = "DC")+
  theme(plot.title = element_text(size = 15,
                                  hjust= 0.5))+
  theme(legend.position = c(0.58,0.01),
        legend.key.width = unit(0.2, "in"),
        legend.key.height = unit(0.1, "in"),
        legend.text = element_text(size = 10))


print(p0)

ggsave("UI_exp_state.png", dpi = 1000)