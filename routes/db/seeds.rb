# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.destroy_all

  ronil = User.create!(username: "ronil")
  zaniar = User.create!(username: "zaniar")

  Artwork.create!(title: 'Untitled1', artist_id: ronil.id, image_url: 'ronil.me')
  Artwork.create!(title: 'Untitled1', artist_id: zaniar.id, image_url: 'zaniar.me')
  Artwork.create!(title: 'Nice site', artist_id: ronil.id, image_url: 'google.com')
end
