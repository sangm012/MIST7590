# Parameters --------------------------------------------------------------
path <- "C:/Users/TXN8523/OneDrive - The Home Depot/Desktop/XLS GP_MIST7590E Technology Capstone Project/MIST7590-master/LAMP_Web_App"
#setwd(path) 
# Parameters --------------------------------------------------------------
measures_hour <-  6 # solar radiation measures per hour 
daily_moles = 3 # plan requirement in moles per day 
LEDWMax <- 600 # LED max Watts
LEDs <- 1200 # Number of lights in the Greenhouse
kw_max <- LEDWMax/1000 # max kw per hour when the LEDs are fully on 
kw_min <- 0 # minimum kw per hour(When the LEDs are off) 
photon_max <- 200 # max number of photons delivered by the LEDs 
LEDCost <- 100 # Incremental cost of adding adaptivity to each light
LEDTotalCost <- LEDCost*LEDs 
LEDLife <- 10
#y=ae^bx is the equation for plant growth
a <-  124.3
b <-  0.002737
elect_fixed = TRUE # if the electricity rate is fixed: 
elect_rate = .12 #electricity fixed rate 
year_range <- 2010:2014 # the range of years.
hour_range <- 4:23 # when artificial lighting stops includes all of the hour, eg 23:59 
radiation_url <-  "radiation10.feather" # radiation data.
electricity_url <- "electricity.feather" # electricity data
avg_light_hours <- 3.25 # based on survey data
base_cost_manual <- avg_light_hours*elect_rate*kw_max*365.25*LEDs

# Constants ---------------------------------------------------------------
opacity_filter <-  .7 # lose 30% from greenhouse glass 
watts_moles <-  2.03 # conversion rate of watts to moles 

# Computed

# calculate number of leap years in the range to adjust daily means
years <- length(year_range)
hours <- length(hour_range)
loop_start <- paste0(year_range[1] -1, '-12-31')
