class Rsvp < ActiveRecord::Base
  has_many :attendees, class_name: :User
  belongs_to :potluck

  validates :dish, presence: true, uniqueness: true

end
