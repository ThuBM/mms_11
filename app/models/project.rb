class Project < ActiveRecord::Base
  has_many :project_users
  belongs_to :team
end
