class LeagueEventJoin < ActiveRecord::Base
  validates :event_id, :league_id, presence: true
  validates :event_id, :league_id, numericality:{ integer: true }
  belongs_to :event
  belongs_to :league
end
