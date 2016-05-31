class CreateUsers < ActiveRecord::Migration
  def change
    ## Database authenticatable
    update_table :users do |t|
      t.string :email,              :null => false, :default => ''
      t.string :encrypted_password, :null => false, :default => ''
      t.string :first_name
      t.string :last_name
      t.string :role
      t.references :task, index: true, foreign_key: true
    end
  end
end
