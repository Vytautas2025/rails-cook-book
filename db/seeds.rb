require "open-uri"
require "json"


puts "Cleaning the database..."
Recipe.destroy_all
Category.destroy_all

puts "Creating categories..."

categories = ["Breakfast", "Pasta", "Seafood", "Dessert"]

image_urls = {
  "Breakfast" => "https://images.unsplash.com/photo-1623265301182-6d187dfa9d92?q=80&w=2070&auto=format&fit=crop",
  "Pasta" => "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?q=80&w=2080&auto=format&fit=crop",
  "Seafood" => "https://images.unsplash.com/photo-1615141982883-c7ad0e69fd62?q=80&w=1974&auto=format&fit=crop",
  "Dessert" => "https://images.unsplash.com/photo-1488477181946-6428a0291777?q=80&w=1974&auto=format&fit=crop"
}

categories.each do |category_name|
  category = Category.find_or_create_by!(name: category_name)

  category.photo.attach(
    io: URI.open(image_urls[category_name]),
    filename: "#{category_name.downcase}.jpg",
    content_type: "image/jpeg"
  )
end

puts "✅ Categories created successfully!"


categories.each do |category|
  puts "Fetching recipes for category: #{category}..."

  url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=#{category}"
  serialized_data = URI.open(url).read
  meals = JSON.parse(serialized_data)["meals"]

  meals.each do |meal|
    puts "Creating recipe: #{meal['strMeal']}"

    Recipe.find_or_create_by!(
      name: meal["strMeal"],
      image_url: meal["strMealThumb"],
      description: "#{category} dish",
      rating: rand(4.0..5.0)
    )
  end
end


puts "Adding predefined recipes..."
static_recipes = [
  {
    name: "Tiramisu",
    description: "Classic Italian dessert with layers of coffee-soaked ladyfingers and mascarpone cream.",
    image_url: "https://www.flavoursholidays.co.uk/wp-content/uploads/2020/07/Tiramisu.jpg",
    rating: 4.8
  },
  {
    name: "Beef Stroganoff",
    description: "Tender beef cooked in a creamy mushroom sauce, served over egg noodles.",
    image_url: "https://www.allrecipes.com/thmb/mSWde3PHTu-fDkbvWBw0D1JlS8U=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/25202beef-stroganoff-iii-ddmfs-3x4-233-0f26fa477e9c446b970a32502468efc6.jpg",
    rating: 4.6
  },
  {
    name: "Avocado Toast",
    description: "Sourdough toast topped with mashed avocado, cherry tomatoes, and a drizzle of olive oil.",
    image_url: "https://www.eatingwell.com/thmb/PM3UlLhM0VbE6dcq9ZFwCnMyWHI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/EatingWell-April-Avocado-Toast-Directions-04-5b5b86524a3d4b35ac4c57863f6095dc.jpg",
    rating: 4.5
  },
  {
    name: "Tom Yum Soup",
    description: "Spicy and sour Thai soup with shrimp, lemongrass, lime leaves, and chili peppers.",
    image_url: "https://zarskitchen.com/wp-content/uploads/2021/02/screenshot-2021-02-21-at-23.39.40.png",
    rating: 4.7
  },
  {
    name: "Chocolate Cake",
    description: "Rich and moist chocolate cake with dark chocolate ganache frosting.",
    image_url: "https://static.toiimg.com/thumb/53096885.cms?imgsize=1572013&width=800&height=800",
    rating: 4.9
  }
]

static_recipes.each do |recipe|
  Recipe.find_or_create_by!(recipe)
end

puts "✅ Seeding complete!"
