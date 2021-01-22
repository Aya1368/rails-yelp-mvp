# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."

Restaurant::CATEGORY.each do |c|
  restaurant = Restaurant.create!(name: Faker::Restaurant.name, address: Faker::Address.street_address, phone_number: Faker::PhoneNumber.cell_phone, category: c)
  puts "Created #{restaurant.name}"
  (0..5).each  do |review_no|
    review = Review.create!(rating: rand(0..5), content: Faker::Lorem.paragraph(sentence_count: 2), restaurant_id: restaurant.id)
  end
end
puts "Finished!"
