class Checkin < ActiveRecord::Base
  validates :weight, :person_id, :event_id, presence: true
  validates :weight, :person_id, :event_id, numericality: true
  belongs_to :person
  belongs_to :event
  belongs_to :user

  def self.parse_csv(file_location)
    checkin_strings = File.open(file_location).read.split("\n")
    checkin_strings[1..-1]. each do |line|
      attrs = line.split(",")
      person = Person.find_or_create_by(name: attrs[0])
      event = Event.find_or_create_by(name: attrs[2])
      Checkin.create!(person_id: person.id, event_id: event.id, weight: attrs[1], created_at: attrs[3])
    end
  end
end
