# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create! do |user|
  user.full_name = 'Elaine Marino'
  user.email = 'elaine.c.marino@gmail.com'
  user.password = 'boulder'
  user.password_confirmation = 'boulder'
end

Category.create!(title: 'Food')
Category.create!(title: 'Boulder Tech')
Category.create!(title: 'Fitness')
Category.create!(title: 'Friends')
Category.create!(title: 'Inspirational')

