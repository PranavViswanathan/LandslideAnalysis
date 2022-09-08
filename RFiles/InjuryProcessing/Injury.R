# Reading the CSV file
path <- "C:\\Users\\Pranav Viswanathan\\Downloads\\Global_Landslide_Catalog_Export.csv"
content <- read.csv(path)

# Reducing dataframe to usable size to analyze fatalities per landslide type
reducedDataframe = data.frame(content$source_name, content$event_id, content$landslide_category, content$landslide_size, content$injury_count)
colnames(reducedDataframe) = c("source_name", "event_id", "landslide_category", "landslide_size", "injury_count")
summary(reducedDataframe)

# Removing NULL Values
reducedDataframe = na.omit(reducedDataframe)
summary(reducedDataframe)

# Initilizing vectors to store Injury data
mudslideInjuries = c()
landslideInjuries = c()
complexInjuries = c()
rock_fallInjuries = c()
debris_flowInjuries = c()
riverbank_collapseInjuries = c()
laharInjuries = c()
snow_avalancheInjuries = c()
creepInjuries = c()
earth_flowInjuries = c()
translational_slideInjuries = c()

# Adding injury data to each vector
for (row in 1:nrow(reducedDataframe)) {
  eventId = reducedDataframe[row, "event_id"]
  landslideCategory = reducedDataframe[row, "landslide_category"]
  Injuries = reducedDataframe[row, "injury_count"]
  
  if (landslideCategory == "mudslide") {
    mudslideInjuries = append(mudslideInjuries, Injuries)
  } else if (landslideCategory == "landslide") {
    landslideInjuries = append(landslideInjuries, Injuries)
  }else if (landslideCategory == "complex") {
    complexInjuries = append(complexInjuries, Injuries)
  }else if (landslideCategory == "rock_fall") {
    rock_fallInjuries = append(rock_fallInjuries, Injuries)
  }else if (landslideCategory == "debris_flow") {
    debris_flowInjuries = append(debris_flowInjuries, Injuries)
  }else if (landslideCategory == "riverbank_collapse") {
    riverbank_collapseInjuries = append(riverbank_collapseInjuries, Injuries)
  }else if (landslideCategory == "lahar") {
    laharInjuries = append(laharInjuries, Injuries)
  }else if (landslideCategory == "snow_avalanche") {
    snow_avalancheInjuries = append(snow_avalancheInjuries, Injuries)
  }else if (landslideCategory == "creep") {
    creepInjuries = append(creepInjuries, Injuries)
  }else if (landslideCategory == "earth_flow") {
    earth_flowInjuries = append(earth_flowInjuries, Injuries)
  }else if (landslideCategory == "translational_slide") {
    translational_slideInjuries = append(translational_slideInjuries, Injuries)
  }
}

# Finding the total injured per landslide type
sumMudInj = sum(mudslideInjuries)
sumLandInj = sum(landslideInjuries)
sumComplexInj = sum(complexInjuries)
sumRockInj = sum(rock_fallInjuries)
sumDebrisInj = sum(debris_flowInjuries)
sumRivInj = sum(riverbank_collapseInjuries )
sumLaharInj = sum(laharInjuries)
sumSnowInj = sum(snow_avalancheInjuries)
sumCreepInj = sum(creepInjuries)
sumEarthInj = sum(earth_flowInjuries)
sumTransInj = sum(translational_slideInjuries)

# Creating vectors for bar plot
injuredExplained = c("Mudslides", "Landslides", "Comp", "RockFall", "Debris", "Riverbank", "Lahar", "Snow", "Creep", "Earth", "Trans")
Inj = c(sumMudInj, sumLandInj, sumComplexInj, sumRockInj, sumDebrisInj, sumRivInj, sumLaharInj, sumSnowInj, sumCreepInj, sumEarthInj, sumTransInj)
print(Inj)

# Bar plot
barplot(Inj, main = "Total Injuries per landslide type", names.arg = injuredExplained)
