class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :summary
      t.date :start_date
      t.date :end_date
    end
  end
end
