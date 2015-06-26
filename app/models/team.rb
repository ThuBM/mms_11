class Team < ActiveRecord::Base
  has_many :user_teams
  has_many :members, class_name: "User", through: :user_teams, source: :user
  belongs_to :leader, class_name: "User", inverse_of: :team
end
