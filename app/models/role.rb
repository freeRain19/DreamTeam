class Role < ActiveRecord::Base
  has_many :users
  validates :name, inclusion: {in: ['admin','user'] }
end
