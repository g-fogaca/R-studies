# Selecionando pacotes
library(tidyverse)

# Carregando dataset
counties <- read_rds('counties.rds')

# Inspecionando
glimpse(counties)

# Selecting columns
counties %>%
  select(state, county, population, poverty)

# Selecting variablues
counties_selected <-counties %>% 
  select(state, county, population, private_work,
         public_work, self_employed)

# Add a verb to sort in descending order of public_work
counties_selected %>% 
  arrange(desc(public_work))

# Filter for counties with a population above 1000000 in california
counties_selected %>% 
  filter(population > 1000000, state == 'California')

# Filter for Texas and more than 10000 people; sort in
# descending order of private_work
counties_selected %>%
  filter(state == 'Texas', population > 10000) %>% 
  arrange(desc(private_work))

# Add a new column public_workers with the number of people employed
# in public work
counties_selected %>% 
  mutate(public_workers = population * public_work/100) %>% 
  # Sort in descending order of the public_workers column
  arrange(desc(public_workers))

# Select the columns state, county, population, men, and women
counties_selected <- counties %>% 
  select(state, county, population, men, women)

# Calculate proportion_women as the fraction of the population
# made up of women
counties_selected %>% 
  mutate(proportion_women = women / population)

# Add a variable proportion_men with the fraction of the
# county's population made up of men.
counties_selected %>% 
  mutate(proportion_men = men / population) %>% 
  # Filter for population of at least 10,000
  filter(population >= 10000) %>% 
  # Arrange proportion of men in descending order 
  arrange(desc(proportion_men))
  
# Use count to find the number of counties in each region
counties_selected <- counties %>%
  select(county, region, state, population, citizens)

counties_selected %>%
  count(region, sort=TRUE)

# Find number of counties per state, weighted by citizens,
# sorted in descending order
counties_selected %>% 
  count(state, wt=citizens, sort = TRUE)

# Add population_walk containing the total number of people who
# walk to work 
counties_selected <- counties %>%
  select(county, region, state, population, walk)

counties_selected %>% 
  mutate(population_walk = walk/100 * population) %>% 
  # Count weighted by the new column, sort in descending order
  count(state, wt=population_walk, sort=TRUE)

counties_selected <- counties %>%
  select(county, population, income, unemployment)
# Summarize to find minimum population, maximum unemployment,
# and average income
counties_selected %>% 
  summarise(min_population = min(population),
      max_unemployment = max(unemployment), average_income = mean(income))

counties_selected <- counties %>%
  select(state, county, population, land_area)
# Group by state 
counties_selected %>% 
# Find the total area and population
  group_by(state) %>% 
  summarize(total_area = sum(land_area),
            total_population = sum(population)) %>% 
  # Add a density column
  mutate(density = total_population / total_area) %>% 
  # Sort by density in descending order
  arrange(desc(density))

counties_selected <- counties %>%
  select(region, state, county, population)
# Group and summarize to find the total population
counties_selected %>% 
  group_by(region, state) %>% 
  summarise(total_pop = sum(population)) %>% 
  # Calculate the average_pop and median_pop columns 
  summarise(average_pop = mean(total_pop), median_pop = median(total_pop))

counties_selected <- counties %>%
  select(region, state, county, metro, population, walk)
# Group by region
counties_selected %>% 
  group_by(region) %>% 
  # Find the county with the highest percentage of people who walk to work
  slice_max(walk)

counties_selected <- counties %>%
  select(region, state, county, population, income)
# Calculate average income
counties_selected %>% 
  group_by(region, state) %>% 
  summarise(average_income = mean(income)) %>% 
  # Find the lowest income state in each region
  slice_min(average_income)

counties_selected <- counties %>%
  select(state, metro, population)
# Find the total population for each combination of state and metro
counties_selected %>% 
  group_by(state, metro) %>% 
  summarize(total_pop = sum(population)) %>% 
  # Extract the most populated row for each state
  slice_max(total_pop, n=1) %>% 
  # Count the states with more people in Metro or Nonmetro areas
  ungroup() %>% 
  count(metro)

# Glimpse the counties table
glimpse(counties)
# Select state, county, population, and industry-related columns
counties %>% 
  select(state, county, population, professional:production) %>% 
  # Arrange service in descending order 
  arrange(desc(service))

# Select the state, county, population, and those ending with "work"
counties %>% 
  select(state, county, population, ends_with('work')) %>% 
  filter(public_work >= 50)

counties %>%
  # Count the number of counties in each state
  count(state) %>% 
  # Rename the n column to num_counties
  rename(num_counties = n)

counties %>%
  # Select state, county, and poverty as poverty_rate
  select(state, county, poverty_rate = poverty)

counties %>%
  # Keep the state, county, and populations columns,
  # and add a density column
  transmute(state, county, population,
            density = population / land_area) %>% 
  # Filter for counties with a population greater than one million 
  filter(population > 1000000) %>% 
  # Sort density in ascending order 
  arrange(density)

# Change the name of the unemployment column
counties %>%
  rename(unemployment_rate = unemployment)

# Keep the state and county columns, and the columns containing poverty
counties %>%
  select(state, county, contains("poverty"))

# Calculate the fraction_women column without dropping the other columns
counties %>%
  mutate(fraction_women = women / population)

# Keep only the state, county, and employment_rate columns
counties %>%
  transmute(state, county, employment_rate = employed / population)
