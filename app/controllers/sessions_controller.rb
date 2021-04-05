class SessionsController < ApplicationController
  def new
  end

  def create
    # Find user by email
    # if this user is authenticated
    #   Add the user id to the session
    #   Redirect to gifs_path
    # Else
    #   Add message to flash.now
    #   Render new
    @user = User.find_by(email: session_params[:email])

    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to gifs_path
    else
      flash.now[:error] = "Could not log in. Please check your email and password."
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end
