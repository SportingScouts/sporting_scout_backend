class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  def generate_jwt
    JWT.encode({ id: id,
                 exp: 60.days.from_now.to_i },
               Rails.application.secrets.secret_key_base)
  end
end

#------------------------------------------------------------------------------
# User
#
# Name                SQL Type             Null    Primary Default
# ------------------- -------------------- ------- ------- ----------
# id                  bigint               false   true
# email               character varying    false   false
# encrypted_password  character varying    false   false
# remember_created_at timestamp(6) without time zone true    false
# created_at          timestamp(6) without time zone false   false
# updated_at          timestamp(6) without time zone false   false
# jti                 character varying    false   false
#
#------------------------------------------------------------------------------
