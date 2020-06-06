# saved the map data from here https://covid19.who.int/?gclid=Cj0KCQjw_ez2BRCyARIsAJfg-kt6nWFDMwD7V18FsTtqsTp-ApL0fnB0je2pvEnUifdcy6Q3nCD-zOUaAog2EALw_wcB
# and I'd like to make my own map.
# read in the data


library(magrittr)

library(rvest)

library(maps)
library(ggplot2)
library(plotly)
library(dplyr) 

covidwho <- read.csv("C:\\Users\\maryf\\Documents\\GitHub\\ca5\\WHO-COVID-19-global-data.csv")
head(covidwho)
#
dim(covidwho)



###### Process data and subset on countries
# sort(unique(series_df$Country.Region))
selected_countries = c('China', 'Italy', 'United States of America', 'Ireland', 'The United Kingdom')

   
covid_chn <-filter(covidwho, Country == "China")
head(covid_chn)

covid_ita <-filter(covidwho, Country == "Italy")
head(covid_ita)

covid_us <-filter(covidwho, Country == "United States of America")
head(covid_us)
covid_ire <-filter(covidwho, Country == "Ireland")
head(covid_ire)

covid_uk <-filter(covidwho, Country == "The United Kingdom")
head(covid_uk)
sum(covid_uk$New_deaths)




countries_of_interest <- filter(covidwho, Country %in% c('China', 'Italy', 'United States of America', 'Ireland', 'The United Kingdom'))
head(countries_of_interest)
head(countries_of_interest$ï..Date_reported)
# Open a pdf file
pdf("C:\\Users\\maryf\\Documents\\GitHub\\ca5\\New_death_5Countries.pdf") 
# 2. Create a plot

ggplot(countries_of_interest, aes(x = ï..Date_reported, y = New_deaths, color = Country)) +
  geom_line() +
  geom_point() +
  theme_minimal() +
  ggtitle("Daily Covid-19 Cases new_deaths, in 5 countries of Interest")
dev.off()


# Open a pdf file
pdf("C:\\Users\\maryf\\Documents\\GitHub\\ca5\\New_death_World.pdf") 
# 2. Create a plot
ggplot(covidwho, aes(x = ï..Date_reported, y = New_deaths, color = 'blue')) +
  geom_line() +
  geom_point() +
  theme_minimal() +
  ggtitle("Daily Covid-19 Cases new_deaths, in world") 
dev.off()

# Open a pdf file
pdf("C:\\Users\\maryf\\Documents\\GitHub\\ca5\\Cumulative_death_5Countries.pdf") 
# 2. Create a plot

ggplot(countries_of_interest, aes(x = ï..Date_reported, y = Cumulative_deaths, color = Country)) +
  geom_line() +
  geom_point() +
  theme_minimal() +
  ggtitle("Daily Covid-19 Total Deaths, in 5 countries of Interest")
dev.off()


# Open a pdf file
pdf("C:\\Users\\maryf\\Documents\\GitHub\\ca5\\Cumulative_death_World.pdf") 
# 2. Create a plot
ggplot(covidwho, aes(x = ï..Date_reported, y = Cumulative_deaths, color = 'blue')) +
  geom_line() +
  geom_point() +
  theme_minimal() +
  ggtitle("Daily Covid-19 Cases Total Deaths, in world") 

dev.off()

# saving to output file.
write.csv(covidwho,'C:\\Users\\maryf\\Documents\\GitHub\\ca5\\covidwho_out.csv')
