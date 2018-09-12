# == Schema Information
#
# Table name: benches
#
#  id          :bigint(8)        not null, primary key
#  description :string           not null
#  lat         :float            not null
#  lng         :float            not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Bench < ApplicationRecord
  validates :description, :lat, :lng, null: false
end
