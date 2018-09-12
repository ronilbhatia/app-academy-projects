# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CatRentalRequest < ApplicationRecord
  STATUS = ['APPROVED', 'DENIED', 'PENDING']
  
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: STATUS } 
  
  belongs_to :cat,
    foreign_key: :cat_id,
    class_name: :Cat
    
  def overlapping_requests
    CatRentalRequest
      .where(cat_id: self.cat_id)
      .where.not(id: self.id)
      .where.not("start_date > ? OR end_date < ?", self.end_date, self.start_date)
  end 
  
  def overlapping_approved_requests
    overlapping_requests.select { |request| request.status == 'APPROVED' }
  end
  
  def does_not_overlap_approved_requests?
    overlapping_approved_requests.empty?
  end
end
