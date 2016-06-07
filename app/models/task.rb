class Task < ActiveRecord::Base
  has_many :posts, :dependent => :destroy
  belongs_to :user
  belongs_to :project
  validates :title, presence: true, length: {maximum: 80}, uniqueness: {case_sensitive: false}
  validates :status, length: {maximum: 15}
  validates :start_date, date: {after: Proc.new { Date.today -1 }, message: 'Must be after yesterday'},
            on: :create
  validates :due_date, date: {after: Proc.new { :start_date }, message: 'Must be after Start day'},
            on: :create



end
