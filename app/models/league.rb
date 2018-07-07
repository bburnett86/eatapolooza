class League < ActiveRecord::Base
    has_many :people
    has_many :events, through: :people
end
