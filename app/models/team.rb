class Team < ActiveRecord::Base
  String name
  has_and_belongs_to_many :projects
  has_many :users
end
