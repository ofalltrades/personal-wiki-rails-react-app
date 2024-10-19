class User < ApplicationRecord
  has_many :wikis

  devise :database_authenticatable, :registerable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
end