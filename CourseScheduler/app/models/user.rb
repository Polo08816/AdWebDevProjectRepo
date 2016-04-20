class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  has_and_belongs_to_many :courses
#  validates :email, presence: true
#  validates :phoneNum, numericality: {greater_than_or_equal_to: 100000000}
#  validates :phoneNum, numericality: {less_than_or_equal_to: 9999999999}

  TYPES = ['Student', 'Instructor']
end
