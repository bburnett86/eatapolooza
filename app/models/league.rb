class League < ActiveRecord::Base
    has_many :league_person_joins
    has_many :people, through: :league_person_joins
    has_many :league_event_joins
    has_many :events, through: :league_event_joins
end
