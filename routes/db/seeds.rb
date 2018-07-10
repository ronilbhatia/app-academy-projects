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

  r1 = Artwork.create!(title: 'Untitled1', artist_id: ronil.id, image_url: 'ronil.me')
  z1 = Artwork.create!(title: 'Untitled1', artist_id: zaniar.id, image_url: 'zaniar.me')
  r2 = Artwork.create!(title: 'Nice site', artist_id: ronil.id, image_url: 'google.com')

  ArtworkShare.create!(artwork_id: r1.id, viewer_id: zaniar.id)
  ArtworkShare.create!(artwork_id: r2.id, viewer_id: zaniar.id)
  ArtworkShare.create!(artwork_id: z1.id, viewer_id: ronil.id)
end
