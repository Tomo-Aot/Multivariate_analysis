# 2025-08-03
# reading packages
library(tidyverse)
library(vegan)
library(ggpubr)
library(showtext)
library(magick)

# setting fonts
font_add_google(name = "Noto Sans", family = "ns")
theme_pubr(base_size = 10, base_family = "ns") |> 
  theme_set()
showtext_auto()

# data preparation
data("mtcars")

df = mtcars |> as_tibble(rownames = "car")

# about this data set ######################################################
# mpg ... Miles/gallon (United States)
# cyl ... Number of Cylinders (エンジン内のピストンが往復する円筒形の部品)
# disp ... Displacement
# hp ... Gross Horsepower (馬力 in Japanese)
# drat ... Rear Axle Ratio
# wt ... Weight (1000 pounds)
# qsec ... 0.25 mile time
# vs ... Engine Type (0 = V-shaped, 1 = Straight)
# am ... Transmission (0 = Automatic, 1 = Manual)
# gear ... Number of Forward Gears
# carb ... Number of Carburetors
############################################################################

# Develop a Hypothesis #####################################################
# In this script, I am going to use "mpg" as the Response Variable
# It seems that "cyl", "hp", and "wt" have an Impact on the Response.

# Model Construction #######################################################
m1 = glm(mpg ~ cyl + hp + wt, data = df,
         family = gaussian("identity"))

# Summarise the Model
summary(m1)

# Model Diagnostics
plot(m1, which = 1)
plot(m1, which = 2)
plot(m1, which = 3)
plot(m1, which = 4)
plot(m1, which = 5)

# Multicollinearity
# The Variance Inflation Factor (VIF) is an index
# used to detect multicollinearity among the explanatory variables
car::vif(m1)








