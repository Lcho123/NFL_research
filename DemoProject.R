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
pbp.2021<-read.csv("~/Documents/pbp-2021.csv")
pbp.2022<-read.csv("~/Documents/pbp-2022.csv")
pbp.2023<-read.csv("~/Documents/pbp-2023.csv")
pbp.2024<-read.csv("~/Documents/pbp-2024.csv")

unique_teams <- unique(pbp.2024$OffenseTeam)
team_subsets <- list()
for (team in unique_teams) {
  team_subsets[[team]] <- pbp.2024 %>% filter(OffenseTeam == team)
}
for (team in unique_teams) {
  write.csv(team_subsets[[team]], paste0("pbp2024_", team, ".csv"), row.names = FALSE)
}
length(team_subsets)
View(team_subsets[["ATL"]])
