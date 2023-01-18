library(tidyverse)

# View the structure of mtcars
str(mtcars)

# Using mtcars, draw a scatter plot of mpg vs. wt
ggplot(mtcars, aes(wt, mpg)) +
  geom_point()

# Amend the plot to add a smooth layer
ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  geom_smooth()

# Amend the plot. Use lin. reg. smoothing; turn off std err ribbon
ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

# Amend the plot. Swap geom_smooth() for stat_smooth().
ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  stat_smooth(method = "lm", se = FALSE)

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  # Add 3 smooth LOESS stats, varying span & color
  stat_smooth(se = FALSE, color = 'red', span = 0.9) +
  stat_smooth(se = FALSE, color = 'green', span = 0.6) +
  stat_smooth(se = FALSE, color = 'blue', span = 0.3)

# Produce a scatter plot of brainwt vs. bodywt
ggplot(msleep, aes(bodywt, brainwt)) +
  geom_point() +
  ggtitle("Raw Values")

# Add scale_*_*() functions
ggplot(msleep, aes(bodywt, brainwt)) +
  geom_point() +
  scale_x_log10() +
  scale_y_log10() +
  ggtitle("Scale_ functions")

# Perform a log10 coordinate system transformation
ggplot(msleep, aes(bodywt, brainwt)) +
  geom_point() +
  coord_trans(x = "log10", y = "log10")

# Plot with a scale_*_*() function:
ggplot(msleep, aes(bodywt, brainwt)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  # Add a log10 x scale
  scale_x_log10() +
  # Add a log10 y scale
  scale_y_log10() +
  ggtitle("Scale functions")

# Add a log10 coordinate transformation for x and y axes
ggplot(msleep, aes(bodywt, brainwt)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  ggtitle("Scale functions")
  coord_trans(x = "log10", y = "log10")
