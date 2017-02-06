class Potluck < ActiveRecord::Base
  has_many :attendees, class_name: :Rsvp
  belongs_to :host, class_name: :User

  validates :name, :location, :starts_at, presence: true

  def self.select_future_potlucks
    Time.zone = "UTC"
    selected_events = Potluck.all.select { |event| event.starts_at.to_date >= Time.zone.today }
    selected_events.sort_by { |event| event.starts_at }
  end
end
