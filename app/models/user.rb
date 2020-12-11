class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :lockable,
         :trackable,
         :invitable,
         :confirmable,
         :timeoutable,
         :recoverable,
         :validatable,
         :registerable,
         :rememberable,
         :database_authenticatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: self
end
