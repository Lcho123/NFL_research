##Research idea:
##Create a value of Player Value to Team through within position player statistics for each position on offense and defense
##Examples: Wr: Target%, catch%, td/route
##          QB: Comp% etc
## Across the league, there will be an average value for each position. Additionally each team will have an average which can show us which teams across the league have more above average players.
## Each player can then show their personal value to team when compared to the average of their team, additionally they can be compared to the average of other teams to see how they would stack at a better or worse team.
##Note: This is purely statistical observation and lacks human judgement in game speed and game knowledge. This will be used to identify the over-performing and under-performing athletes and comparably how they stack among their teammates and position.
## Games played will be taken into account, maybe some weight? Still need to decide how to penalize fewer/more games. May set a minimum required games played. 
## Time period needs to be taken into account. Last 3-5 years and make all statistics average based on a /year or /game statistic...
## Identify most influential factors for each position to see which stats show greater relationship with either contract extensions, all-pro selections, or core statistics by position: sacks, tds, recieving yards, etc...
## May have to judge crosspositionally based on percentile. Since weight of value for each position won't be constant it will be better to find average percentile of a player then compare.


#Acquiring nflscrpR for some data to observe
#install_packages("devtools")
#devtools::install_github(repo = "maksimhorowitz/nflscrapR")

library(nflscrapR)
library(dplyr)
library(readr)
pbp.2021 <- read.csv("C:/Users/lcho/Downloads/pbp-2021.csv")
pbp.2022 <- read.csv("C:/Users/lcho/Downloads/pbp-2022.csv")
pbp.2023 <- read.csv("C:/Users/lcho/Downloads/pbp-2023.csv")
pbp.2024 <- read.csv("C:/Users/lcho/Downloads/pbp-2024.csv")

pbp_data2021 <- pbp.2021 %>%
  mutate(GameDate = as.Date(GameDate, format="%Y-%m-%d")) %>%
  arrange(OffenseTeam, GameDate)
team_splits2021 <- split(pbp_data2021, pbp_data2021$OffenseTeam)

team_week_splits2021 <- lapply(team_splits, function(team_data) {
  unique_dates <- sort(unique(team_data$GameDate))
  
  week_labels <- paste0("Week", seq_along(unique_dates))
  week_splits <- split(team_data, team_data$GameDate)
  names(week_splits) <- week_labels  
  
  return(week_splits)
})

pbp_data2022 <- pbp.2022 %>%
  mutate(GameDate = as.Date(GameDate, format="%Y-%m-%d")) %>%
  arrange(OffenseTeam, GameDate)
team_splits2022 <- split(pbp_data2022, pbp_data2022$OffenseTeam)

team_week_splits2022 <- lapply(team_splits, function(team_data) {
  unique_dates <- sort(unique(team_data$GameDate))
  
  week_labels <- paste0("Week", seq_along(unique_dates))
  week_splits <- split(team_data, team_data$GameDate)
  names(week_splits) <- week_labels  
  
  return(week_splits)
})

pbp_data2023 <- pbp.2023 %>%
  mutate(GameDate = as.Date(GameDate, format="%Y-%m-%d")) %>%
  arrange(OffenseTeam, GameDate)
team_splits2023 <- split(pbp_data2023, pbp_data2023$OffenseTeam)

team_week_splits2023 <- lapply(team_splits, function(team_data) {
  unique_dates <- sort(unique(team_data$GameDate))
  
  week_labels <- paste0("Week", seq_along(unique_dates))
  week_splits <- split(team_data, team_data$GameDate)
  names(week_splits) <- week_labels  
  
  return(week_splits)
})

pbp_data2024 <- pbp.2024 %>%
  mutate(GameDate = as.Date(GameDate, format="%Y-%m-%d")) %>%
  arrange(OffenseTeam, GameDate)
team_splits2024 <- split(pbp_data2024, pbp_data2024$OffenseTeam)

team_week_splits2024 <- lapply(team_splits, function(team_data) {
  unique_dates <- sort(unique(team_data$GameDate))
  
  week_labels <- paste0("Week", seq_along(unique_dates))
  week_splits <- split(team_data, team_data$GameDate)
  names(week_splits) <- week_labels  
  
  return(week_splits)
})
