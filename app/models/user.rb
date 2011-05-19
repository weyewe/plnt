class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  ROLES_HASH = { :entry  => 1, 
                :director => 2 ,
                :admin => 3 }
  
  def has_role? (role_symbol)
    self.role_id == ROLES_HASH[role_symbol]
  end
  
end
