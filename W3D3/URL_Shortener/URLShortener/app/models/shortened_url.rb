class ShortenedURL < ApplicationRecord
  validates :short_url, presence: true, uniqueness: true
  
  belongs_to :submitter,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id
    
  has_many :visits,
    class_name: :Visit,
    primary_key: :id,
    foreign_key: :url_id
    
  has_many :visitors,
    through: :visits,
    source: :user
    
  def self.random_code
    string = SecureRandom.urlsafe_base64[0, 16]
    while exists?(:short_url=>string)
      string = SecureRandom.urlsafe_base64[0, 16]
    end
    
    string
  end
  
  def self.create!(user_id, long_url)
    short_url = ShortenedURL.random_code
    ShortenedURL.create(user_id: user_id, long_url: long_url, short_url: short_url)
  end
  
  def num_clicks
    visits.count
  end
  
  def num_uniques
    Visit.select(:user_id).distinct.length
  end
  
  def num_recent_uniques
    recent = Visit.select(:user_id).distinct.where('created_at > ?', 10.minutes.ago)
    recent.count
  end
end 