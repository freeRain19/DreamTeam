class AddIndexToTeam < ActiveRecord::Migration
  def change
    add_index :teams, :name, :unique => true
    add_index :tasks, :title, :unique => true
    add_index :projects, :name, :unique => true
  end
end
