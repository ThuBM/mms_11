class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_positions
  has_many :positions, through: :user_positions
  has_many :user_teams
  has_many :teams, through: :user_teams, source: :team
  has_many :user_skills
  has_many :skills, through: :user_skills
  has_many :project_users, -> {order(updated_at: :desc)}
  has_many :projects, through: :project_users
  belongs_to :team, inverse_of: :leader
end
