class SessionsController < ApplicationController
  def create
    if user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      redirect_to users_dashboard_path if user.viewer?
      redirect_to producer_users_dashboard_path if user.producer?
      redirect_to admin_users_dashboard_path if user.admin?
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
