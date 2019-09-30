library(readr)
library(maptools)
library(lubridate)
library(dplyr)
library(feather)
library(ggplot2)
library(stringr)
library(FinCal)

# Parameters --------------------------------------------------------------
source('parameters.R')
source('prepare.R')

# Set target ppf
Tetr <-  as.double((daily_moles * 1e6 / (hours * 3600)))
Tppf <-  as.double(log(a / (a - Tetr)) / b)

# simulation of adaptive lighting without exceeding daily moles requirement for any day ----------------------------------------
es$LEDonDay <- ifelse(es$etrDailySum < daily_moles, TRUE, FALSE) # not enough light for the day
# create cumulative day sum
es$date <- as.Date(es$TimeStamp)
# compute when cheapest to fill gap
# es$gapCost <-  as.double((LEDkwMax - LEDkwMin) * ((Tppf - es$ppf)/ LEDMaxPhoton*es$rate)) 
# es$gapCost <- ifelse(es$gapCost > 0, es$gapCost,9999)
es1 <- arrange(es,date,rate) # sort each day by cheapest cost for meeting gap
# cumulative light received during the day
etrCumsumDay <- es1 %>% group_by(date) %>% mutate(cumsum = cumsum(etr_led + etr)*3600/measures_hour*1e-6)
es2 <- etrCumsumDay[,c('TimeStamp','cumsum')]
colnames(es2) <-  c('TimeStamp', 'etrCumsumDay')
es3 <- inner_join(es1,es2)
es <- arrange(es3,date,rate)
# compute cost
es$LEDon <- ifelse(es$ppf < Tppf & es$LEDonDay & (es$etrDailySum + es$etrCumsumDay) < daily_moles, TRUE, FALSE) # not enough light for the day and the time interval
es$kw <- ifelse(es$LEDon, as.double((kw_max - kw_min) * ((Tppf - es$ppf) / photon_max)),0) 
es$kw <- ifelse(es$kw > kw_max, kw_max,es$kw)
es$kwCost <- es$kw*es$rate/measures_hour
source('report.R', echo = T)
