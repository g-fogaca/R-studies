# Load the ggplot2 package
library(ggplot2)

# Explore the mtcars data frame with str()
str(mtcars)

# Execute the following command
ggplot(mtcars, aes(cyl, mpg)) +
  geom_point()

# Change the command below so that cyl is treated as factor
ggplot(mtcars, aes(factor(cyl), mpg)) +
  geom_point()

# Edit to add a color aesthetic mapped to disp
ggplot(mtcars, aes(wt, mpg, color=disp)) +
  geom_point()

# Change the color aesthetic to a size aesthetic
ggplot(mtcars, aes(wt, mpg, size = disp)) +
  geom_point()

# Explore the diamonds data frame with str()
str(diamonds)

# Add geom_point() with +
ggplot(diamonds, aes(carat, price)) +
  geom_point()

# Add geom_smooth() with +
ggplot(diamonds, aes(carat, price)) +
  geom_point() +
  geom_smooth()

# Map the color aesthetic to clarity
ggplot(diamonds, aes(carat, price, color = clarity)) +
  geom_point() +
  geom_smooth()

# Make the points 40% opaque
ggplot(diamonds, aes(carat, price, color = clarity)) +
  geom_point(alpha=0.4) +
  geom_smooth()

# Draw a ggplot
plt_price_vs_carat <- ggplot(
  # Use the diamonds dataset
  diamonds,
  # For the aesthetics, map x to carat and y to price
  aes(carat, price)
)

# Add a point layer to plt_price_vs_carat
plt_price_vs_carat + geom_point()

# Edit this to make points 20% opaque: plt_price_vs_carat_transparent
plt_price_vs_carat_transparent <- plt_price_vs_carat +
  geom_point(alpha=0.2)

# See the plot
plt_price_vs_carat_transparent

# Edit this to map color to clarity,
# Assign the updated plot to a new object
plt_price_vs_carat_by_clarity <- plt_price_vs_carat +
  geom_point(aes(color=clarity))

# See the plot
plt_price_vs_carat_by_clarity

# Map x to mpg and y to fcyl
ggplot(mtcars, aes(mpg, cyl)) +
  geom_point()

# Swap mpg and fcyl
ggplot(mtcars, aes(cyl, mpg)) +
  geom_point()

# Map x to wt, y to mpg and color to fcyl
ggplot(mtcars, aes(wt, mpg, color = cyl)) +
  geom_point()

# Set the shape and size of the points
ggplot(mtcars, aes(wt, mpg, color = cyl)) +
  geom_point(shape = 1, size = 4)

# Map fcyl to fill
ggplot(mtcars, aes(wt, mpg, fill = cyl)) +
  geom_point(shape = 1, size = 4)

# Change point shape; set alpha
ggplot(mtcars, aes(wt, mpg, fill = cyl)) +
  geom_point(shape = 21, size = 4, alpha = 0.6)

# Establish the base layer
plt_mpg_vs_wt <- ggplot(mtcars, aes(wt, mpg))

# Map fcyl to size
plt_mpg_vs_wt +
  geom_point(aes(size = cyl))

# Map fcyl to alpha, not size
plt_mpg_vs_wt +
  geom_point(aes(alpha = cyl))

# A hexadecimal color
my_blue <- "#4ABEFF"

ggplot(mtcars, aes(wt, mpg)) +
  # Set the point color and alpha
  geom_point(color = my_blue, alpha = 0.6)

ggplot(mtcars, aes(wt, mpg, color = cyl)) +
  # Add text layer with label rownames(mtcars) and color red
  geom_text(color = "red", label = rownames(mtcars))

ggplot(mtcars, aes(wt, mpg, color = cyl)) +
  # Add points layer with shape 24 and color yellow
  geom_point(shape = 24, color = "yellow")

# Plot price vs. carat, colored by clarity
plt_price_vs_carat_by_clarity <- ggplot(diamonds,
                                      aes(carat, price, color = clarity))
# Add a point layer with tiny points
plt_price_vs_carat_by_clarity + geom_point(shape = ".", alpha = 0.5)

# Update the point shape to remove the line outlines
# by setting shape to 16.
plt_price_vs_carat_by_clarity + geom_point(alpha = 0.5, shape = 16)

# Plot mpg
ggplot(mtcars, aes(mpg)) +
  # Add a histogram layer
  geom_histogram()

# Set the binwidth to 1
ggplot(mtcars, aes(mpg)) +
  geom_histogram(binwidth = 1)

# Map y to ..density..
ggplot(mtcars, aes(mpg, y = ..density..)) +
  geom_histogram(binwidth = 1)

datacamp_light_blue <- "#51A8C9"
ggplot(mtcars, aes(mpg, ..density..)) +
  # Set the fill color to datacamp_light_blue
  geom_histogram(binwidth = 1, fill = datacamp_light_blue)