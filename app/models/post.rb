class Post < ActiveRecord::Base
  has_many :comments, :dependent => :delete_all
  belongs_to :task
  validates :content, length: {maximum: 50}, presence: true
  validates :task , presence: true#, inclusion: {in: Task.all}
end
