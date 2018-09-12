# == Schema Information
#
# Table name: albums
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  year       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  band_id    :integer
#  album_type :string           default("Studio"), not null
#

class Album < ApplicationRecord
  validates :title, :year, presence: true

  after_initialize :set_as_studio

  belongs_to :band,
    foreign_key: :band_id,
    class_name: :Band

  def set_as_studio
    self.album_type = 'Studio'
  end
end
