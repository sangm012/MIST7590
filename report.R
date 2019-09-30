# report ------------------------
model_cost <- sum(es$kwCost)/years*LEDs
paste0('Average annual cost: $', round(model_cost,2))
savings <- base_cost_manual - model_cost
paste0('Average annual saving of adaptive LEDs: ', round(savings,2))
paste('Average annual kw: ', round(sum(es$kw)/years*LEDs,2))
paste('Average hours per day each LED on: ', round(sum(es$LEDon)/measures_hour/365/years,2))
paste('Average annual cost per LED: ', round(sum(es$kwCost)/years,2))

paste('Average LED wattage: ', round(mean(es$kw),2))
flow <- c(-LEDTotalCost,rep(savings/12, LEDLife*12))
rate <- irr(cf=flow)*12
effRate <- (1+rate/12)^12 - 1
paste('ROI: ', round(mean(effRate*100),2), '%')
temp <- es %>% group_by(day = yday(TimeStamp)) %>% 
  summarize(cost = mean(kwCost)*24*measures_hour) %>% 
  filter(row_number() < 366) # discard extra day from graph
ggplot(temp, aes(day, cost)) + geom_point(color = 'darkgreen') +
  labs(y = 'Cost', x = 'Day of year') + ylim (0,1)
       