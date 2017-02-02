# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.create(name: 'New Product', price: 150.3, description: 'This is a new product.', status: true)
Product.create(name: 'New Product 2', price: 152.3, description: 'This is a new product 2.', status: true)
Product.create(name: 'New Product 3', price: 154.3, description: 'This is a new product 3.', status: true)