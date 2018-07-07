class Event < ActiveRecord::Base
  default_scope { order(created_at: :asc) }

  has_many :checkins
  has_many :people, -> { distinct }, through: :checkins
  has_many :leagues, through: :people

  def set_starting_weight
    self.people.each do |person|
      person.starting_weight = person.checkins.first.weight.to_digits
    end
  end
end
