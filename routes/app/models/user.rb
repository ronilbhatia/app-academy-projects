# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :views,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare

  has_many :viewed_artworks,
    through: :views,
    source: :artwork

end
