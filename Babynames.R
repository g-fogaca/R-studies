# importando biblioteca
library(tidyverse)

# importando dados
babynames <- read_rds('babynames.rds')

babynames %>%
  # Filter for the year 1990
  filter(year == 1990) %>%
  # Sort the number column in descending order
  arrange(desc(number))

# Find the most common name in each year
babynames %>%
  group_by(year) %>% 
  slice_max(number)

# Filter for the names Steven, Thomas, and Matthew 
selected_names <- babynames %>%
  filter(name %in% c('Steven', 'Thomas', 'Matthew'))

# Plot the names using a different color for each name
ggplot(selected_names, aes(x = year, y = number, color = name)) +
  geom_line()

# Calculate the fraction of people born each year with the same name
babynames %>% 
  group_by(year) %>% 
  mutate(year_total = sum(number)) %>% 
  ungroup() %>% 
  mutate(fraction = number / year_total) %>% 
  # Find the year each name is most common
  group_by(name) %>% 
  slice_max(fraction, n=1)

# Add columns name_total and name_max for each name
babynames %>% 
  group_by(name) %>% 
  mutate(name_total = sum(number), name_max = max(number)) %>% 
  # Ungroup the table 
  ungroup() %>% 
  # Add the fraction_max column containing the number by the name maximum
  mutate(fraction_max = number / name_max)

# data
names_normalized <- babynames %>%
  group_by(name) %>%
  mutate(name_total = sum(number),
         name_max = max(number)) %>%
  ungroup() %>%
  mutate(fraction_max = number / name_max)

# Filter for the names Steven, Thomas, and Matthew
names_filtered <- names_normalized %>% 
  filter(name %in% c('Steven', 'Thomas', 'Matthew'))

# Visualize these names over time
ggplot(names_filtered, aes(x=year, y=fraction_max, color=name)) +
  geom_line()

babynames_fraction <- babynames %>% 
  group_by(year) %>% 
  mutate(year_total = sum(number)) %>% 
  ungroup() %>% 
  mutate(fraction = number / year_total) %>% 
  # Find the year each name is most common
  group_by(name) %>% 
  slice_max(fraction, n=1)
# Arrange the data in order of name, then year
babynames_fraction %>%
  arrange(name, year) %>% 
  # Group the data by name
  group_by(name) %>%
  # Add a ratio column that contains the ratio
  # of fraction between each year
  mutate(ratio = fraction / lag(fraction))
