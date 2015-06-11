class AddStatusToProjectUsers < ActiveRecord::Migration
  def change
    add_column :project_users, :status, :string
  end
end
