class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    # If creating user is successful
    #   redirect to gifs path
  # else
      # addd a message to flash.now that says we cant create user
      # render 'new'

    if @user.persisted?
      redirect_to gifs_path
    else
      flash.now[:error] = "Sorry, cannot create user. Please try again"
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
