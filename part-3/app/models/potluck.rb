class Potluck < ActiveRecord::Base
  validates :name, :location, :starts_at, presence: true


end
