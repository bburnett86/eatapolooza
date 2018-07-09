class Event < ActiveRecord::Base
  default_scope { order(created_at: :asc) }

  validates :name, presence: true
  
  has_many :league_event_joins
  has_many :leagues, -> { distinct }, through: :league_event_joins
  has_many :checkins
  has_many :people, -> { distinct }, through: :checkins

  def set_starting_weight
    self.people.each do |person|
      person.starting_weight = person.checkins.first.weight.to_digits
    end
  end
end
