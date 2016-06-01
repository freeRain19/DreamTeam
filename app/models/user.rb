class User < ActiveRecord::Base


  devise :database_authenticatable, :registerable,
          :rememberable, :validatable
  before_save { self.email = email.downcase }
  validates :email, presence: true,uniqueness: {case_sensitive: false}
  validates :first_name, length: {minimum: 2,maximum: 20},presence: true
  validates :last_name, length: {minimum: 2,maximum: 20},presence: true
  validates :team, inclusion: {in: Team.all}
  belongs_to :team
  belongs_to :role
  has_many :tasks
  has_many :comments


#---------------------------------------------




  def has_role?(role)
    #return !!self.roles.find_by_name(role.to_s.camelize)
   return  self.role.name==role.to_s
  end
end
