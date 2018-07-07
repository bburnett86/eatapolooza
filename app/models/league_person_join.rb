class LeaguePersonJoin < ActiveRecord::Base
  validates :person_id, :league_id, presence: true
  validates :person_id, :league_id, numericality:{ integer: true }

  belongs_to :league
  belongs_to :person
end
