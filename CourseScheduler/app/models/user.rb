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
ROLES = %i[instructor student]

 def roles=(roles)
   roles = [*roles].map { |r| r.to_sym }
   self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
 end

 def roles
   ROLES.reject do |r|
     ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
   end
 end

 def has_role?(role)
   roles.include?(role)
 end
  #has_and_belongs_to_many :courses
#  validates :email, presence: true
#  validates :phoneNum, numericality: {greater_than_or_equal_to: 100000000}
#  validates :phoneNum, numericality: {less_than_or_equal_to: 9999999999}

  def print_role(roles_mask)
    return User::TYPES[roles_mask]
  end

  def print_types()
    index = 0
    String tmp_string = ""
    while index <  User::TYPES.length
      if(index > 0)
        tmp_string += "; "
      end
      tmp_string += "#{index}=#{User::TYPES[index]}"
      index += 1
    end
    return tmp_string
  end

  TYPE_ROLES = [0, 1, 2]
  TYPES = ['Student', 'Instructor', 'Admin']
  COMPLETED = ['Pass', 'Fail', 'In Progress']
end
