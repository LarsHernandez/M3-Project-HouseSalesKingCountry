install.packages("ggforce")

library(tidyverse)
library(ggforce)
library(GGally)
library(ggplot2)
library(ggthemes)

#DATA

data <- read_csv("https://raw.githubusercontent.com/LarsHernandez/M3-Project-HouseSalesKingCountry/Graverz/kc_house_data.csv")

subdata <- data[,c(3,4,5,6,7,8,9,12,15,17,20,21)] %>% filter(bedrooms!=33)

#Correlation matrix

ggplot(subdata, aes(x = .panel_x, y = .panel_y)) + 
  geom_point(alpha = 0.3) + 
  geom_smooth(span = 0.5)+
  geom_autodensity(alpha = 0.3, colour = NA, position = 'identity') + 
  stat_density_2d(colour="black") +
  facet_matrix(vars(price,bedrooms,bathrooms,sqft_living,sqft_lot,grade,yr_built,sqft_living15,sqft_lot15), layer.diag = 3, layer.upper = 4) + 
  labs(title="...")

