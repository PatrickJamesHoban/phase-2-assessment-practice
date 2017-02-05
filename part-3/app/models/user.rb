class User < ActiveRecord::Base
  has_many :potlucks_attending, class_name: :Rsvp, foreign_key: :attendee_id
  has_many :potlucks_hosting, class_name: :Potluck, foreign_key: :host_id

  validates :username, :email, presence: true, uniqueness: true

  has_secure_password

end
