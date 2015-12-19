class MessagesController < ApplicationController
  def index; end

  def create
    ActionCable.server.broadcast "messages",
      message: params[:message][:body],
      username: cookies.signed[:username]

    head :ok
  end
end
