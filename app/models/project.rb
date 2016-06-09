class Project < ActiveRecord::Base
  has_many :tasks
  has_and_belongs_to_many :teams
  validates :name, length: {maximum: 130},presence: true,uniqueness: {case_sensitive: false}
  validates :summary,length: {maximum: 50}, presence: true
  validates :start_date, date: {after: Proc.new { Date.today -1}, message: 'Must be after yesterday'},
            on: :create
  validates :end_date, date: {after: Proc.new {:start_date}, message: 'Must be after Start day'},
            on: :create

  private
  def self.search_by_name(search_name)
    projects=Project.where('name like ?', "%#{search_name}%")
  end
end
