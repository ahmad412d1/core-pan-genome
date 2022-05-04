#import library
library(dplyr)
library(rstatix)
library(plotly)
library(ggpubr)

#read file
df <- read.csv("../smeliloti_metadata_complete_2.csv", header=TRUE)
colnames(df)

#A. visualize the RBS strength using plotly
fig1 <- df %>%
  plot_ly(
    x = ~total.Number.Of.Chromosomes,
    y = ~total.Sequence.Length,
    split = ~Strain,
    type = "scatter",
    box = list(
      visible = T
    ),
    menaline = list(
      visible = T
    )
  )

#box plot on translation rate 
fig1 <- fig1 %>%
  layout(
    xaxis = list(
      title = "number of chromosomes"
      ,categoryorder = "category ascending",
      categoryarray = ~Strain)
    ,
    yaxis = list(
      title = "Sequence length",
      zeroline = F
    )
  )

fig1

#dG vs translation rate
fig2 <- df %>%
  plot_ly(
    x = ~Strain,
    y = ~geolocation.name,
    split = ~host,
    type = "scatter",
    box = list(
      visible = T
    ),
    menaline = list(
      visible = T
    )
  )

#box plot on translation rate 
fig2 <- fig2 %>%
  layout(
    xaxis = list(
      title = "Strains"
      ,categoryorder = "array",
      categoryarray = ~Strain)
    ,
    yaxis = list(
      title = "Geolocation",
      zeroline = T
    )
  )

fig2
