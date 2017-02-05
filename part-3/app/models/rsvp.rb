class Rsvp < ActiveRecord::Base
  validates :dish, presence: true, uniqueness: true
  
end
