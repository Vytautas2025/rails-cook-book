# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# 1. Clean the DB
# 2. Create the data, populate the db
# 3. Put messages to let yoursef know what is happening

Recipe.create!(
  name: "Tiramisu",
  description: "Classic Italian dessert with layers of coffee-soaked ladyfingers and mascarpone cream.",
  image_url: "https://www.flavoursholidays.co.uk/wp-content/uploads/2020/07/Tiramisu.jpg",
  rating: 4.8
)

Recipe.create!(
  name: "Beef Stroganoff",
  description: "Tender beef cooked in a creamy mushroom sauce, served over egg noodles.",
  image_url: "https://www.allrecipes.com/thmb/mSWde3PHTu-fDkbvWBw0D1JlS8U=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/25202beef-stroganoff-iii-ddmfs-3x4-233-0f26fa477e9c446b970a32502468efc6.jpg",
  rating: 4.6
)

Recipe.create!(
  name: "Avocado Toast",
  description: "Sourdough toast topped with mashed avocado, cherry tomatoes, and a drizzle of olive oil.",
  image_url: "https://www.eatingwell.com/thmb/PM3UlLhM0VbE6dcq9ZFwCnMyWHI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/EatingWell-April-Avocado-Toast-Directions-04-5b5b86524a3d4b35ac4c57863f6095dc.jpg",
  rating: 4.5
)

Recipe.create!(
  name: "Tom Yum Soup",
  description: "Spicy and sour Thai soup with shrimp, lemongrass, lime leaves, and chili peppers.",
  image_url: "https://zarskitchen.com/wp-content/uploads/2021/02/screenshot-2021-02-21-at-23.39.40.png",
  rating: 4.7
)

Recipe.create!(
  name: "Chocolate Cake",
  description: "Rich and moist chocolate cake with dark chocolate ganache frosting.",
  image_url: "https://static.toiimg.com/thumb/53096885.cms?imgsize=1572013&width=800&height=800",
  rating: 4.9
)
