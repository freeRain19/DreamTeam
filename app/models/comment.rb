class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates :message, length: {minimum: 1 ,maximum: 100},presence: true
 # validates :user,presence: true, inclusion: {in: User.all}
 # validates :post,presence: true
end
