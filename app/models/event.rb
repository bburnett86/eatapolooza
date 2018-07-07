class Event < ActiveRecord::Base
  default_scope { order(created_at: :asc) }

  validates :name, presence: true
  
  has_many :league_event_joins
  has_many :leagues, through: :league_event_joins
  has_many :checkins
  has_many :people, -> { distinct }, through: :checkins
  has_many :leagues, through: :people

  def set_starting_weight
    self.people.each do |person|
      person.starting_weight = person.checkins.first.weight.to_digits
    end
  end
end
