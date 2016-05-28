class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :status
      t.date :start_date
      t.date :due_date
      t.string :estimation
      t.references :project, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
