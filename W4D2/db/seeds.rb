# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
cat1 = Cat.create!(birth_date: '2000/01/20', color: :blue, name: :Theodore, sex: :M)
cat2 = Cat.create!(birth_date: '2000/01/20', color: :red, name: :Max, sex: :M)
cat3 = Cat.create!(birth_date: '2000/01/20', color: :purple, name: :James, sex: :M)
# Cat.create!(birth_date: '2000/01/20', color: :black, name: :Sydney, sex: :F)
# Cat.create!(birth_date: '2000/01/20', color: :green, name: :Sam, sex: :F)

CatRentalRequest.destroy_all
CatRentalRequest.create!(cat_id: cat1.id, start_date: '2000/06/01', end_date: '2000/06/05')
CatRentalRequest.create!(cat_id: cat1.id, start_date: '2001/06/01', end_date: '2001/06/05')
CatRentalRequest.create!(cat_id: cat2.id, start_date: '2002/06/01', end_date: '2002/06/05')
CatRentalRequest.create!(cat_id: cat2.id, start_date: '2000/06/01', end_date: '2000/06/05')
CatRentalRequest.create!(cat_id: cat3.id, start_date: '2000/06/01', end_date: '2000/06/05')
