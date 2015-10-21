class SessionsController < ApplicationController

  def create
    current_user = (params[:session][:username])
    cookies.signed[:username] = params[:session][:username]
    @user = User.create(name: params[:session][:username])
    cookies.signed[:user_id] = @user.id
    #redirect_to messages_path(@user.id)
    redirect_to groups_path
  end

  def show_cookies
    @user_name = cookies[:username]
  end

  def delete_cookies
    cookies.signed[:username] = nil
    @user = User.find(params[:id])
    @user.destroy
  end

end
