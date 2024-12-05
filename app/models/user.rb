class User < ApplicationRecord
  has_many :wikis

  devise :database_authenticatable, :registerable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  def jwt
    JWT.encode({ user_id: id }, Rails.application.credentials.devise.jwt_secret_key, 'HS256')
  end

  def on_jwt_dispatch(token, payload); end
end