class League < ActiveRecord::Base
    validates :name, presence: true
    
    has_many :people
    has_many :league_event_joins
    has_many :events, through: :league_event_joins
end
