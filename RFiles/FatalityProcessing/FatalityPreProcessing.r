# Reading the CSV file
path <- "C:\\Users\\Pranav Viswanathan\\Downloads\\Global_Landslide_Catalog_Export.csv"
content <- read.csv(path)

# Reducing dataframe to usable size to analyze fatalities per landslide type
reducedDataframe = data.frame(content$source_name, content$event_id, content$landslide_category, content$landslide_size, content$fatality_count)
colnames(reducedDataframe) = c("source_name", "event_id", "landslide_category", "landslide_size", "fatality_count")
summary(reducedDataframe)

# Removing NULL Values
reducedDataframe = na.omit(reducedDataframe)
summary(reducedDataframe)

# Displaying unique lanslide categories
landslideCategoryAll = unique(reducedDataframe$landslide_category)
print(landslideCategoryAll)

# Initilizing vectors to store Fatality data
mudslideFatalities = c()
landslideFatalities = c()
complexFatalities = c()
rock_fallFatalities = c()
debris_flowFatalities = c()
riverbank_collapseFatalities = c()
laharFatalities = c()
snow_avalancheFatalities = c()
creepFatalities = c()
earth_flowFatalities = c()
translational_slideFatalities = c()


# Adding fatality data to each vector
for (row in 1:nrow(reducedDataframe)) {
  eventId = reducedDataframe[row, "event_id"]
  landslideCategory = reducedDataframe[row, "landslide_category"]
  fatalities = reducedDataframe[row, "fatality_count"]

  if (landslideCategory == "mudslide") {
    mudslideFatalities = append(mudslideFatalities, fatalities)
  } else if (landslideCategory == "landslide") {
    landslideFatalities = append(landslideFatalities, fatalities)
  }else if (landslideCategory == "complex") {
    complexFatalities = append(complexFatalities, fatalities)
  }else if (landslideCategory == "rock_fall") {
    rock_fallFatalities = append(rock_fallFatalities, fatalities)
  }else if (landslideCategory == "debris_flow") {
    debris_flowFatalities = append(debris_flowFatalities, fatalities)
  }else if (landslideCategory == "riverbank_collapse") {
    riverbank_collapseFatalities = append(riverbank_collapseFatalities, fatalities)
  }else if (landslideCategory == "lahar") {
    laharFatalities = append(laharFatalities, fatalities)
  }else if (landslideCategory == "snow_avalanche") {
    snow_avalancheFatalities = append(snow_avalancheFatalities, fatalities)
  }else if (landslideCategory == "creep") {
    creepFatalities = append(creepFatalities, fatalities)
  }else if (landslideCategory == "earth_flow") {
    earth_flowFatalities = append(earth_flowFatalities, fatalities)
  }else if (landslideCategory == "translational_slide") {
    translational_slideFatalities = append(translational_slideFatalities, fatalities)
  }
}

# Finding the total dead per landslide type
sumMudDed = sum(mudslideFatalities)
sumLandDed = sum(landslideFatalities)
sumComplexDed = sum(complexFatalities)
sumRockDed = sum(rock_fallFatalities)
sumDebrisDed = sum(debris_flowFatalities)
sumRivDed = sum(riverbank_collapseFatalities )
sumLaharDed = sum(laharFatalities)
sumSnowDed = sum(snow_avalancheFatalities)
sumCreepDed = sum(creepFatalities)
sumEarthDed = sum(earth_flowFatalities)
sumTransDed = sum(translational_slideFatalities)

# Creating vectors for bar plot
deadExplained = c("Mudslides", "Landslides", "Comp", "RockFall", "Debris", "Riverbank", "Lahar", "Snow", "Creep", "Earth", "Trans")
ded = c(sumMudDed, sumLandDed, sumComplexDed, sumRockDed, sumDebrisDed, sumRivDed, sumLaharDed, sumSnowDed, sumCreepDed, sumEarthDed, sumTransDed)
print(ded)

# Bar plot
png(file = "D:\\Education\\VIT\\Year3\\Sem5\\FundamentalsOfDataAnalytics\\Project\\ProjectFiles\\fatalitiesBarGraph.png")
barplot(ded, main = "Total Fatalities per landslide type", ylim=range(pretty(c(0, dat))), names.arg = deadExplained)
dev.off()
