electricity_df <- read_feather(electricity_url) 
electricity <-  electricity_df %>%
  filter(year(timestamp) %in% year_range) %>% 
  filter(hour(timestamp) %in% hour_range) %>%
  mutate(rate = cost/100)
if(elect_fixed) {
  electricity$rate <- elect_rate
}
electricity$cost <- NULL

solar_df <- read_feather(radiation_url) 
solar <- solar_df %>% 
  filter(year(TimeStamp) %in% year_range) %>% 
  filter(hour(TimeStamp) %in% hour_range) 

# Computations
solar$ppf <-  solar$SolarWatt * watts_moles * opacity_filter  
solar$etr = a * (1 - exp(-b * solar$ppf)) 
max_etr <- a * (1 - exp(-b * photon_max)) # max for a LED
solar$etr_led <- max_etr - solar$etr # photons supplied by LED
solar$etr_led <- ifelse(solar$etr_led < 0,0,solar$etr_led) # remove negatives

# Join the tables on date-hour
solar$datehour <-  format(solar$TimeStamp, '%F-%H')
electricity$datehour <-  format(electricity$timestamp, '%F-%H')
es1 <-  inner_join(solar, electricity)
es1$timestamp <-  NULL
es1$datehour <-  NULL

# Compute cumulative daily ETR total in moles------------------------
ETRdaysum <- es1 %>% 
  group_by(date(TimeStamp)) %>% 
  summarize(sum = mean(etr)*length(hour_range)*3600*1e-6)
colnames(ETRdaysum) <-  c('date', 'etrDailySum')
# join with es1
es1$date <-  date(es1$TimeStamp)
es <-  inner_join(es1, ETRdaysum)
es$date <- NULL
