install.packages(c("tidyverse", "lubridate", "plotly", "scales"))

library(tidyverse)
library(lubridate)
library(plotly)
library(scales)

setwd("C:/Users/samso/OneDrive/Desktop")
pharma <- read.csv("Ebi_pharma_products_dataset.csv")
print(pharma)
view(pharma)

#Data preparation
pharma <- pharma %>%
  mutate(
    discount_amount = price - final_price,
    total_product_value = price * pack_size,
    final_product_value = final_price * pack_size,
    revenue_lost = discount_amount * pack_size,
    rating_category = ifelse(rating >= 3.5, "High Rating", "Low Rating")
  )

print(pharma)
View(pharma)

#summary statistics
category_stats <- pharma %>%
  group_by(therapeutic_class) %>%
  summarise(
    Total_Products = n(),
    Average_Price = mean(price),
    Average_Final_Price = mean(final_price),
    Average_Rating = mean(rating),
    Total_Reviews = sum(num_reviews),
    .groups = "drop"
  )

category_stats

brand_stats <- pharma %>%
  group_by(brand_name) %>%
  summarise(
    Total_Products = n(),
    Average_Price = mean(price),
    Average_Rating = mean(rating),
    Total_Reviews = sum(num_reviews),
    .groups = "drop"
  )

brand_stats

dosage_stats <- pharma %>%
  group_by(dosage_form) %>%
  summarise(
    Total_Products = n(),
    Average_Price = mean(price),
    Average_Rating = mean(rating),
    .groups = "drop"
  )

dosage_stats

discount_stats <- pharma %>%
  group_by(discount_percent) %>%
  summarise(
    Total_Products = n(),
    Average_Discount = mean(discount_amount),
    Total_Revenue_Lost = sum(revenue_lost),
    Average_Rating = mean(rating),
    .groups = "drop"
  )

discount_stats

availability_stats <- pharma %>%
  group_by(availability_status) %>%
  summarise(
    Total_Products = n(),
    Average_Price = mean(price),
    Average_Rating = mean(rating),
    .groups = "drop"
  )

availability_stats

rating_stats <- pharma %>%
  group_by(rating_category) %>%
  summarise(
    Total_Products = n(),
    Average_Rating = mean(rating),
    Total_Reviews = sum(num_reviews),
    .groups = "drop"
  )

rating_stats

#visualizations
ggplot(category_stats,
       aes(x = "", y = Total_Products,
           fill = therapeutic_class)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  labs(title = "Product Distribution by Therapeutic Class") +
  theme_void()

ggplot(brand_stats,
       aes(x = brand_name, y = Total_Products,
           fill = brand_name)) +
  geom_col() +
  labs(
    title = "Brand-wise Product Analysis",
    x = "Brand Name",
    y = "Total Products"
  ) +
  theme_minimal()

ggplot(dosage_stats,
       aes(x = dosage_form, y = Total_Products,
           fill = dosage_form)) +
  geom_col() +
  labs(
    title = "Dosage Form Distribution",
    x = "Dosage Form",
    y = "Total Products"
  ) +
  theme_minimal()

ggplot(discount_stats,
       aes(x = factor(discount_percent),
           y = Total_Revenue_Lost,
           fill = factor(discount_percent))) +
  geom_col() +
  labs(
    title = "Discount-wise Revenue Loss Analysis",
    x = "Discount Percentage",
    y = "Revenue Lost"
  ) +
  theme_minimal()

ggplot(availability_stats,
       aes(x = availability_status,
           y = Total_Products,
           fill = availability_status)) +
  geom_col() +
  labs(
    title = "Pharmaceutical Product Availability",
    x = "Availability Status",
    y = "Total Products"
  ) +
  theme_minimal()

ggplot(rating_stats,
       aes(x = rating_category,
           y = Total_Products,
           fill = rating_category)) +
  geom_col() +
  labs(
    title = "Product Rating Analysis",
    x = "Rating Category",
    y = "Total Products"
  ) +
  theme_minimal()

plot_ly(
  category_stats,
  labels = ~therapeutic_class,
  values = ~Total_Products,
  type = "pie"
) %>%
  layout(title = "Therapeutic Class-wise Product Distribution")

plot_ly(
  brand_stats,
  x = ~brand_name,
  y = ~Total_Products,
  color = ~brand_name,
  type = "bar"
) %>%
  layout(
    title = "Interactive Brand-wise Product Analysis",
    xaxis = list(title = "Brand Name"),
    yaxis = list(title = "Total Products")
  )

plot_ly(
  discount_stats,
  x = ~discount_percent,
  y = ~Total_Revenue_Lost,
  type = "bar"
) %>%
  layout(
    title = "Discount-wise Revenue Loss Analysis",
    xaxis = list(title = "Discount Percentage"),
    yaxis = list(title = "Revenue Lost")
  )

plot_ly(
  dosage_stats,
  x = ~dosage_form,
  y = ~Total_Products,
  color = ~dosage_form,
  type = "bar"
) %>%
  layout(
    title = "Dosage Form Distribution",
    xaxis = list(title = "Dosage Form"),
    yaxis = list(title = "Total Products")
  )
