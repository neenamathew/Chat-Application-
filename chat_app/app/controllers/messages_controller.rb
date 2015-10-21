class MessagesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @user = User.find(cookies.signed[:user_id])
    
  end

  def create
    group = Group.find(params[:message][:group_id])
    # @message = Message.create(message: params[:message][:body],group_name: params[:format])

    ActionCable.server.broadcast "messages_#{group.name}",
      message: params[:message][:body],
      username: cookies.signed[:username],
      groupname: group.name

    head :ok
  end

end
