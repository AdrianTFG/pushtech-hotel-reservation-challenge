class Authentication::UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)

    @user.token = get_unique_token

    if @user.save
      session[:user_id] = @user.id
      redirect_to reservations_path, notice: t('.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end

  def get_unique_token
    token_seted = false
    while !token_seted
      random_token = SecureRandom.hex(10)
      if User.find_by_token(random_token).nil?
        token_seted = true
      end
    end
    random_token
  end

end