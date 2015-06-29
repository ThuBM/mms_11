class Team < ActiveRecord::Base
  has_many :user_teams
  has_many :members, class_name: "User", through: :user_teams, source: :user
  belongs_to :leader, class_name: "User", inverse_of: :team
  accepts_nested_attributes_for :user_teams, allow_destroy: true
end
