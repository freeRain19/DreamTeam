class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.references :task, index: true, foreign_key: true
    end
  end
end
