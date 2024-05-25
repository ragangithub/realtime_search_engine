# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

articles = Article.create([
  { name: "Exploring AI Advancements" },
  { name: "Sustainable Living Solutions" },
  { name: "Unveiling Cutting-Edge Technologies" },
  { name: "Tech Innovations Shaping the Future" },
  { name: "Revolutionizing Healthcare with Science" },
  { name: "The Digital Economy Boom" },
  { name: "Reshaping Business Dynamics" },
  { name: "Urbanization and Modernization" },
  { name: "Towards a Greener Tomorrow" },
  { name: "Innovative Breakthroughs Unleashed" },
  { name: "Securing Data in the Digital Age" },
  { name: "Navigating Ethical Challenges" },
  { name: "Transforming Manufacturing Processes" },
  { name: "Industries in the Era of Transformation" },
  { name: "The Wellness Revolution" },
  { name: "Emerging Realities in the Digital World" },
  { name: "Building a Connected Society" },
  { name: "Ensuring Information Security" },
  { name: "The Impact of Sustainable Savings" },
  { name: "The Next Generation of Technology" }
])
