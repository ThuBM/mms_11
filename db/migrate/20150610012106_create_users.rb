class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.datetime :birthday
      t.string :action
      t.string :role

      t.timestamps null: false
    end
  end
end
