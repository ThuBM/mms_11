class Project < ActiveRecord::Base
  has_many :project_users
  has_many :members, class_name: "User", through: :project_users, source: :user
  belongs_to :team
  belongs_to :leader, class_name: "User", inverse_of: :project
end
