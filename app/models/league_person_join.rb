class LeaguePersonJoin < ActiveRecord::Base
  belongs_to :league
  belongs_to :person
end
