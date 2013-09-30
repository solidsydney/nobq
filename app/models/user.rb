class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :contestant
  # attr_accessible :title, :body

  has_many :authentications
  has_one :profile
  has_many :images, :through => :profile, :source => :pictures



  after_create :create_profile
  scope :is_contestant, -> { where(contestant: true )}
  scope :not_contestant, -> { where(contestant: false) }


  private

  def create_profile
    self.profile = Profile.create
  end

  def contestant?
    where contestant=true
  end

end
