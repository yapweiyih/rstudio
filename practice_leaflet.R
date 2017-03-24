library(leaflet)

m <- leaflet() %>% addTiles() %>%
  addMarkers(lng=-73.9539, lat=40.7108, popup = "Test location") %>%
  setView(lng=-73.9539, lat=40.7108, zoom=17)
m

# Alternative w/o using pipe
m1 <- leaflet()
m2 <- addTiles(m1)
m3 <- addMarkers(m2, lng=174.768, lat=-36.852, popup = "Test location")
m3
class(m3)

#setview


#get subset of data source
names(rawinput)
length(rawinput[[1]])
lat <- unlist(rawinput[[8]])
lng = unlist(rawinput[[10]])
testdf <- data.frame(names(lat),lat,lng)
names(testdf) <- c("listing","lat","lng")
testdf

# with input lat/lng and cluster option
m1 <- leaflet() %>% addTiles() %>% 
  addMarkers(lat=testdf$lat,lng=testdf$lng, clusterOptions = markerClusterOptions())
m1



