class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      profile = Profile.find_by(user_id: user.id)
      if profile
        redirect_to profile_url profile.id, :notice => "Logged in"
      else
        profile = Profile.create(user_id: user.id)
        redirect_to profile_url profile.id, :notice => "Logged in"
      end

    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end     
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
