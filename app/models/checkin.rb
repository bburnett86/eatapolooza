class Checkin < ActiveRecord::Base
  belongs_to :person
  belongs_to :event
  belongs_to :user

  def self.parse_csv(file_location)
    checkin_strings = File.open(file_location).read.split("\n")
    checkin_strings[1..-1]. each do |line|
      attrs = line.split(",")
      league = League.find_or_create_by(name: attrs[2])
      person = Person.create_with(league_id: league.id).find_or_create_by(name: attrs[0])
      event = Event.find_or_create_by(name: attrs[2])
      Checkin.create!(person_id: person.id, event_id: event.id, weight: attrs[1], created_at: attrs[3])
    end
  end
end
