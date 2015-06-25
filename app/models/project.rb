class Project < ActiveRecord::Base
  has_many :project_users
  belongs_to :team
  belongs_to :leader, class_name: "User", inverse_of: :project
end
