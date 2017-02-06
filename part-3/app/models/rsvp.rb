class Rsvp < ActiveRecord::Base
  belongs_to :attendee, class_name: :User
  belongs_to :potluck

  validates :dish, presence: true, uniqueness: true

end
