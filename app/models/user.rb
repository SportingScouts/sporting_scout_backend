class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
end

#------------------------------------------------------------------------------
# User
#
# Name                   SQL Type             Null    Primary Default
# ---------------------- -------------------- ------- ------- ----------
# id                     bigint               false   true              
# email                  character varying    false   false             
# encrypted_password     character varying    false   false             
# reset_password_token   character varying    true    false             
# reset_password_sent_at timestamp(6) without time zone true    false             
# remember_created_at    timestamp(6) without time zone true    false             
# created_at             timestamp(6) without time zone false   false             
# updated_at             timestamp(6) without time zone false   false             
# jti                    character varying    false   false             
#
#------------------------------------------------------------------------------
