class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to github_users_path, :notice => "Signed in!"
  end

  def destroy
    # User.find_by(id: current_user.id).destroy
    session.clear
    redirect_to root_url, :notice => "Signed out!"
  end
end
