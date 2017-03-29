library(leaflet)

# add single points
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



#get subset of data source
#lat/lng must be vector
names(rawinputtb)
id <- as.numeric(names(rawinput[[1]]))
lat <- unlist(rawinput[[8]])
lng = unlist(rawinput[[10]])


# with cluster of input lat/lng and cluster plugin option
# label or popup must be character
m1 <- leaflet() %>% addTiles() %>% 
  addMarkers(lat=rawinputtb$latitude,lng=rawinputtb$longitude,
             popup = as.character(rawinputtb$listing_id),
             clusterOptions = markerClusterOptions()) %>%
  addCircles(lng=-73.9821, lat=40.7575, weight = 1,
           radius = 100000)
m1


# add single points
m <- leaflet() %>% addTiles() %>%
  addMarkers(lng=-73.9539, lat=40.7108, popup = "Test location") %>%
  setView(lng=-73.9539, lat=40.7575, zoom=5) %>%
  addCircles(lng=-73.9821, lat=40.7575, weight = 1,
             radius = 10000) %>%
  addRectangles(
    lng1=-72.9539, lat1=41.7108,#1: north-east, 2:south-west
    lng2=-74.9539, lat2=39.7108,
    fillColor = "transparent")
m