class Users::SessionsController < Devise::SessionsController
  respond_to :json
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  # GET /login
  def new
    super
  end 

  # POST /login
  def create
    user = User.find_for_database_authentication(email: params[:user][:email])
    
    if user&.valid_password?(params[:user][:password])
      sign_in user
      token = Warden::JWTAuth::UserEncoder.new.call(user, :user, nil)
      render json: { message: "Login successful", user: user.as_json(only: [:id, :email]), token: token }, status: :created
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  def destroy
    super
  end
end