class Team < ActiveRecord::Base
  has_and_belongs_to_many :projects
  has_many :users
  validates :name , length: {maximum: 20},presence: true,uniqueness: {case_sensitive: false}
end