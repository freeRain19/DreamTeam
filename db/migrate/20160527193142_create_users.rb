class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      #t.references :team, foreign_key: true
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :role

    end
  end
end
