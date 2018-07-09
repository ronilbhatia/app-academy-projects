class Artwork < ApplicationRecord
  validates :title, uniqueness: { scope: :artist_id }
  validates :artist_id, :title, :image_url, presence: true
end
