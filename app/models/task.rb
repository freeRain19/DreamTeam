class Task < ActiveRecord::Base
  has_many :posts
  belongs_to :user
  belongs_to :project
  validates :title,presence: true, length: {maximum: 80}
  validates :status, length: {maximum: 10}
  validates :start_date
end
