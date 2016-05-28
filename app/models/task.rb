class Task < ActiveRecord::Base
  has_many :posts
  belongs_to :user
  belongs_to :project
end
