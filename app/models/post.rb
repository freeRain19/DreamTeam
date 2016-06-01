class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :task
  validates :content, length: {maximum: 50},presence: true
  validates :task , inclusion: {in: Task.all},presence: true
end
