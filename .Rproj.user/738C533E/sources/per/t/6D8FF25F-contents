## HEADER ####
## WHO: JOE COLLINS
## WHAT: soil texture data load
## LAST EDIT: 24/03/2023
####

## 00 packages ####

source(file = "scripts/packages.R")

## 01 LOAD DATA ####

dat <- read.csv("data/QBS.count.soil.csv")

f1 <-  readOGR( 
  dsn= "/Users/u1764794/OneDrive - Harper Adams University/GHG field experiment/Shapefiles/Field Boundaries/" , 
  layer="Field_1_Boundary",
  verbose=FALSE
)

f2 <-  readOGR( 
  dsn= "/Users/u1764794/OneDrive - Harper Adams University/GHG field experiment/Shapefiles/Field Boundaries/" , 
  layer="Field_2_Boundary",
  verbose=FALSE
)

# Factors

dat$Treatment <- as.factor(dat$Treatment)

# # filter to CON system
# datCON <- data %>% filter(Treatment == "Conventional")
# 
# # filter to CA system
# datCA <- data %>% filter(Treatment == "Conservation")


# ## 04.2 change grid CRS ####
# f1 <- st_as_sf(f1, crs = 27700)
# f1 <- st_transform(f1, crs = 4326)
# 
# f2 <- st_as_sf(f2, crs = 27700)
# f2 <- st_transform(f2, crs = 4326)
# 
# # BNG to WGS-84 for spatial grid
# dat <- st_as_sf(dat, coords = c("x","y"),crs=27700)
# dat <- st_transform(dat, crs = 4326)
# 
# 
# class(DT1_sf)
# 
# DT1_sf_4326 <- DT1_sf %>% st_transform(crs = 4326)
# 
# f_grid$ycoord <- st_coordinates(DT1_sf_4326)[,2]
# f_grid$xcoord <- st_coordinates(DT1_sf_4326)[,1]
# 
# # BNG to WGS-84 for data
# 
# DT1_sf <- st_as_sf(my_data, coords = c("Longitude","Latitude"),crs=27700)
# 
# class(DT1_sf)
# 
# DT1_sf_4326 <- DT1_sf %>% st_transform(crs = 4326)
# 
# my_data$Latitude <- st_coordinates(DT1_sf_4326)[,2]
# my_data$Longitude <- st_coordinates(DT1_sf_4326)[,1]
