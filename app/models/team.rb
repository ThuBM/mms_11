class Team < ActiveRecord::Base
  has_many :user_teams
  has_many :members, class_name: "User", through: :user_teams, source: :user
  has_one :leader, class_name: "User", foreign_key: "id"
end
