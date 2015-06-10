class User < ActiveRecord::Base
  has_many :user_positions
  has_many :positions, through: :user_positions
  has_many :user_teams
  has_many :teams, through: :user_teams
  has_many :user_skills
  has_many :skills, through: :user_skills
  has_many :project_users
  has_many :projects, through: :project_users
  belongs_to :team, inverse_of: :leader
end
