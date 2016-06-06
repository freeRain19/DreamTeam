class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  before_save { self.email = email.downcase }

  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :first_name, length: {minimum: 2, maximum: 20}
  validates :last_name, length: {minimum: 2, maximum: 20}


  belongs_to :team
  belongs_to :role

  has_many :tasks
  has_many :comments


  #---------------------------------------------

  def total_tasks
    write_attribute :total_tasks, 100
  end

  def to_s
    "email = "+email+"  |  firt_name = "+first_name + "  |  last_name " + last_name + "  |  team  " + team.name
  end

  def has_role?(role)
    #return !!self.roles.find_by_name(role.to_s.camelize)
    return self.role.name==role.to_s
  end
end
