class UserPersonJoin < ActiveRecord::Base
  validates :user_id, :person_id, presence: true
  validates :user_id, :person_id, numericality:{ integer: true }

  belongs_to :user
  belongs_to :person
end
