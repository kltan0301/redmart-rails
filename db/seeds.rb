# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require './app/models/product'
require 'faker'
# # For creating dummy category data
@categoryList = ['New', 'Marketplace', 'Fresh Produce', 'Meat & Seafood', 'Dairy & Chilled', 'Bakery', 'Frozen', 'Beverages', 'Food Cupboard', 'Alcohol', 'Health & Beauty', 'Household & Pet', 'Baby & Child', 'Home & Outdoor']

# Generate fake data for products
# (0..30).each do |_item|
#   Product.create(
#     name: Faker::Commerce.product_name,
#     price: Faker::Commerce.price,
#     brand: Faker::Company.name,
#     category: @categoryList.sample,
#     image_url: Faker::Placeholdit.image('150x150', 'jpg')
#   )
# end

@user_ids = User.pluck(:id)
@product_ids = Product.pluck(:id)

# Generate fake data for reviews
(0..5).each {|item|
  User.find(@user_ids.sample).reviews.create(
    product_id: @product_ids.sample,
    content: Faker::Company.catch_phrase,
    rating: [1,2,3,4,5].sample
  )
}
