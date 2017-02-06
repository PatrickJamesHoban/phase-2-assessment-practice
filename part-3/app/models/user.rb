class User < ActiveRecord::Base
  has_many :potlucks_attending, class_name: :Rsvp, foreign_key: :attendee_id
  has_many :potlucks_hosting, class_name: :Potluck, foreign_key: :host_id


  has_secure_password
  
  validates :username, :email, presence: true, uniqueness: true

  validates :password, presence: true, confirmation: true, length: { minimum: 2 }

end
