class Potluck < ActiveRecord::Base
  has_many :attendees, class_name: :Rsvp
  has_many :dishes, through: :attendees
  belongs_to :host, class_name: :User

  validates :name, :location, :starts_at, presence: true
end
