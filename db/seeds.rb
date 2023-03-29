# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

films = [
  { name: "The Shawshank Redemption", year: 1994},
  { name: "The Godfather", year: 1972},
  { name: "The Dark Knight", year: 2008},
  { name: "The Godfather 2", year: 1974}
]
films.each do |film|
    Film.create(film)
end