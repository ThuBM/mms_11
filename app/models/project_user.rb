class ProjectUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  delegate :name, :abbreviation, :start_date, :end_date, 
    to: :project, prefix: true, allow_nil: true
end
