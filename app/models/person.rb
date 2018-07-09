class Person < ActiveRecord::Base
  validates :name, :league_id, presence: true

  has_many :checkins
  has_many :user_person_joins
  has_many :users, through: :user_person_joins
  belongs_to :league

  def up_by(event_league)
    if event_league.class.name == "Event"
      checkins_from_params = event_league.checkins.where(person: self).order(:created_at)
    elsif event_league.class.name == "League"
      checkins_from_params = event_league.people.where(person: self).order(:created_at).checkins
    else
      return attributes['up_by']
    end
    @starting_weight = checkins_from_params.first.weight
    first_checkin = checkins_from_params.first
    last_checkin = checkins_from_params.last
    @up_by = last_checkin == first_checkin ? nil : last_checkin.weight - first_checkin.weight
    return @up_by
  end

  def percentage_change
    return unless @up_by
    (@up_by / @starting_weight * 100).to_f
  end

  def checkin_diffs
    grouped = checkins.includes(:event).order('events.created_at').group_by(&:event)
    event_diffs = {}
    grouped.each_pair do |event, event_checkins|
      diffs = event_checkins.sort_by(&:created_at).map(&:delta).compact
      event_diffs[event.try(:name)] = diffs.map { |d| '%.2f' % d }
    end
    event_diffs
  end

  def self.parse_csv(file_location)
    people_strings = File.open(file_location).read.split("\n")
    people_strings[1..-1].each do |line|
      attrs = line.split(",")
      person = Person.find_or_create_by(name: attrs[0])
      person.update!(league_id: rand(1..6))
      person.save
    end
  end
end
